-----------------------------------------------------------------------
--  ado-schemas-entities -- Entity types cache
--  Copyright (C) 2011, 2012, 2017 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------

with Util.Log.Loggers;

with ADO.SQL;
with ADO.Statements;
with ADO.Model;
package body ADO.Schemas.Entities is

   use Util.Log;

   Log : constant Loggers.Logger := Loggers.Create ("ADO.Schemas.Entities");

   --  ------------------------------
   --  Expand the name into a target parameter value to be used in the SQL query.
   --  The Expander can return a T_NULL when a value is not found or
   --  it may also raise some exception.
   --  ------------------------------
   overriding
   function Expand (Instance : in out Entity_Cache;
                    Name     : in String) return ADO.Parameters.Parameter is
      Pos : constant Entity_Map.Cursor := Instance.Entities.Find (Name);
   begin
      if not Entity_Map.Has_Element (Pos) then
         Log.Error ("No entity type associated with table {0}", Name);
         raise No_Entity_Type with "No entity type associated with table " & Name;
      end if;
      return ADO.Parameters.Parameter '(T => ADO.Parameters.T_INTEGER,
                                        Len => 0, Value_Len => 0, Position => 0,
                                        Name => "",
                                        Num => Entity_Type'Pos (Entity_Map.Element (Pos)));
   end Expand;

   --  ------------------------------
   --  Find the entity type index associated with the given database table.
   --  Raises the No_Entity_Type exception if no such mapping exist.
   --  ------------------------------
   function Find_Entity_Type (Cache : in Entity_Cache;
                              Table : in Class_Mapping_Access) return ADO.Entity_Type is
   begin
      return Find_Entity_Type (Cache, Table.Table);
   end Find_Entity_Type;

   --  ------------------------------
   --  Find the entity type index associated with the given database table.
   --  Raises the No_Entity_Type exception if no such mapping exist.
   --  ------------------------------
   function Find_Entity_Type (Cache : in Entity_Cache;
                              Name  : in Util.Strings.Name_Access) return ADO.Entity_Type is
      Pos : constant Entity_Map.Cursor := Cache.Entities.Find (Name.all);
   begin
      if not Entity_Map.Has_Element (Pos) then
         Log.Error ("No entity type associated with table {0}", Name.all);
         raise No_Entity_Type with "No entity type associated with table " & Name.all;
      end if;
      return Entity_Type (Entity_Map.Element (Pos));
   end Find_Entity_Type;

   --  ------------------------------
   --  Initialize the entity cache by reading the database entity table.
   --  ------------------------------
   procedure Initialize (Cache   : in out Entity_Cache;
                         Session : in out ADO.Sessions.Session'Class) is
      use type Ada.Containers.Count_Type;

      Query : ADO.SQL.Query;
      Stmt  : ADO.Statements.Query_Statement
        := Session.Create_Statement (ADO.Model.ENTITY_TYPE_TABLE'Access);
   begin
      Stmt.Set_Parameters (Query);
      Stmt.Execute;
      while Stmt.Has_Elements loop
         declare
            Id   : constant ADO.Entity_Type := ADO.Entity_Type (Stmt.Get_Integer (0));
            Name : constant String := Stmt.Get_String (1);
         begin
            Cache.Entities.Insert (Key => Name, New_Item => Id);
         end;
         Stmt.Next;
      end loop;

   exception
      when others =>
         null;
   end Initialize;

end ADO.Schemas.Entities;
