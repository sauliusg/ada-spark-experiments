pragma Ada_2022;

with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO; 

procedure Mantissae is
   
begin
   
   Put ("Float'Machine_Mantissa = ");
   Put (Float'Machine_Mantissa);
   New_Line;

   Put ("Float'Model_Mantissa   = ");
   Put (Float'Model_Mantissa);
   New_Line;
   New_Line;

   Put ("Long_Float'Machine_Mantissa = ");
   Put (Long_Float'Machine_Mantissa);
   New_Line;

   Put ("Long_Float'Model_Mantissa   = ");
   Put (Long_Float'Model_Mantissa);
   New_Line;
   New_Line;

   Put ("Long_Long_Float'Machine_Mantissa = ");
   Put (Long_Long_Float'Machine_Mantissa);
   New_Line;

   Put ("Long_Long_Float'Model_Mantissa   = ");
   Put (Long_Long_Float'Model_Mantissa);
   New_Line;
   New_Line;
   
   Put ("Float'Denorm   = ");
   Put (Boolean'Image (Float'Denorm));
   New_Line;   

end;
