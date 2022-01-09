package GCD with Spark_Mode Is
   
   function Max (A, B : Integer) return Integer 
     with
     Import,
     Pre => A in Integer and then B in Integer, 
     Post => Max'Result = (if A > B then A else B);       
     
   function GCD (A, B : in Integer) return Integer
     with
     Pre  => 
       A > 0 and then A <= Integer'Last and then B > 0 and then
       B <= Integer'Last,
     Post => 
       not (for all D in 2 .. Max (A,B) => GCD'Result * D /= A);
         
     -- The following postcondition can not be (asily?) proved in
     -- 'gnatprove':
     -- 
     -- Post =>
     --   GCD'Result > 0 and then
     --   A mod GCD'Result = 0 and then
     --   B mod GCD'Result = 0;
   
end GCD;
