with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO; 

procedure Floats is
   
   X, Y, Z : Float;
   
   function Machine_Epsilon return Float is
      Eps : Float := 1.0;
   begin
      while Eps + 1.0 /= 1.0 loop
         Eps := Eps / 2.0;
      end loop;
      return Eps;
   end;
   
   procedure Put (B : Boolean) is
   begin
      Put (Boolean'Image (B) (1));
   end;
   
   Eps : Float := Machine_Epsilon;
   
begin
   Put ("Machine_Epsilon = ");
   Put (Eps);
   New_Line;
   
   X := 256.0;
   Y := 1.0;
   
   Z := X * Y;
   
   Put (Z < X);
   Put (Z);
   Put (Float'Floor (Z));
   New_Line;
   
   declare
      Eps2 : Float := Eps / 2.0;
   begin
      -- Put (Eps2);
      -- New_Line;
      
      Y := Y - Eps2;
      Z := X * Y;
   
      Put (Z < X);
      Put (Z);
      Put (Float'Floor (Z));
      New_Line;
   end;
   
   Y := Y - Eps;
   Z := X * Y;
   
   Put (Z < X);
   Put (Z);
   Put (Float'Floor (Z));
   New_Line;
end;
