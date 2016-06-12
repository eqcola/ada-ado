-----------------------------------------------------------------------
--  ADO Drivers -- Database Drivers
--  Copyright (C) 2010, 2011, 2012, 2016 Stephane Carrez
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

with Ada.Finalization;

with ADO.Statements;
with ADO.Schemas;
with Util.Properties;
with Util.Strings;

--  The <b>ADO.Drivers</b> package represents the database driver that will create
--  database connections and provide the database specific implementation.
package ADO.Drivers.Connections is

   use ADO.Statements;

   type Driver is abstract tagged limited private;
   type Driver_Access is access all Driver'Class;

   --  ------------------------------
   --  Database connection implementation
   --  ------------------------------
   --
   type Database_Connection is abstract new Ada.Finalization.Limited_Controlled with record
      Count : Natural := 0;
      Ident : String (1 .. 8) := (others => ' ');
   end record;
   type Database_Connection_Access is access all Database_Connection'Class;

   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Query_Statement_Access is abstract;

   function Create_Statement (Database : in Database_Connection;
                              Query    : in String)
                              return Query_Statement_Access is abstract;

   --  Create a delete statement.
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Delete_Statement_Access is abstract;

   --  Create an insert statement.
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Insert_Statement_Access is abstract;

   --  Create an update statement.
   function Create_Statement (Database : in Database_Connection;
                              Table    : in ADO.Schemas.Class_Mapping_Access)
                              return Update_Statement_Access is abstract;

   --  Start a transaction.
   procedure Begin_Transaction (Database : in out Database_Connection) is abstract;

   --  Commit the current transaction.
   procedure Commit (Database : in out Database_Connection) is abstract;

   --  Rollback the current transaction.
   procedure Rollback (Database : in out Database_Connection) is abstract;

   --  Load the database schema definition for the current database.
   procedure Load_Schema (Database : in Database_Connection;
                          Schema   : out ADO.Schemas.Schema_Definition) is abstract;

   --  Get the database driver which manages this connection.
   function Get_Driver (Database : in Database_Connection)
                        return Driver_Access is abstract;

   --  Closes the database connection
   procedure Close (Database : in out Database_Connection) is abstract;

   --  ------------------------------
   --  The database configuration properties
   --  ------------------------------
   type Configuration is new Ada.Finalization.Controlled with private;
   type Configuration_Access is access all Configuration'Class;

   --  Set the connection URL to connect to the database.
   --  The driver connection is a string of the form:
   --
   --   driver://[host][:port]/[database][?property1][=value1]...
   --
   --  If the string is invalid or if the driver cannot be found,
   --  the Connection_Error exception is raised.
   procedure Set_Connection (Controller : in out Configuration;
                             URI        : in String);

   --  Set a property on the datasource for the driver.
   --  The driver can retrieve the property to configure and open
   --  the database connection.
   procedure Set_Property (Controller : in out Configuration;
                           Name       : in String;
                           Value      : in String);

   --  Get a property from the data source configuration.
   --  If the property does not exist, an empty string is returned.
   function Get_Property (Controller : in Configuration;
                          Name       : in String) return String;

   --  Set the server hostname.
   procedure Set_Server (Controller : in out Configuration;
                         Server     : in String);

   --  Get the server hostname.
   function Get_Server (Controller : in Configuration) return String;

   --  Set the server port.
   procedure Set_Port (Controller : in out Configuration;
                       Port       : in Natural);

   --  Get the server port.
   function Get_Port (Controller : in Configuration) return Natural;

   --  Set the database name.
   procedure Set_Database (Controller : in out Configuration;
                           Database   : in String);

   --  Get the database name.
   function Get_Database (Controller : in Configuration) return String;

   --  Create a new connection using the configuration parameters.
   procedure Create_Connection (Config : in Configuration'Class;
                                Result : out Database_Connection_Access);

   --  ------------------------------
   --  Database Driver
   --  ------------------------------

   --  Create a new connection using the configuration parameters.
   procedure Create_Connection (D      : in out Driver;
                                Config : in Configuration'Class;
                                Result : out Database_Connection_Access) is abstract;

   --  Get the driver unique index.
   function Get_Driver_Index (D : in Driver) return Driver_Index;

   --  Get the driver name.
   function Get_Driver_Name (D : in Driver) return String;

   --  Register a database driver.
   procedure Register (Driver : in Driver_Access);

   --  Get a database driver given its name.
   function Get_Driver (Name : in String) return Driver_Access;

private

   type Driver is abstract new Ada.Finalization.Limited_Controlled with record
      Name  : Util.Strings.Name_Access;
      Index : Driver_Index;
   end record;

   type Configuration is new Ada.Finalization.Controlled with record
      URI        : Unbounded_String := Null_Unbounded_String;
      Server     : Unbounded_String := Null_Unbounded_String;
      Port       : Natural := 0;
      Database   : Unbounded_String := Null_Unbounded_String;
      Properties : Util.Properties.Manager;
      Driver     : Driver_Access;
   end record;

end ADO.Drivers.Connections;
