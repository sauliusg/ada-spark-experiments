with Text_IO; use Text_IO;
with Ada.Characters; use Ada.Characters;
with String_Pool; use String_Pool;

procedure Test_String_Pool is
   
begin
   
   for I in 1..1001 loop
      declare 
         S : String (1..2);
         J : Integer;
      begin
         S (1) := Character'Val (I mod 26 + Character'Pos ('A'));
         if I > 26 then
            S (2) := Character'Val ((I / 26) mod 26 + Character'Pos ('A'));
         else
            S (2) := ' ';
         end if;
         Add (S);
         Add (S, J);
         Put (Lookup (S)'Image);
         Put (" ");
         Put (Get_String (J));
         New_Line;
      end;
   end loop;
   
end Test_String_Pool;
