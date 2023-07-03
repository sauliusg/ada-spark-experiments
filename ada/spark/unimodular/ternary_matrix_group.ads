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
     array (Integer range <>) of Ternary_Matrix_3x3;

   P2_Group : constant Ternary_Matrix_Array :=
     (Unity_Matrix, Dyad_Z_Axis_Matrix);
     
   package Ternary_Matrix_Group_Theory is 
      new Group_Theory (Ternary_Matrix_3x3, Unity_Matrix);
   
   use Ternary_Matrix_Group_Theory;
   
   -- Lemata:
   
   procedure P2_Is_Group
     with
     Ghost,
     Post => (Is_Group (Group (P2_Group)));   

end Ternary_Matrix_Group;
