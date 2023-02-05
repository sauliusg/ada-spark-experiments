pragma Spark_Mode (On);

with Ada.Text_IO;  use Ada.Text_IO;
with Group_Theory;
   
package Make_Group is
   
   type Ring_Element is mod 37;
   
   Identity : constant Ring_Element := 1;
   
   Ring_Size : constant Natural :=
     Natural (Ring_Element'Last - Ring_Element'First) + 1
     with Ghost;
   
   package Mod_Group_theory is new Group_Theory (Ring_Element, Identity);
   
   use Mod_Group_Theory;
   
   function Make_Group (E : Ring_Element) return Group
     with
     Pre => E = Identity,
     Post => Is_Group (Make_Group'Result);
   
   function Make_Full_Group return Group
     with
     Post => Is_Group (Make_Full_Group'Result);
   
   function Build_Group (E : Ring_Element) return Group
     with
     Post => Is_Group (Build_Group'Result);

end Make_Group;
