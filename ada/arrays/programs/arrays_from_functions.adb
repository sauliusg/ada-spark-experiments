pragma Ada_2022;

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
   
begin
   
   V := Make_Array( 10 );
   
   Put_Line (V'Image);
   
   declare
      W : Vector := Make_Array (12);
   begin
      Put_Line (W'Image);
   end;
   
end;
