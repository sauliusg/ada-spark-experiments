with Ada.Command_Line; use Ada.Command_Line;

with Ada.Unchecked_Deallocation;

package body Get_Options is
   
   function Option
     (
      Short_Option, Long_Option : String;
      Option_Kind : Option_Value_Kind
     ) return Option_Type is
   begin
      return 
        (
         Short_Option (Short_Option'First),
         new String'(Long_Option),
         Option_Kind,
         others => <>
        );
   end;

   function Option
     (
      Short_Option, Long_Option : String;
      Integer_Parameter_Ref : Integer_Parameter_Access
     ) return Option_Type is
   begin
      return
        (
         Short_Option (Short_Option'First),
         new String'(Long_Option),
         INTEGER_OPT,
         new Option_Value_Type'
           (
            Option_Kind => INTEGER_OPT,
            Integer_Value => Integer_Parameter_Ref.all,
            Integer_Value_Parameter => Integer_Parameter_Ref,
            others => <>
           ),
         others => <>
        );
   end;
   
   procedure Free is new Ada.Unchecked_Deallocation
     (Option_Value_Type, Option_Value_Access);
   
   type String_Access is access String;
   
   procedure Free is new Ada.Unchecked_Deallocation
     (String, String_Access);
   
end Get_Options;
