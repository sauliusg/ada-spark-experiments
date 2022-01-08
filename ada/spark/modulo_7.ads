package Modulo_7 with Spark_Mode Is
   
   type Integer_Modulo_7 is range 0..6;
   
   procedure Increment
     (X : in out Integer_Modulo_7)
     with
     Pre  => X >= 0 and X <= 6,
     Post => (X'Old = 6 and X = 0) or X = X'Old + 1;
   
end Modulo_7;
