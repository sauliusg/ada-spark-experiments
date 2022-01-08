package Modulo_Power_Of_2 with Spark_Mode Is
   
   type Integer_Modulo_Power_Of_2 is mod 2**12;
   
   procedure Increment
     (X : in out Integer_Modulo_Power_Of_2)
     with
     Pre  => X >= 0 and X <= Integer_Modulo_Power_Of_2'Last,
     Post => (X'Old = Integer_Modulo_Power_Of_2'Last and X = 0) or X = X'Old + 1;
   
end Modulo_POwer_Of_2;
