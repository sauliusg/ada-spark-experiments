pragma Spark_Mode (On);

with Ada.Text_IO;  use Ada.Text_IO;
with Group_Theory;
   
package Make_Group is
   
   type Ring_Element is mod 7;
   
   Identity : Ring_Element := 1;
   
   package Mod_Seven_Group_theory is new Group_Theory (Ring_Element, Identity);
   
   use Mod_Seven_Group_Theory;
   
   function Make_Group (E : Ring_Element) return Group
     with
     Pre => E = Identity,
     Post => Is_Group (Make_Group'Result);
   
end Make_Group;
