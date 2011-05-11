-----------------------------------------------------------------------
--  ADO.Model -- ADO.Model
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 119
-----------------------------------------------------------------------
--  Copyright (C) 2009, 2010, 2011 Stephane Carrez
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
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with ADO.Queries;
with Ada.Calendar;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
package ADO.Model is
   --  --------------------
   --  Sequence generator
   --  --------------------
   --  Create an object key for Sequence.
   function Sequence_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Sequence from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Sequence_Key (Id : in String) return ADO.Objects.Object_Key;

   type Sequence_Ref is new ADO.Objects.Object_Ref with null record;

   Null_Sequence : constant Sequence_Ref;
   function "=" (Left, Right : Sequence_Ref'Class) return Boolean;

   --  Set the sequence name
   procedure Set_Name (Object : in out Sequence_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out Sequence_Ref;
                       Value : in String);

   --  Get the sequence name
   function Get_Name (Object : in Sequence_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in Sequence_Ref)
                 return String;
   --  Get the sequence record version
   function Get_Version (Object : in Sequence_Ref)
                 return Integer;

   --  Set the sequence value
   procedure Set_Value (Object : in out Sequence_Ref;
                        Value  : in ADO.Identifier);

   --  Get the sequence value
   function Get_Value (Object : in Sequence_Ref)
                 return ADO.Identifier;

   --  Set the sequence block size
   procedure Set_Block_Size (Object : in out Sequence_Ref;
                             Value  : in ADO.Identifier);

   --  Get the sequence block size
   function Get_Block_Size (Object : in Sequence_Ref)
                 return ADO.Identifier;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Sequence_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in Ada.Strings.Unbounded.Unbounded_String);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Sequence_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in Ada.Strings.Unbounded.Unbounded_String;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Sequence_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Sequence_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Sequence_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (Item : in Sequence_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   SEQUENCE_TABLE : aliased constant ADO.Schemas.Class_Mapping;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Sequence_Ref);

   --  Copy of the object.
   function Copy (Object : Sequence_Ref) return Sequence_Ref;

   package Sequence_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Sequence_Ref,
                                  "="          => "=");
   subtype Sequence_Vector is Sequence_Vectors.Vector;

   procedure List (Object  : in out Sequence_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  --------------------
   --  Entity types
   --  --------------------
   --  Create an object key for Entity_Type.
   function Entity_Type_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Entity_Type from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Entity_Type_Key (Id : in String) return ADO.Objects.Object_Key;

   type Entity_Type_Ref is new ADO.Objects.Object_Ref with null record;

   Null_Entity_Type : constant Entity_Type_Ref;
   function "=" (Left, Right : Entity_Type_Ref'Class) return Boolean;

   --  Set the entity type identifier
   procedure Set_Id (Object : in out Entity_Type_Ref;
                     Value  : in ADO.Identifier);

   --  Get the entity type identifier
   function Get_Id (Object : in Entity_Type_Ref)
                 return ADO.Identifier;

   --  Set the entity type name (table name)
   procedure Set_Name (Object : in out Entity_Type_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out Entity_Type_Ref;
                       Value : in String);

   --  Get the entity type name (table name)
   function Get_Name (Object : in Entity_Type_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in Entity_Type_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Entity_Type_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Entity_Type_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Entity_Type_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Entity_Type_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Entity_Type_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (Item : in Entity_Type_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   ENTITY_TYPE_TABLE : aliased constant ADO.Schemas.Class_Mapping;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Entity_Type_Ref);

   --  Copy of the object.
   function Copy (Object : Entity_Type_Ref) return Entity_Type_Ref;

   package Entity_Type_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Entity_Type_Ref,
                                  "="          => "=");
   subtype Entity_Type_Vector is Entity_Type_Vectors.Vector;

   procedure List (Object  : in out Entity_Type_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);


private
   SEQUENCE_NAME : aliased constant String := "sequence";
   COL_0_1_NAME : aliased constant String := "NAME";
   COL_1_1_NAME : aliased constant String := "version";
   COL_2_1_NAME : aliased constant String := "VALUE";
   COL_3_1_NAME : aliased constant String := "BLOCK_SIZE";
   SEQUENCE_TABLE : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 4,
      Table => SEQUENCE_NAME'Access,
      Members => (         COL_0_1_NAME'Access,
         COL_1_1_NAME'Access,
         COL_2_1_NAME'Access,
         COL_3_1_NAME'Access
)
     );
   Null_Sequence : constant Sequence_Ref := Sequence_Ref' (ADO.Objects.Object_Ref with others => <>);
   type Sequence_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_STRING,
                                     Of_Class => SEQUENCE_TABLE'Access)
   with record
       Version : Integer;
       Value : ADO.Identifier;
       Block_Size : ADO.Identifier;
   end record;
   type Sequence_Access is access all Sequence_Impl;
   overriding
   procedure Destroy (Object : access Sequence_Impl);
   overriding
   procedure Find (Object  : in out Sequence_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);
   overriding
   procedure Load (Object  : in out Sequence_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Sequence_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);
   overriding
   procedure Save (Object  : in out Sequence_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);
   procedure Create (Object  : in out Sequence_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   overriding
   procedure Delete (Object  : in out Sequence_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   procedure Set_Field (Object : in out Sequence_Ref'Class;
                        Impl   : out Sequence_Access;
                        Field  : in Positive);
   ENTITY_TYPE_NAME : aliased constant String := "entity_type";
   COL_0_2_NAME : aliased constant String := "ID";
   COL_1_2_NAME : aliased constant String := "NAME";
   ENTITY_TYPE_TABLE : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 2,
      Table => ENTITY_TYPE_NAME'Access,
      Members => (         COL_0_2_NAME'Access,
         COL_1_2_NAME'Access
)
     );
   Null_Entity_Type : constant Entity_Type_Ref := Entity_Type_Ref' (ADO.Objects.Object_Ref with others => <>);
   type Entity_Type_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => ENTITY_TYPE_TABLE'Access)
   with record
       Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;
   type Entity_Type_Access is access all Entity_Type_Impl;
   overriding
   procedure Destroy (Object : access Entity_Type_Impl);
   overriding
   procedure Find (Object  : in out Entity_Type_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);
   overriding
   procedure Load (Object  : in out Entity_Type_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Entity_Type_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);
   overriding
   procedure Save (Object  : in out Entity_Type_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);
   procedure Create (Object  : in out Entity_Type_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   overriding
   procedure Delete (Object  : in out Entity_Type_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   procedure Set_Field (Object : in out Entity_Type_Ref'Class;
                        Impl   : out Entity_Type_Access;
                        Field  : in Positive);
end ADO.Model;
