with Text_IO; use Text_IO;
with Get_Options; use Get_Options;

with Ada.Unchecked_Deallocation;

procedure Process_Options is
   
   procedure Free is new Ada.Unchecked_Deallocation
     (Integer, Integer_Parameter_Access);
   
   procedure Free is new Ada.Unchecked_Deallocation
     (Float, Float_Parameter_Access);
   
   Integer_Parameter : Integer_Parameter_Access := new Integer'(1);
   Float_Parameter : Float_Parameter_Access := new Float'(1.1);
   
   Float_Value_Option : Option_Type := Option ("-f", "--float", FLOAT_OPT);
   
   Options : Option_Array :=
     (
      Option ("-h", "--help",   BOOLEAN_OPT),
      Option ("-i", "--int",    INTEGER_OPT),
      Option ("-p", "--param",  Integer_Parameter),
      Option ("-F", "--fparam", Float_Parameter),
      Float_Value_Option
     );   
   
begin
   
   for O of Options loop
      Put_Line (O.Long_Option.all);
   end loop;
   
   Free_Options (Options);
   Free (Integer_Parameter);
   Free (Float_Parameter);
   
end;
