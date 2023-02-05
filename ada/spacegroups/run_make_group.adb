with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Make_Group;          use Make_Group;
with Mod_Type_Group_Theory; use Mod_Type_Group_Theory;

procedure Run_Make_Group is
   
   -- use Mod_Group_Theory;

   procedure Put (G : Group) is
   begin
      Put ("(");
      for I in G'First .. G'Last loop
         if I /= G'First then
            Put (", ");
         end if;
         Put (Integer (G (I)), 1);
      end loop;
      Put (")");
   end;
   
   E : Ring_Element := 2;
   
   Processed_Error : exception;
   
begin -- main program
   
   if Argument_Count > 0 then
      declare
      begin
         E := Ring_Element'Value (Argument (1));
      exception
         when CONSTRAINT_ERROR =>
            Put (Standard_Error,
                 Command_Name & ": " &
                 "ERROR, Argument value '" &
                   Argument (1) &
                   "' does not fit into range " &
                   Ring_Element'First'Image & " .." &
                   Ring_Element'Last'Image
                );
            raise PROCESSED_ERROR;
      end;
   end if;
   
   declare
      G : Group := Build_Group (E);
   begin
      Put (G);
      New_Line;
   end;   
   
exception
   
   when PROCESSED_ERROR => null;
   
end Run_Make_Group;
