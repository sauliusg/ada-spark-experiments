package body Modulo_7 with Spark_Mode Is
   
   procedure Increment
     (X : in out Integer_Modulo_7)
   is
   begin
      X := (X + 1) rem 7;
   end Increment;
   
end Modulo_7;
