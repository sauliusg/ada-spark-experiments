package body Increment with Spark_Mode Is
   
   procedure Increment
     (X : in out Integer)
   is
   begin
      X := X + 1;
   end Increment;
   
end Increment;
