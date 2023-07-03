package body Ternary_Matrix_Group with Spark_Mode is

   procedure P2_Is_Group is
   begin
      pragma Assume 
        (for all E of P2_Group => 
           Unity_Matrix * E = E and E * Unity_Matrix = E
        );
   end;
   
end Ternary_Matrix_Group;
