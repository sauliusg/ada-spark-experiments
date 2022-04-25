with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;

procedure Sum_Angles is
   
   DEGREES_MAX : constant := 360;
   type Degrees is mod DEGREES_MAX;
   
   type Degrees_List is array (Natural range <>) of Degrees;
   
   function Add_Angles (List : Degrees_List) return Degrees
   is
      Sum : Degrees := 0;
   begin
      for I in List'Range loop
         Sum := Sum + List (I);
      end loop;

      return Sum;
   end Add_Angles;

   List : Degrees_List (1 .. Argument_Count);
   
begin
   for I in List'Range loop
      List (I) := Degrees (Integer'Value (Argument (I)));
   end loop;

   Put_Line ("Sum:" & Add_Angles (List)'Img);
end Sum_Angles;
