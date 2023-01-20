pragma Spark_Mode (On);

with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Text_IO;  use Ada.Text_IO;
with Make_Group;   use Make_Group;
   
procedure Run_Make_Group is
   
   use Mod_Seven_Group_Theory;

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
   
begin
   declare
      G : Group := Build_Group (2);
   begin
      Put (G);
      New_Line;
   end;   
end Run_Make_Group;
