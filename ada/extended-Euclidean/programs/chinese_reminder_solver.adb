pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Extended_Euclidean_Mod_Generic;

procedure Chinese_Reminder_Solver is
   
   Primes : array (Positive range <>) of Short_Integer :=
     (
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 
      67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 
      139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211,
      223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283,
      293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379,
      383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461,
      463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,
      569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643,
      647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739,
      743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829,
      839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937,
      941, 947, 953, 967, 971, 977, 983, 991, 997
     );
   
   type Number is new Big_Integer;
   type Positive_Number is new Big_Positive;
   
   package Extended_Euclidean_Mod is 
      new Extended_Euclidean_Mod_Generic (Number, Positive_Number, 0, 1);
      
   use Extended_Euclidean_Mod;
   
begin
   
   declare
      Arguments : array (1 .. Argument_Count) of Natural;
      Addends : array (1 .. Argument_Count) of Number;
      Product : Positive_Number := 1;
   begin
      
      for I in 1 .. Argument_Count loop
         Arguments (I) := Natural'Value (Argument (I));
         Product := Product * To_Big_Integer (Positive (Primes (I)));
      end loop;
      
      for I in 1 .. Argument_Count loop
         declare
            Partial_Product : Positive_Number;
            Inv : Positive_Number;
         begin
            Partial_Product := Product / To_Big_Integer (Positive (Primes (I)));
            Inverse (Partial_Product, To_Big_Integer (Positive (Primes (I))), Inv);
            Addends (I) := Number (Partial_Product) * Number (Inv) * To_Big_Integer (Arguments (I));
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
   
end Chinese_Reminder_Solver;
