pragma Spark_Mode (On);

generic
   type Element is private;
   Identity : Element;
   with function "*" (G1, G2: Element) return Element is <>;
   with function Inverse (G: Element) return Element;
   
package Group_Theory is
   
   type Group is array (Integer range <>) of Element;
   
   function Compute_Inverse (G: Element) return Element
   is (Inverse (G))
     with Ghost, Post => G * Compute_Inverse'Result = Identity;
   
   function Is_Identity (I : Element; G : Group) return Boolean
   is (for all E of G => I * E = Identity and E * I = Identity)
     with 
     Ghost,
     Post => (Is_Identity'Result = (for all E of G => I * E = Identity and E * I = Identity));
   
   function Is_Inverse (A, B : Element) return Boolean
   is (A * B = Identity)
     with Ghost;
   
   function Has_Identity (GG : Group) return Boolean
   is (for some G of GG => (Is_Identity (G, GG)))
     with Ghost;
   
   function Has_Inverse (E : Element; GG : Group) return Boolean
   is (for some G of GG => (E * G = Identity and then G * E = Identity))
     with Ghost;
   
   function Belongs_To (E : Element; GG : Group) return Boolean
   is (for some G of GG => (E = G))
     with Ghost;
   
   function Is_Group (GG : Group) return Boolean
   is (Has_Identity (GG) and then
         (for all E of GG => (Has_Inverse (E, GG))) and then
         (for all E of GG =>
            (for all F of GG => (Belongs_To (E*F, GG))))
      )
     with Ghost;
   
end Group_Theory;
