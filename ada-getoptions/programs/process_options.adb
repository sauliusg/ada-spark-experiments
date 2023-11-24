with Text_IO; use Text_IO;
with Get_Options; use Get_Options;

procedure Process_Options is
   
   Integer_Parameter : Integer_Parameter_Access := new Integer'(1);
   
   Float_Value_Option : Option_Type := Option ("-f", "--float", FLOAT_OPT);
   
   Options : Option_Array :=
     (
      Option ("-h", "--help",  BOOLEAN_OPT),
      Option ("-i", "--int",   INTEGER_OPT),
      Option ("-p", "--param", Integer_Parameter),
      Float_Value_Option
     );   
   
begin
   
   for O of Options loop
      Put_Line (O.Long_Option.all);
   end loop;
   
end;
