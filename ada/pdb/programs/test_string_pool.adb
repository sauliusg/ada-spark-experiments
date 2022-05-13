with Text_IO; use Text_IO;
with Ada.Characters; use Ada.Characters;
with String_Pool; use String_Pool;

procedure Test_String_Pool is
   
begin
   
   for I in 1..1001 loop
      declare 
         S : String (1..1);
      begin
         S (1) := Character'Val (I mod 26 + Character'Pos ('A'));
         Add (S);
         Put (Lookup (S)'Image);
         Put (" ");
         Put (Get_String (Lookup (S)));
         New_Line;
      end;
   end loop;
   
end Test_String_Pool;
