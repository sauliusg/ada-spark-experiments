package body Prove_Unity_Integers_Are_Group with Spark_Mode Is
   
   procedure Unity_Integers_Are_Group (A : Unity_Integer_Array) is
   begin
      pragma Assert (A (1) * A (1) = A (1));
      pragma Assert (A (2) * A (2) = A (1));
      pragma Assert (A (1) * A (2) = A (2));
      pragma Assert (A (2) * A (1) = A (2));

      pragma Assert (Is_Closed_On_Multiplication (Group (A)));
      pragma Assert (All_Elements_Have_Inverses (Group (A)));
      pragma Assert (Has_Identity (Group (A)));
      null;
   end;
   
end Prove_Unity_Integers_Are_Group;
