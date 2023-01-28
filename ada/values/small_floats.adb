pragma Ada_2022;

with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Float_Text_IO;      use Ada.Float_Text_IO; 
with Ada.Long_Float_Text_IO; use Ada.Long_Float_Text_IO; 
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO; 

procedure Small_Floats is
   
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
   
   X := 4.0;
   Y := 1.0;
   
   Put ("E Fraction = "); Put (Float'Fraction (Eps)); New_Line;
   Put ("E Exponent = "); Put (Float'Exponent (Eps), 12); New_Line;
   
   New_Line;
   
   Put ("Y Fraction = "); Put (Float'Fraction (Y), 1, 23, 0); New_Line;
   Put ("Y Exponent = "); Put (Float'Exponent (Y), 12); New_Line;
   New_Line;
   
   Z := X * Y;
   
   Put ("Y = "); Put (Y); New_Line;
   
   Put (Z < X);
   Put (Z);
   Put (Float'Floor (Z));
   New_Line;
   New_Line;
   
   -- ----------------------------------------------------------------------
   Put ([for I in 1..80 => '=']);
   New_Line;
   New_Line;
   -- ----------------------------------------------------------------------
   
   Y := Y - Eps;
   
   Put ("Y Fraction = "); Put (Long_Float'Fraction (Long_Float (Y)), 1, 26, 0);
   Put (" (Long_Float)");
   New_Line;
   
   Put ("Y Fraction = "); Put (Float'Fraction (Y), 1, 26, 0); 
   Put (" (Float)");
   New_Line;
   
   Put ("Y Exponent = "); Put (Float'Exponent (Y), 12); New_Line;
   New_Line;
   
   Z := X * Y;
   
   Put ("Y = "); Put (Y); New_Line;
   
   Put (Z < X);
   Put (Z);
   Put (Float'Floor (Z));
   New_Line;
   New_Line;
   
   -- ----------------------------------------------------------------------
   Put ([for I in 1..80 => '=']);
   New_Line;
   New_Line;
   -- ----------------------------------------------------------------------
   
   Y := Float'Adjacent (Y, 0.0);
   
   Put ("Y Fraction = "); Put (Long_Float'Fraction (Long_Float (Y)), 1, 26, 0);
   Put (" (Long_Float)");
   New_Line;
   
   Put ("Y Fraction = "); Put (Float'Fraction (Y), 1, 26, 0); 
   Put (" (Float)");
   New_Line;
   
   Put ("Y Exponent = "); Put (Float'Exponent (Y), 12); 
   New_Line;
   New_Line;
   
   Z := X * Y;
   
   Put ("Y = "); Put (Y); New_Line;
   
   Put (Z < X);
   Put (Z);
   Put (Float'Floor (Z));
   New_Line;
   New_Line;
   
end;
