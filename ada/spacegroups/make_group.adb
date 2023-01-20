pragma Spark_Mode (On);

with Ada.Text_IO;  use Ada.Text_IO;
with Group_Theory;
   
package body Make_Group is
   
   function Make_Group (E : Ring_Element) return Group
   is
      G : Group (1 .. 1);
   begin
      G (1) := E;
      return G;
   end Make_Group;
   
end Make_Group;
