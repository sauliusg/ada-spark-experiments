pragma Ada_2022;
-- pragma Ada_2020;

with Ada.Text_IO; use Ada.Text_IO;

procedure Arrays_From_Functions is
   
   package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
   use Integer_IO;
   
   type Vector is array (Integer range <>) of Integer;
   
   function Make_Array( Size : Integer ) return Vector is
      V : Vector(1..Size);
   begin
      for I in V'Range loop
         V(I) := 0;
      end loop;
      return V;
   end;
   
   V : Vector(1..10);
   
   procedure Put (V : Vector) is
   begin
      Put ("[");
      for E of V loop
         Put (E);
         Put (" ");
      end loop;
      Put ("]");
   end;
   
   procedure Put_Line (V : Vector) is
   begin
      Put (V);
      New_Line;
   end;
   
begin
   
   V := Make_Array( 10 );
   
   Put_Line (V);
   
   for I in 1..100000 loop
      declare
         N : Integer := I mod 20;
         W : Vector := Make_Array (N);
         U : Vector := (for I in 1..N => I * I);
      begin
         Put_Line (W);
         Put_Line (U);
      end;
   end loop;
   
end;
