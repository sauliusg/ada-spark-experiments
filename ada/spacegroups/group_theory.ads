pragma Spark_Mode (On);

generic
   type Element is private;
   Identity : Element;
   with function "*" (G1, G2: Element) return Element is <>;
   with function Inverse (G: Element) return Element;
   
package Group_Theory is
   
   function Compute_Inverse (G: Element) return Element
   is (Inverse (G))
     with Post => G * Compute_Inverse'Result = Identity;
   
end Group_Theory;
