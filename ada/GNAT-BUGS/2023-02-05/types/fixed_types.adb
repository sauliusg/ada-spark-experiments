with Ada.Text_IO; use Ada.Text_IO;

procedure Fixed_Types is
   
   type Fixed is delta 0.0001 range 0.0 .. 100.0;
   
   type Decimal_Fixed is delta 0.00001 digits 3;
   
   F : Fixed := 22.371;
   
   D : Decimal_Fixed := 0.0021;

   function Int (D : Fixed) return Fixed is
      -- Rounds away the fractional part:
      S : Fixed := D * Fixed'Small;
   begin
      return S / Fixed'Small; -- Restores the integer part.
   end;
   
   function Int (D : Decimal_Fixed) return Decimal_Fixed is
      -- Rounds away the fractional part:
      S : Decimal_Fixed := D * Decimal_Fixed'Small;
   begin
      return S / Decimal_Fixed'Small; -- Restores the integer part.
   end;
   
begin
   Put_Line ("F'Small = " & Fixed'Image (Fixed'Small));
   Put_Line ("D'Small = " & Decimal_Fixed'Image (Decimal_Fixed'Small));
   
   Put_Line ("F = " & Fixed'Image (F));
   Put_Line ("D = " & Decimal_Fixed'Image (D));
   
   Put_Line ("Int (F) = " & Fixed'Image (Int (F)));
   Put_Line ("Int (D) = " & Decimal_Fixed'Image (Int (D)));
end;
