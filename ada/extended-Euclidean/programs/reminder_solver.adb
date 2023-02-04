pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Extended_Euclidean_Mod_Generic;

procedure Reminder_Solver is
   
   type Number is new Big_Integer;
   type Positive_Number is new Big_Positive;
   
   package Extended_Euclidean_Mod is 
      new Extended_Euclidean_Mod_Generic (Number, Positive_Number, 0, 1);
      
   use Extended_Euclidean_Mod;
   
begin
   
   declare
      Addends : array (1 .. Argument_Count / 2) of Number;
      Reminders : array (1 .. Argument_Count / 2) of Number;
      Divisors : array (1 .. Argument_Count / 2 ) of Positive_Number;
      Product : Positive_Number := 1;
   begin
      for I in 1 .. Argument_Count / 2 loop
         Divisors (I) := From_String (Argument ((I-1)*2+2));
         Reminders (I) := From_String (Argument ((I-1)*2+1)) mod 
           Number (Divisors (I));
      end loop;
      
      Put ("Reminders : ");
      for I in Reminders'Range loop
         Put (Reminders (I)'Image);
         Put (" ");
      end loop;
      New_Line;
      
      Put ("Divisors  : ");
      for I in Divisors'Range loop
         Put (Divisors (I)'Image);
         Put (" ");
      end loop;
      New_Line;
      
      for I in Divisors'Range loop
         Product := Product * Divisors (I);
      end loop;
      
      for I in Divisors'Range loop
         declare
            Partial_Product : Positive_Number;
            Inv : Positive_Number;
         begin
            Partial_Product := Product / Divisors (I);
            Inverse (Partial_Product, Divisors (I), Inv);
            Addends (I) := Number (Partial_Product) * Number (Inv) * Reminders (I);
         end;
      end loop;
      
      declare
         Sum : Number := 0;
      begin
         for I in Addends'Range loop
            Sum := Sum + Number (Addends (I));
         end loop;
         
         Sum := Sum mod Number (Product);
         
         Put (Sum'Image);
         New_Line;
      end;
         
   end;
   
end Reminder_Solver;
