with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
with Ada.Float_Text_IO;   use Ada.Float_Text_IO; 

procedure Binary is
   
   One : constant Float := 1.0;
   
   function Machine_Epsilon return Float is
      Eps : Float := 1.0;
   begin
      while Eps + 1.0 /= 1.0 loop
         Eps := Eps / 2.0;
      end loop;
      return Eps;
   end;
   
   type Float_Array is array (Integer range <>) of FLoat;
   
begin
   
   for M of Float_Array'(Machine_Epsilon, Float'Model_epsilon) loop
      declare
         FM : Float := M * 2.0**24;
         IM : Integer := Integer (FM);
      begin
         Put (M); New_Line;
         Put (FM); New_Line;
         Put (IM); New_Line;
         Put (IM, Base => 2); New_Line;
         New_Line;
      end;
   end loop;
   
end;
