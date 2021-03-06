-----------------------------------------------------------------------
--  ado-queries-loaders -- Loader for Database Queries
--  Copyright (C) 2011, 2012 Stephane Carrez
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

package ADO.Queries.Loaders is

   generic
      Path : String;
      Sha1 : String;
   package File is
      Name : aliased constant String := Path;
      Hash : aliased constant String := Sha1;
      File : aliased Query_File := Query_File '(Name          => Name'Access,
                                                Path          => null,
                                                Sha1_Map      => Hash'Access,
                                                Next_Check    => 0,
                                                Last_Modified => 0,
                                                Next          => null,
                                                Queries       => null);
   end File;

   generic
      Name : String;
      File : Query_File_Access;
   package Query is
      Query_Name : aliased constant String := Name;
      Query : aliased Query_Definition := Query_Definition '(Name  => Query_Name'Access,
                                                             Query => Null_Query_Info_Ref,
                                                             File  => File,
                                                             Next  => null);
   end Query;

   --  Read the query definition.
   procedure Read_Query (Into : in Query_Definition_Access);

   --  Register the query definition in the query file.  Registration is done
   --  in the package elaboration phase.
   procedure Register (File  : in Query_File_Access;
                       Query : in Query_Definition_Access);

   --  Initialize the queries to look in the list of directories specified by <b>Paths</b>.
   --  Each search directory is separated by ';' (yes, even on Unix).
   --  When <b>Load</b> is true, read the XML query file and initialize the query
   --  definitions from that file.
   procedure Initialize (Paths : in String;
                         Load  : in Boolean);

   --  Find the query identified by the given name.
   function Find_Query (Name : in String) return Query_Definition_Access;

private

   --  Returns True if the XML query file must be reloaded.
   function Is_Modified (Query : in Query_Definition_Access) return Boolean;

   --  Read the query file and all the associated definitions.
   procedure Read_Query (Into : in Query_File_Access);

end ADO.Queries.Loaders;
