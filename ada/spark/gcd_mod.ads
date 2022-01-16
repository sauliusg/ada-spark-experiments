pragma Ada_2022;

package GCD_Mod with Spark_Mode Is

   function Is_Divisor (A,D : Positive) return Boolean
     is (A mod D = 0)
     with
       Ghost,
       Pre => A in Positive and then D in Positive,
       Post => Is_Divisor'Result = (A mod D = 0);
   
   function GCD (A, B : in Positive) return Positive
     with
     Pre  => 
       A > 0 and then A <= Positive'Last and then 
       B > 0 and then B <= Positive'Last,
     Post => Is_Divisor (A, GCD'Result);
         
end GCD_Mod;
