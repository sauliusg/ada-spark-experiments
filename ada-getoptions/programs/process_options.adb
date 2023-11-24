with Text_IO; use Text_IO;
with Get_Options; use Get_Options;

procedure Process_Options is
   
   Options : Option_Array :=
     (
      Option ("-h", "--help", BOOLEAN_OPT),
      Option ("-i", "--int", INTEGER_OPT)
     );
   
begin
   
   for O of Options loop
      Put_Line (O.Long_Option.all);
   end loop;
   
end;
