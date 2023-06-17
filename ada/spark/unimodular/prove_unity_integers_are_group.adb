package body Prove_Unity_Integers_Are_Group with Spark_Mode Is
   
   procedure Unity_Integers_Are_Group (A : Unity_Integer_Array) is
   begin
      pragma Assert (Is_Closed_On_Multiplication (Group (A)));
      pragma Assert (Has_Identity (Group (A)));
   end;
   
   function Make_Full_Group return Group
   is
      G : Group (1 .. 2) := (-1, 1);
   begin
      return G;
   end Make_Full_Group;

end Prove_Unity_Integers_Are_Group;
