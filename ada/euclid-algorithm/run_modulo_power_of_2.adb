with Text_IO;           use Text_IO;
with Modulo_Power_Of_2; use Modulo_Power_Of_2;

procedure Run_Modulo_Power_Of_2 is
   I : Integer_Modulo_Power_Of_2;
begin
   I := 15;
   Put_Line(Integer_Modulo_Power_Of_2'Image(I));
   Increment(I);
   Put_Line(Integer_Modulo_Power_Of_2'Image(I));
   I := 2**12-1;
   Put_Line(Integer_Modulo_Power_Of_2'Image(I));
   Increment(I);
   Put_Line(Integer_Modulo_Power_Of_2'Image(I));
end;
