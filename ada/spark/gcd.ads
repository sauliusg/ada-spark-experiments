package GCD with Spark_Mode Is

   function GCD (A, B : in Integer) return Integer
     with
     Pre  => A > 0 and A <= Integer'Last and B > 0 and B <= Integer'Last,
     Post => A mod GCD'Result = 0 and B mod GCD'Result = 0;
   
end GCD;
