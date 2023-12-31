with Unities; use Unities;
with Ternary_Matrices; use Ternary_Matrices;
with Group_Theory;

package Ternary_Matrix_Group with Spark_Mode is

   subtype Ternary_Matrix_3x3 is Ternary_Matrix(1..3, 1..3);
   
   Unity_Matrix : constant Ternary_Matrix_3x3 :=
     (
      (1, 0, 0),
      (0, 1, 0),
      (0, 0, 1)
     );
   
   Dyad_Z_Axis_Matrix : constant Ternary_Matrix_3x3 :=
     (
      (-1,  0,  0),
      ( 0, -1,  0),
      ( 0,  0,  1)
     );
   
   type Ternary_Matrix_Array is 
     array (Positive range <>) of Ternary_Matrix_3x3;

   P2_Group : constant Ternary_Matrix_Array :=
     (Unity_Matrix, Dyad_Z_Axis_Matrix);
     
   package Ternary_Matrix_Group_Theory is 
      new Group_Theory (Ternary_Matrix_3x3, Unity_Matrix);
   
   use Ternary_Matrix_Group_Theory;
   
   -- Lemata:
   
   procedure Unity_Matrix_Times_Itself_Gives_Unity
     with 
     Ghost,
     Post => Unity_Matrix * Unity_Matrix = Unity_Matrix;
     
   procedure Unity_Matrix_Times_Dyad_Z_Gives_Dyad_Z
     with 
     Ghost,
     Post => 
     Unity_Matrix * Dyad_Z_Axis_Matrix = Dyad_Z_Axis_Matrix and
     Dyad_Z_Axis_Matrix * Unity_Matrix = Dyad_Z_Axis_Matrix;
     
   procedure Unity_Matrix_Is_Identity
     with 
     Ghost,
     Post => 
     (for all E of P2_Group => Unity_Matrix * E = E and E * Unity_Matrix = E);
   
   procedure P2_Is_Group
     with
     Ghost,
     Post => (Is_Group (Group (P2_Group)));   

end Ternary_Matrix_Group;
