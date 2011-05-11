-----------------------------------------------------------------------
--  Regtests.Simple.Model -- Regtests.Simple.Model
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
package Regtests.Simple.Model is
   --  --------------------
   --  
   --  --------------------
   --  Create an object key for Comment.
   function Comment_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Comment from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Comment_Key (Id : in String) return ADO.Objects.Object_Key;

   type Comment_Ref is new ADO.Objects.Object_Ref with null record;

   Null_Comment : constant Comment_Ref;
   function "=" (Left, Right : Comment_Ref'Class) return Boolean;

   --  Set 
   procedure Set_Id (Object : in out Comment_Ref;
                     Value  : in ADO.Identifier);

   --  Get 
   function Get_Id (Object : in Comment_Ref)
                 return ADO.Identifier;
   --  Get 
   function Get_Version (Object : in Comment_Ref)
                 return Integer;

   --  Set 
   procedure Set_Date (Object : in out Comment_Ref;
                       Value  : in Ada.Calendar.Time);

   --  Get 
   function Get_Date (Object : in Comment_Ref)
                 return Ada.Calendar.Time;

   --  Set 
   procedure Set_Message (Object : in out Comment_Ref;
                          Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Message (Object : in out Comment_Ref;
                          Value : in String);

   --  Get 
   function Get_Message (Object : in Comment_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Message (Object : in Comment_Ref)
                 return String;

   --  Set 
   procedure Set_Entity_Id (Object : in out Comment_Ref;
                            Value  : in Integer);

   --  Get 
   function Get_Entity_Id (Object : in Comment_Ref)
                 return Integer;

   --  Set 
   procedure Set_User (Object : in out Comment_Ref;
                       Value  : in Regtests.Simple.Model.User_Ref'Class);

   --  Get 
   function Get_User (Object : in Comment_Ref)
                 return Regtests.Simple.Model.User_Ref'Class;

   --  Set 
   procedure Set_Entity_Type (Object : in out Comment_Ref;
                              Value  : in ADO.Model.Entity_Type_Ref'Class);

   --  Get 
   function Get_Entity_Type (Object : in Comment_Ref)
                 return ADO.Model.Entity_Type_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Comment_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (Item : in Comment_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   COMMENT_TABLE : aliased constant ADO.Schemas.Class_Mapping;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Comment_Ref);

   --  Copy of the object.
   function Copy (Object : Comment_Ref) return Comment_Ref;

   package Comment_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Comment_Ref,
                                  "="          => "=");
   subtype Comment_Vector is Comment_Vectors.Vector;

   procedure List (Object  : in out Comment_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  --------------------
   --  Record representing a user
   --  --------------------
   --  Create an object key for User.
   function User_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for User from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function User_Key (Id : in String) return ADO.Objects.Object_Key;

   type User_Ref is new ADO.Objects.Object_Ref with null record;

   Null_User : constant User_Ref;
   function "=" (Left, Right : User_Ref'Class) return Boolean;

   --  Set the user id
   procedure Set_Id (Object : in out User_Ref;
                     Value  : in ADO.Identifier);

   --  Get the user id
   function Get_Id (Object : in User_Ref)
                 return ADO.Identifier;
   --  Get 
   function Get_Version (Object : in User_Ref)
                 return Integer;

   --  Set the sequence value
   procedure Set_Value (Object : in out User_Ref;
                        Value  : in ADO.Identifier);

   --  Get the sequence value
   function Get_Value (Object : in User_Ref)
                 return ADO.Identifier;

   --  Set the user name
   procedure Set_Name (Object : in out User_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out User_Ref;
                       Value : in String);

   --  Get the user name
   function Get_Name (Object : in User_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in User_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out User_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out User_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (Item : in User_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   USER_TABLE : aliased constant ADO.Schemas.Class_Mapping;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out User_Ref);

   --  Copy of the object.
   function Copy (Object : User_Ref) return User_Ref;

   package User_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => User_Ref,
                                  "="          => "=");
   subtype User_Vector is User_Vectors.Vector;

   procedure List (Object  : in out User_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  --------------------
   --  Record representing a user
   --  --------------------
   --  Create an object key for Allocate.
   function Allocate_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Allocate from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Allocate_Key (Id : in String) return ADO.Objects.Object_Key;

   type Allocate_Ref is new ADO.Objects.Object_Ref with null record;

   Null_Allocate : constant Allocate_Ref;
   function "=" (Left, Right : Allocate_Ref'Class) return Boolean;

   --  Set the user id
   procedure Set_Id (Object : in out Allocate_Ref;
                     Value  : in ADO.Identifier);

   --  Get the user id
   function Get_Id (Object : in Allocate_Ref)
                 return ADO.Identifier;
   --  Get 
   function Get_Object_Version (Object : in Allocate_Ref)
                 return Integer;

   --  Set the sequence value
   procedure Set_Name (Object : in out Allocate_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out Allocate_Ref;
                       Value : in String);

   --  Get the sequence value
   function Get_Name (Object : in Allocate_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in Allocate_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Allocate_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Allocate_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (Item : in Allocate_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   ALLOCATE_TABLE : aliased constant ADO.Schemas.Class_Mapping;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Allocate_Ref);

   --  Copy of the object.
   function Copy (Object : Allocate_Ref) return Allocate_Ref;

   package Allocate_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Allocate_Ref,
                                  "="          => "=");
   subtype Allocate_Vector is Allocate_Vectors.Vector;

   procedure List (Object  : in out Allocate_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);


private
   COMMENT_NAME : aliased constant String := "TEST_COMMENTS";
   COL_0_1_NAME : aliased constant String := "ID";
   COL_1_1_NAME : aliased constant String := "VERSION";
   COL_2_1_NAME : aliased constant String := "DATE";
   COL_3_1_NAME : aliased constant String := "MESSAGE";
   COL_4_1_NAME : aliased constant String := "ENTITY_ID";
   COL_5_1_NAME : aliased constant String := "USER_FK";
   COL_6_1_NAME : aliased constant String := "ENTITY__TYPE_FK";
   COMMENT_TABLE : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 7,
      Table => COMMENT_NAME'Access,
      Members => (         COL_0_1_NAME'Access,
         COL_1_1_NAME'Access,
         COL_2_1_NAME'Access,
         COL_3_1_NAME'Access,
         COL_4_1_NAME'Access,
         COL_5_1_NAME'Access,
         COL_6_1_NAME'Access
)
     );
   Null_Comment : constant Comment_Ref := Comment_Ref' (ADO.Objects.Object_Ref with others => <>);
   type Comment_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => COMMENT_TABLE'Access)
   with record
       Version : Integer;
       Date : Ada.Calendar.Time;
       Message : Ada.Strings.Unbounded.Unbounded_String;
       Entity_Id : Integer;
       User : Regtests.Simple.Model.User_Ref;
       Entity_Type : ADO.Model.Entity_Type_Ref;
   end record;
   type Comment_Access is access all Comment_Impl;
   overriding
   procedure Destroy (Object : access Comment_Impl);
   overriding
   procedure Find (Object  : in out Comment_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);
   overriding
   procedure Load (Object  : in out Comment_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Comment_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);
   overriding
   procedure Save (Object  : in out Comment_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);
   procedure Create (Object  : in out Comment_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   overriding
   procedure Delete (Object  : in out Comment_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   procedure Set_Field (Object : in out Comment_Ref'Class;
                        Impl   : out Comment_Access;
                        Field  : in Positive);
   USER_NAME : aliased constant String := "test_user";
   COL_0_2_NAME : aliased constant String := "ID";
   COL_1_2_NAME : aliased constant String := "object_version";
   COL_2_2_NAME : aliased constant String := "VALUE";
   COL_3_2_NAME : aliased constant String := "NAME";
   USER_TABLE : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 4,
      Table => USER_NAME'Access,
      Members => (         COL_0_2_NAME'Access,
         COL_1_2_NAME'Access,
         COL_2_2_NAME'Access,
         COL_3_2_NAME'Access
)
     );
   Null_User : constant User_Ref := User_Ref' (ADO.Objects.Object_Ref with others => <>);
   type User_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => USER_TABLE'Access)
   with record
       Version : Integer;
       Value : ADO.Identifier;
       Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;
   type User_Access is access all User_Impl;
   overriding
   procedure Destroy (Object : access User_Impl);
   overriding
   procedure Find (Object  : in out User_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);
   overriding
   procedure Load (Object  : in out User_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out User_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);
   overriding
   procedure Save (Object  : in out User_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);
   procedure Create (Object  : in out User_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   overriding
   procedure Delete (Object  : in out User_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   procedure Set_Field (Object : in out User_Ref'Class;
                        Impl   : out User_Access;
                        Field  : in Positive);
   ALLOCATE_NAME : aliased constant String := "allocate";
   COL_0_3_NAME : aliased constant String := "ID";
   COL_1_3_NAME : aliased constant String := "object_version";
   COL_2_3_NAME : aliased constant String := "NAME";
   ALLOCATE_TABLE : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 3,
      Table => ALLOCATE_NAME'Access,
      Members => (         COL_0_3_NAME'Access,
         COL_1_3_NAME'Access,
         COL_2_3_NAME'Access
)
     );
   Null_Allocate : constant Allocate_Ref := Allocate_Ref' (ADO.Objects.Object_Ref with others => <>);
   type Allocate_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => ALLOCATE_TABLE'Access)
   with record
       Object_Version : Integer;
       Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;
   type Allocate_Access is access all Allocate_Impl;
   overriding
   procedure Destroy (Object : access Allocate_Impl);
   overriding
   procedure Find (Object  : in out Allocate_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);
   overriding
   procedure Load (Object  : in out Allocate_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Allocate_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);
   overriding
   procedure Save (Object  : in out Allocate_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);
   procedure Create (Object  : in out Allocate_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   overriding
   procedure Delete (Object  : in out Allocate_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);
   procedure Set_Field (Object : in out Allocate_Ref'Class;
                        Impl   : out Allocate_Access;
                        Field  : in Positive);
end Regtests.Simple.Model;
