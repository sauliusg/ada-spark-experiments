pragma Ada_2022;

with Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Long_Float_Text_IO;
use Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Long_Float_Text_IO;

with Generic_Rational;

procedure Synthesis_Rational is
   
   package Integer_Rational is new Generic_Rational(Integer);
   
   use Integer_Rational;
   
   X : Integer := 1;
   Y : Rational := Zero;
   
   Z : Integer := 2**12;
   
   Two : Rational := One + One;
   
   procedure Put_Rational (R : Rational) is separate;
   
begin
   
   while (X < Z) loop
      X := 2 * X;
      Y := Y / Two + One;
      Put ("Y = ");
      Put_Rational (Y);
      New_Line;
   end loop;
   
   Put_Line ("X = " & X'Image);
   Put ("Y = ");
   Put_Rational (Y);
   New_Line;
   Put_Line ("Z = " & Z'Image);
   New_Line;
   
   declare
      Rational_Z : Rational := Z / 1;
   begin
      Put_Rational ((Y - Two) * Rational_Z + Two);
   end;
   New_Line;
   New_Line;
   Put (((Numerator (Y) * Z / Denominator (Y)) - 2 * Z) + 2);
   New_Line;
end;