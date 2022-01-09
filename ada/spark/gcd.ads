package GCD with Spark_Mode Is

   function GCD (A, B : in Integer) return Integer
     with
     Pre  => 
       A > 0 and then A <= Integer'Last and then B > 0 and then
       B <= Integer'Last,
     Post =>
       GCD'Result > 0 and then
       A mod GCD'Result = 0 and then
       B mod GCD'Result = 0;
   
end GCD;
