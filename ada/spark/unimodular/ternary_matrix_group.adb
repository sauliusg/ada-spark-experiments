package body Ternary_Matrix_Group with Spark_Mode is

   procedure Unity_Matrix_Times_Itself_Gives_Unity is
   begin
      pragma Assume (Unity_Matrix * Unity_Matrix = Unity_Matrix);
   end;
   
   procedure Unity_Matrix_Times_Dyad_Z_Gives_Dyad_Z is
   begin
      pragma Assume (Unity_Matrix * Dyad_Z_Axis_Matrix = Dyad_Z_Axis_Matrix);
      pragma Assume (Dyad_Z_Axis_Matrix * Unity_Matrix = Dyad_Z_Axis_Matrix);
   end;
   
   procedure Unity_Matrix_Is_Identity is
   begin
      pragma Assume
        (for all E of P2_Group => 
           Unity_Matrix * E = E and E * Unity_Matrix = E
        );
      Unity_Matrix_Times_Itself_Gives_Unity;
      Unity_Matrix_Times_Dyad_Z_Gives_Dyad_Z;
   end;
     
   procedure P2_Is_Group is
   begin
      Unity_Matrix_Times_Itself_Gives_Unity;
      Unity_Matrix_Times_Dyad_Z_Gives_Dyad_Z;
      pragma Assert (Is_Identity (P2_Group(P2_Group'First), Group (P2_Group)));
      pragma Assume (All_Elements_Have_Inverses (Group (P2_Group)));
      pragma Assume (Is_Closed_On_Multiplication (Group (P2_Group)));
      null;
   end;
   
end Ternary_Matrix_Group;
