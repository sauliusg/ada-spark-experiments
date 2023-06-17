with Unities; use Unities;
with Group_Theory;

package Prove_Unity_Integers_Are_Group with Spark_Mode is
   
   type Unity_Integer_Array is array (1..2) of Unity_Integers;
   
   package Unity_Group_Theory is 
      new Group_Theory (Unity_Integers, Unity_Integers(1));
   
   use Unity_Group_Theory;
   
   Units : constant Unity_Integer_Array := (1, -1);
   
   procedure Unity_Integers_Are_Group
     with
     Ghost,
     Post => (Is_Group (Group (Units)));
   
   function Make_Full_Group return Group
     with
     Post => Is_Group (Make_Full_Group'Result);
   
end Prove_Unity_Integers_Are_Group;
