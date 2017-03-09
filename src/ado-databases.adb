-----------------------------------------------------------------------
--  ADO Databases -- Database Connections
--  Copyright (C) 2010, 2011, 2012, 2013, 2017 Stephane Carrez
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

with Util.Log;
with Util.Log.Loggers;

with Ada.Unchecked_Deallocation;
with ADO.Statements.Create;
package body ADO.Databases is

   use ADO.Drivers;
   use type ADO.Drivers.Connections.Database_Connection_Access;

   Log : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("ADO.Databases");

   --  ------------------------------
   --  Get the database connection status.
   --  ------------------------------
   function Get_Status (Database : in Connection) return Connection_Status is
   begin
      if Database.Is_Null then
         return CLOSED;
      else
         return OPEN;
      end if;
   end Get_Status;

   --  ------------------------------
   --  Create a query statement.  The statement is not prepared
   --  ------------------------------
   function Create_Statement (Database : in Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Query_Statement is
   begin
      if Database.Is_Null then
         Log.Error ("Database implementation is not initialized");
         raise NOT_OPEN with "No connection to the database";
      end if;
      declare
         Query : constant Query_Statement_Access := Database.Value.all.Create_Statement (Table);
      begin
         return ADO.Statements.Create.Create_Statement (Query);
      end;
   end Create_Statement;

   --  ------------------------------
   --  Create a query statement.  The statement is not prepared
   --  ------------------------------
   function Create_Statement (Database : in Connection;
                              Query    : in String)
                              return Query_Statement is
   begin
      if Database.Is_Null then
         Log.Error ("Database implementation is not initialized");
         raise NOT_OPEN with "No connection to the database";
      end if;
      declare
         Stmt : constant Query_Statement_Access := Database.Value.all.Create_Statement (null);
      begin
         Append (Query => Stmt.all, SQL => Query);
         return ADO.Statements.Create.Create_Statement (Stmt);
      end;
   end Create_Statement;

   --  ------------------------------
   --  Get the database driver which manages this connection.
   --  ------------------------------
   function Get_Driver (Database : in Connection) return ADO.Drivers.Connections.Driver_Access is
   begin
      if Database.Is_Null then
         Log.Error ("Database implementation is not initialized");
         raise NOT_OPEN with "No connection to the database";
      end if;
      return Database.Value.Get_Driver;
   end Get_Driver;

   --  ------------------------------
   --  Get the database driver index.
   --  ------------------------------
   function Get_Driver_Index (Database : in Connection) return ADO.Drivers.Driver_Index is
      Driver : constant ADO.Drivers.Connections.Driver_Access := Database.Get_Driver;
   begin
      return Driver.Get_Driver_Index;
   end Get_Driver_Index;

   --  ------------------------------
   --  Get a database connection identifier.
   --  ------------------------------
   function Get_Ident (Database : in Connection) return String is
   begin
      if Database.Is_Null then
         return "null";
      else
         return Database.Value.Ident;
      end if;
   end Get_Ident;

   --  ------------------------------
   --  Load the database schema definition for the current database.
   --  ------------------------------
   procedure Load_Schema (Database : in Connection;
                          Schema   : out ADO.Schemas.Schema_Definition) is
   begin
      if Database.Is_Null then
         Log.Error ("Database connection is not initialized");
         raise NOT_OPEN with "No connection to the database";
      end if;
      Database.Value.Load_Schema (Schema);
   end Load_Schema;

   --  ------------------------------
   --  Close the database connection
   --  ------------------------------
   procedure Close (Database : in out Connection) is
   begin
      Log.Info ("Closing database connection {0}", Database.Get_Ident);

      if not Database.Is_Null then
         Database.Value.Close;
      end if;
   end Close;

   --  ------------------------------
   --  Start a transaction.
   --  ------------------------------
   procedure Begin_Transaction (Database : in out Master_Connection) is
   begin
      Log.Info ("Begin transaction {0}", Database.Get_Ident);

      if Database.Is_Null then
         Log.Error ("Database implementation is not initialized");
         raise NOT_OPEN with "No connection to the database";
      end if;
      Database.Value.Begin_Transaction;
   end Begin_Transaction;

   --  ------------------------------
   --  Commit the current transaction.
   --  ------------------------------
   procedure Commit (Database : in out Master_Connection) is
   begin
      Log.Info ("Commit transaction {0}", Database.Get_Ident);

      if Database.Is_Null then
         Log.Error ("Database implementation is not initialized");
         raise NOT_OPEN with "No connection to the database";
      end if;
      Database.Value.Commit;
   end Commit;

   --  ------------------------------
   --  Rollback the current transaction.
   --  ------------------------------
   procedure Rollback (Database : in out Master_Connection) is
   begin
      Log.Info ("Rollback transaction {0}", Database.Get_Ident);

      if Database.Is_Null then
         Log.Error ("Database implementation is not initialized");
         raise NOT_OPEN with "Database implementation is not initialized";
      end if;
      Database.Value.Rollback;
   end Rollback;

   --  ------------------------------
   --  Create a delete statement.
   --  ------------------------------
   function Create_Statement (Database : in Master_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Delete_Statement is
   begin
      Log.Debug ("Create delete statement {0}", Database.Get_Ident);

      declare
         Stmt : constant Delete_Statement_Access := Database.Value.all.Create_Statement (Table);
      begin
         return ADO.Statements.Create.Create_Statement (Stmt);
      end;
   end Create_Statement;

   --  ------------------------------
   --  Create an insert statement.
   --  ------------------------------
   function Create_Statement (Database : in Master_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Insert_Statement is
   begin
      Log.Debug ("Create insert statement {0}", Database.Get_Ident);

      declare
         Stmt : constant Insert_Statement_Access := Database.Value.all.Create_Statement (Table);
      begin
         return ADO.Statements.Create.Create_Statement (Stmt.all'Access);
      end;
   end Create_Statement;

   --  ------------------------------
   --  Create an update statement.
   --  ------------------------------
   function Create_Statement (Database : in Master_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Update_Statement is
   begin
      Log.Debug ("Create update statement {0}", Database.Get_Ident);

      return ADO.Statements.Create.Create_Statement (Database.Value.all.Create_Statement (Table));
   end Create_Statement;

   --  ------------------------------
   --  Attempts to establish a connection with the data source
   --  that this DataSource object represents.
   --  ------------------------------
   function Get_Connection (Controller : in DataSource)
                           return Master_Connection'Class is
      Connection : Master_Connection; --  ADO.Drivers.Connections.Database_Connection_Access;
   begin
      Log.Info ("Get master connection from data-source");

      Controller.Create_Connection (Connection);
      return Connection;
   end Get_Connection;

   --  ------------------------------
   --  Set the master data source
   --  ------------------------------
   procedure Set_Master (Controller : in out Replicated_DataSource;
                         Master     : in DataSource_Access) is
   begin
      Controller.Master := Master;
   end Set_Master;

   --  ------------------------------
   --  Get the master data source
   --  ------------------------------
   function Get_Master (Controller : in Replicated_DataSource)
                       return DataSource_Access is
   begin
      return Controller.Master;
   end Get_Master;

   --  ------------------------------
   --  Set the slave data source
   --  ------------------------------
   procedure Set_Slave (Controller : in out Replicated_DataSource;
                        Slave      : in DataSource_Access) is
   begin
      Controller.Slave := Slave;
   end Set_Slave;

   --  ------------------------------
   --  Get the slave data source
   --  ------------------------------
   function Get_Slave (Controller : in Replicated_DataSource)
                      return DataSource_Access is
   begin
      return Controller.Slave;
   end Get_Slave;

   --  ------------------------------
   --  Get a slave database connection
   --  ------------------------------
   function Get_Slave_Connection (Controller : in Replicated_DataSource)
                                 return Connection'Class is
   begin
      return Controller.Slave.Get_Connection;
   end Get_Slave_Connection;

end ADO.Databases;
