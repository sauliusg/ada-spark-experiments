pragma Spark_Mode (On);

generic
   type Element is private;
   Identity : Element;
   with function "*" (E, F: Element) return Element is <>;
   
package Group_Theory is
   
   type Group is array (Integer range <>) of Element;
   
   function Is_Identity (I : Element; G : Group) return Boolean
   is (for all E of G => I * E = E and E * I = E)
     with 
     Ghost,
     Post => (Is_Identity'Result = (for all E of G => I * E = E and E * I = E));
   
   function Is_Inverse (A, B : Element) return Boolean
   is (A * B = Identity and then B * A = Identity)
     with Ghost;
   
   function Has_Identity (G : Group) return Boolean
   is (for some E of G => (Is_Identity (E, G)))
     with Ghost;
   
   function Has_Inverse (E : Element; G : Group) return Boolean
   is (for some H of G => (Is_Inverse (E, H)))
     with Ghost;
   
   function Belongs_To (E : Element; G : Group) return Boolean
   is (for some F of G => (E = F))
     with Ghost;
   
   function Is_Group (G : Group) return Boolean
   is (Has_Identity (G) and then
         (for all E of G => (Has_Inverse (E, G))) and then
         (for all E of G =>
            (for all F of G => (Belongs_To (E*F, G))))
      )
     with Ghost;
   
end Group_Theory;
