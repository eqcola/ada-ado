-----------------------------------------------------------------------
--  Samples.User.Model -- Samples.User.Model
--  Copyright (C) 2009, 2010 Stephane Carrez
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
with Ada.Unchecked_Deallocation;
with ADO.Databases;
package body Samples.User.Model is
   procedure Set_Field (Object : in out User_Ref'Class;
                        Impl   : out User_Ref_Access;
                        Field  : in Positive) is
   begin
      Object.Set_Field (Field);
      Impl := User_Ref_Impl (Object.Get_Object.all)'Access;
   end Set_Field;
   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out User_Ref) is
      Impl : User_Ref_Access;
   begin
      Impl := new User_Ref_Impl;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;
   -- ----------------------------------------
   --  Data object: User_Ref
   -- ----------------------------------------
   procedure Set_Id (Object : in out User_Ref;
                      Value  : in ADO.Identifier) is
      Impl : User_Ref_Access;
   begin
      Set_Field (Object, Impl, 1);
      Impl.Id := Value;
   end Set_Id;
   function Get_Id (Object : in User_Ref)
                  return ADO.Identifier is
      Impl : constant User_Ref_Access := User_Ref_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Id;
   end Get_Id;
   procedure Set_Name (Object : in out User_Ref;
                        Value : in String) is
   begin
      Object.Set_Name (To_Unbounded_String (Value));
   end Set_Name;
   procedure Set_Name (Object : in out User_Ref;
                        Value  : in Unbounded_String) is
      Impl : User_Ref_Access;
   begin
      Set_Field (Object, Impl, 3);
      Impl.Name := Value;
   end Set_Name;
   function Get_Name (Object : in User_Ref)
                 return String is
   begin
      return To_String (Object.Get_Name);
   end Get_Name;
   function Get_Name (Object : in User_Ref)
                  return Unbounded_String is
      Impl : constant User_Ref_Access := User_Ref_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Name;
   end Get_Name;
   procedure Set_Email (Object : in out User_Ref;
                         Value : in String) is
   begin
      Object.Set_Email (To_Unbounded_String (Value));
   end Set_Email;
   procedure Set_Email (Object : in out User_Ref;
                         Value  : in Unbounded_String) is
      Impl : User_Ref_Access;
   begin
      Set_Field (Object, Impl, 4);
      Impl.Email := Value;
   end Set_Email;
   function Get_Email (Object : in User_Ref)
                 return String is
   begin
      return To_String (Object.Get_Email);
   end Get_Email;
   function Get_Email (Object : in User_Ref)
                  return Unbounded_String is
      Impl : constant User_Ref_Access := User_Ref_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Email;
   end Get_Email;
   procedure Set_Date (Object : in out User_Ref;
                        Value : in String) is
   begin
      Object.Set_Date (To_Unbounded_String (Value));
   end Set_Date;
   procedure Set_Date (Object : in out User_Ref;
                        Value  : in Unbounded_String) is
      Impl : User_Ref_Access;
   begin
      Set_Field (Object, Impl, 5);
      Impl.Date := Value;
   end Set_Date;
   function Get_Date (Object : in User_Ref)
                 return String is
   begin
      return To_String (Object.Get_Date);
   end Get_Date;
   function Get_Date (Object : in User_Ref)
                  return Unbounded_String is
      Impl : constant User_Ref_Access := User_Ref_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Date;
   end Get_Date;
   procedure Set_Description (Object : in out User_Ref;
                               Value : in String) is
   begin
      Object.Set_Description (To_Unbounded_String (Value));
   end Set_Description;
   procedure Set_Description (Object : in out User_Ref;
                               Value  : in Unbounded_String) is
      Impl : User_Ref_Access;
   begin
      Set_Field (Object, Impl, 6);
      Impl.Description := Value;
   end Set_Description;
   function Get_Description (Object : in User_Ref)
                 return String is
   begin
      return To_String (Object.Get_Description);
   end Get_Description;
   function Get_Description (Object : in User_Ref)
                  return Unbounded_String is
      Impl : constant User_Ref_Access := User_Ref_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Description;
   end Get_Description;
   procedure Set_Status (Object : in out User_Ref;
                          Value  : in Integer) is
      Impl : User_Ref_Access;
   begin
      Set_Field (Object, Impl, 7);
      Impl.Status := Value;
   end Set_Status;
   function Get_Status (Object : in User_Ref)
                  return Integer is
      Impl : constant User_Ref_Access := User_Ref_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Status;
   end Get_Status;
   --  Copy of the object.
   function Copy (Object : User_Ref) return User_Ref is
      Result : User_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant User_Ref_Access
              := User_Ref_Impl (Object.Get_Object.all)'Access;
            Copy : constant User_Ref_Access
              := new User_Ref_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Id := Impl.Id;
            Copy.Object_Version := Impl.Object_Version;
            Copy.Name := Impl.Name;
            Copy.Email := Impl.Email;
            Copy.Date := Impl.Date;
            Copy.Description := Impl.Description;
            Copy.Status := Impl.Status;
         end;
      end if;
      return Result;
   end Copy;
   procedure Find (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant User_Ref_Access := new User_Ref_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;
   procedure Load (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant User_Ref_Access := new User_Ref_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Databases.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;
   procedure Save (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new User_Ref_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;
   procedure Delete (Object  : in out User_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;
   --  --------------------
   --  Free the object
   --  --------------------
   procedure Destroy (Object : access User_Ref_Impl) is
      type User_Ref_Impl_Ptr is access all User_Ref_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (User_Ref_Impl, User_Ref_Impl_Ptr);
      Ptr : User_Ref_Impl_Ptr := User_Ref_Impl (Object.all)'Access;
   begin
      Unchecked_Free (Ptr);
   end Destroy;
   procedure Find (Object  : in out User_Ref_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (USER_REF_TABLE'Access);
   begin
      Stmt.Set_Parameters (Query);
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;
   procedure Save (Object  : in out User_Ref_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement := Session.Create_Statement (USER_REF_TABLE'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => "ID",
                          Value => Object.Id);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => "NAME",
                          Value => Object.Name);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => "EMAIL",
                          Value => Object.Email);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => "DATE",
                          Value => Object.Date);
         Object.Clear_Modified (5);
      end if;
      if Object.Is_Modified (6) then
         Stmt.Save_Field (Name  => "DESCRIPTION",
                          Value => Object.Description);
         Object.Clear_Modified (6);
      end if;
      if Object.Is_Modified (7) then
         Stmt.Save_Field (Name  => "STATUS",
                          Value => Object.Status);
         Object.Clear_Modified (7);
      end if;
      if Stmt.Has_Save_Fields then
         Object.Object_Version := Object.Object_Version + 1;
         Stmt.Save_Field (Name  => "object_version",
                          Value => Object.Object_Version);
         Stmt.Set_Filter (Filter => "id = ? and object_version = ?");
         Stmt.Add_Param (Value => Object.Id);
         Stmt.Add_Param (Value => Object.Object_Version - 1);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result = 0 then
                  raise LAZY_LOCK;
               else
                  raise UPDATE_ERROR;
               end if;
            end if; 
         end;
      end if;
   end Save;
   procedure Create (Object  : in out User_Ref_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (USER_REF_TABLE'Access);
      Result : Integer;
   begin
      Query.Save_Field (Name => "id", Value => Object.Id);

      Query.Save_Field (Name => "object_version", Value => Object.Object_Version);

      Query.Save_Field (Name => "name", Value => Object.Name);

      Query.Save_Field (Name => "email", Value => Object.Email);

      Query.Save_Field (Name => "date", Value => Object.Date);

      Query.Save_Field (Name => "description", Value => Object.Description);

      Query.Save_Field (Name => "status", Value => Object.Status);
      Object.Object_Version := 1;
      Query.Save_Field (Name => "object_version", Value => Object.Object_Version);
      Query.Execute (Result);
      if Result /= 1 then
         raise INSERT_ERROR;
      end if;
      Set_Created (Object);
   end Create;
   procedure Delete (Object  : in out User_Ref_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement := Session.Create_Statement (USER_REF_TABLE'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Id);
      Stmt.Execute;
   end Delete;
   function Get_Value (Item : in User_Ref;
                       Name : in String) return EL.Objects.Object is
      Impl : constant access User_Ref_Impl := User_Ref_Impl (Item.Get_Object.all)'Access;
   begin
      if Name = "id" then
         return EL.Objects.To_Object (Long_Long_Integer (Impl.Id));
      end if;
      if Name = "name" then
         return EL.Objects.To_Object (Impl.Name);
      end if;
      if Name = "email" then
         return EL.Objects.To_Object (Impl.Email);
      end if;
      if Name = "date" then
         return EL.Objects.To_Object (Impl.Date);
      end if;
      if Name = "description" then
         return EL.Objects.To_Object (Impl.Description);
      end if;
      if Name = "status" then
         return EL.Objects.To_Object (Long_Long_Integer (Impl.Status));
      end if;
      raise ADO.Databases.NOT_FOUND;
   end Get_Value;
   procedure List (Object  : in out User_Ref_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement := Session.Create_Statement (USER_REF_TABLE'Access);
   begin
      Stmt.Set_Parameters (Query);
      Stmt.Execute;
      User_Ref_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : User_Ref;
            Impl : constant User_Ref_Access := new User_Ref_Impl;
         begin
            Impl.Load (Stmt);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;
   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object : in out User_Ref_Impl;
                   Stmt   : in out ADO.Statements.Query_Statement'Class) is
   begin
      Object.Id := Stmt.Get_Identifier (0);
      Object.Object_Version := Stmt.Get_Integer (1);
      Object.Name := Stmt.Get_Unbounded_String (2);
      Object.Email := Stmt.Get_Unbounded_String (3);
      Object.Date := Stmt.Get_Unbounded_String (4);
      Object.Description := Stmt.Get_Unbounded_String (5);
      Object.Status := Stmt.Get_Integer (6);
      Object.Object_Version := Stmt.Get_Integer (1);
      Set_Created (Object);
   end Load;
end Samples.User.Model;