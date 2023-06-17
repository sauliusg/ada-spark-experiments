with Unities; use Unities;
with Group_Theory;

package Prove_Unity_Integers_Are_Group with Spark_Mode is
   
   type Unity_Integer_Array is array (1..2) of Unity_Integers;
   
   package Unity_Group_Theory is 
      new Group_Theory (Unity_Integers, Unity_Integers(1));
   
   use Unity_Group_Theory;
   
   procedure Unity_Integers_Are_Group (A : Unity_Integer_Array)
     with
     Ghost,
     Pre => (A = Unity_Integer_Array'(1, -1)),
     Post => (Is_Group (Group (A)));
   
end Prove_Unity_Integers_Are_Group;
