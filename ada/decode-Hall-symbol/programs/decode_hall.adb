with Text_IO;             use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

procedure Decode_Hall is
   
   type Symop is array (1..4, 1..4) of Float;
   
   type Symop_Array is array (Positive range <>) of Symop;
   
   Zero_Matrix : constant Symop := (others => (others => 0.0));
   
   Unity_Matrix : constant Symop :=
     (
      (1 => 1.0, others => 0.0),
      (2 => 1.0, others => 0.0),
      (3 => 1.0, others => 0.0),
      (4 => 1.0, others => 0.0)
     );
   
   Ci_Matrix : constant Symop :=
     (
      (1 => -1.0, others => 0.0),
      (2 => -1.0, others => 0.0),
      (3 => -1.0, others => 0.0),
      (4 => -1.0, others => 0.0)
     );
   
   Inversion_Matrices : constant array (1..2) of Symop :=
     (Unity_Matrix, Ci_Matrix);
   
   type Crystallographic_Translation_Component is record
      Numerator : Integer range 0..6;
      Denominator : Integer range 1..6;
   end record;
      
   type Crystallographic_Translation is array (1..3)
     of Crystallographic_Translation_Component;
   
   A_Translation_Vector : constant Crystallographic_Translation :=
     ((0,1), (1,2), (1,2));
   
   B_Translation_Vector : constant Crystallographic_Translation :=
     ((1,2), (0,1), (1,2));
   
   C_Translation_Vector : constant Crystallographic_Translation :=
     ((1,2), (1,2), (0,1));
   
   I_Translation_Vector : constant Crystallographic_Translation :=
     ((1,2), (1,2), (1,2));
   
   R_Translation_Vector_1 : constant Crystallographic_Translation :=
     ((1,3), (2,3), (2,3));
   
   R_Translation_Vector_2 : constant Crystallographic_Translation :=
     ((2,3), (1,3), (1,3));
   
   F_Translation_Vector_1 : constant Crystallographic_Translation :=
     A_Translation_Vector;
   
   F_Translation_Vector_2 : constant Crystallographic_Translation :=
     B_Translation_Vector;
   
   F_Translation_Vector_3 : constant Crystallographic_Translation :=
     C_Translation_Vector;
   
   
   Translation_a : constant Crystallographic_Translation :=
     ((1,2), (0,1), (0,1));
   Translation_b : constant Crystallographic_Translation :=
     ((0,1), (1,2), (0,1));
   Translation_c : constant Crystallographic_Translation :=
     ((0,1), (0,1), (1,2));
   Translation_n : constant Crystallographic_Translation :=
     ((1,2), (1,2), (1,2));
   Translation_u : constant Crystallographic_Translation :=
     ((1,4), (0,1), (0,1));
   Translation_v : constant Crystallographic_Translation :=
     ((0,1), (1,4), (0,1));
   Translation_w : constant Crystallographic_Translation :=
     ((0,1), (0,1), (1,4));
   Translation_d : constant Crystallographic_Translation :=
     ((1,4), (1,4), (1,4));
   
   Translations_3_1 : constant Crystallographic_Translation_Component := (1,3);
   Translations_3_2 : constant Crystallographic_Translation_Component := (2,3);
   
   Translations_4_1 : constant Crystallographic_Translation_Component := (1,4);
   Translations_4_3 : constant Crystallographic_Translation_Component := (3,4);
   
   Translations_6_1 : constant Crystallographic_Translation_Component := (1,6);
   Translations_6_2 : constant Crystallographic_Translation_Component := (2,6);
   Translations_6_4 : constant Crystallographic_Translation_Component := (4,6);
   Translations_6_5 : constant Crystallographic_Translation_Component := (5,6);
   
   function To_Symop (T : Crystallographic_Translation) return Symop is
      S : Symop := Zero_Matrix;
   begin
      for I in T'Range loop
         S (I,4) := Float (T (I).Numerator) / Float (T (I).Denominator);
      end loop;
      return S;
   end;
   
   function To_Symop (T : Crystallographic_Translation_Component;
                      Axis : Positive) return Symop is
      S : Symop := Zero_Matrix;
   begin
      S (Axis,4) := Float (T.Numerator) / Float (T.Denominator);
      return S;
   end;
   
   Principal_Rotations : constant array (1..3, 1..4) of Symop :=
     (
      -- axis x (a)
      1 => (
            1 => ( -- twofold axis
                  (1.0,  0.0,  0.0,  0.0),
                  (0.0, -1.0,  0.0,  0.0),
                  (0.0,  0.0, -1.0,  0.0),
                  (0.0,  0.0,  0.0,  1.0)
                 ),
            2 => ( --treefold axis
                  (1.0,  0.0,  0.0,  0.0),
                  (0.0,  0.0, -1.0,  0.0),
                  (0.0,  1.0, -1.0,  0.0),
                  (0.0,  0.0,  0.0,  1.0)
                 ),
            3 => ( -- fourfold axis
                  (1.0,  0.0,  0.0,  0.0),
                  (0.0,  0.0, -1.0,  0.0),
                  (0.0,  1.0,  0.0,  0.0),
                  (0.0,  0.0,  0.0,  1.0)
                 ),
            4 => ( --sixfold axis
                  (1.0,  0.0,  0.0,  0.0),
                  (0.0,  1.0, -1.0,  0.0),
                  (0.0,  1.0,  0.0,  0.0),
                  (0.0,  0.0,  0.0,  1.0)
                 )
           ),
      -- axis y (b)
      2 => (
            1 => (
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  1.0,  0.0,  0.0),
                  ( 0.0,  0.0, -1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            2 => (
                  (-1.0,  0.0,  1.0,  0.0),
                  ( 0.0,  1.0,  0.0,  0.0),
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            3 => (
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  1.0,  0.0,  0.0),
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            4 => (
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  1.0,  0.0,  0.0),
                  (-1.0,  0.0,  1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 )
           ),
      -- axis z (c)
      3 => (
            1 => (
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0, -1.0,  0.0,  0.0),
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            2 => (
                  ( 0.0, -1.0,  0.0,  0.0),
                  ( 1.0, -1.0,  0.0,  0.0),
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            3 => (
                  ( 0.0, -1.0,  0.0,  0.0),
                  ( 1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            4 => (
                  ( 1.0, -1.0,  0.0,  0.0),
                  ( 1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 )
           )

     );
   
   Face_Diagonal_Rotations : constant array (1..3,1..2) of Symop :=
     (
      1 => (
            1 => (
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0, -1.0,  0.0),
                  ( 0.0, -1.0,  0.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            2 => (
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0,  1.0,  0.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 )
           ),
      2 => (
            1 => (
                  ( 0.0,  0.0, -1.0,  0.0),
                  ( 0.0, -1.0,  0.0,  0.0),
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            2 => (
                  ( 0.0,  0.0,  1.0,  0.0),
                  ( 0.0, -1.0,  0.0,  0.0),
                  ( 1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 )
           ),
      3 => (
            1 => (
                  ( 0.0, -1.0,  0.0,  0.0),
                  (-1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0, -1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 ),
            2 => (
                  ( 0.0,  1.0,  0.0,  0.0),
                  ( 1.0,  0.0,  0.0,  0.0),
                  ( 0.0,  0.0, -1.0,  0.0),
                  ( 0.0,  0.0,  0.0,  1.0)
                 )
           )
     );
   
   Body_Diagonal_Rotation : constant Symop :=
     (
      (0.0, 0.0, 1.0, 0.0),
      (1.0, 0.0, 0.0, 0.0),
      (0.0, 1.0, 0.0, 0.0),
      (0.0, 0.0, 0.0, 1.0)
     );
   
   procedure Skip_Spaces (S : in String; Pos : in out Integer ) is
   begin
      while Pos <= S'Last and then S (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;
   end;
   
   procedure Init_Centering_Matrices 
     (
      Symbol : in String;
      Pos : in out Positive;
      Symops : in out Symop_Array;
      N_Symops : in out Positive
     ) is
   begin
      Skip_Spaces (Symbol, Pos);
      null;
   end;
   
   function Decode_Hall (Symbol : in String) return Symop_Array is
      Max_Symops : constant Integer := 96;
      Symops : Symop_Array (1 .. Max_Symops);
      N_Symops : Positive := 1; -- The first element is allocated for the
                                -- unity matrix.
      Pos : Positive := 1;      -- current position in the string 'Symbol'.
      
      N_Inversions : Positive := 1;
      
      Rotations : Symop_Array (1..3);
      N_Rotations : Positive := 1;
      
      Centering : Symop_Array (1..4) := (others => Unity_Matrix);
      N_Centering : Positive := 1;
      
   begin
      Symops (1) := Unity_Matrix;
      return Symops (1..N_Symops);
   end;
   
   procedure Put (S : Symop) is
   begin
      for J in Symop'Range(1) loop
         for K in Symop'Range(1) loop
            Put (" " & S (J,K)'Image);
         end loop;
         New_Line;
      end loop;
   end;
   
   procedure Put (S : Crystallographic_Translation) is
      Ratio : Float;
   begin
      for I in S'Range loop
         Ratio := Float (S (I).Numerator) / Float (S (I).Denominator); 
         Put (" " & Ratio'Image);
      end loop;
      New_Line;
   end;
   
begin
   
   Put (A_Translation_Vector);
   New_Line;
   Put (B_Translation_Vector);
   New_Line;
   Put (C_Translation_Vector);
   New_Line;
   Put (I_Translation_Vector);
   New_Line;
   
   Put_Line ("Translation Matrices:");
   for I in 1..3 loop
      Put (To_Symop (Translations_3_1, I));
      New_Line;
   end loop;
   
   for I in 1..3 loop
      Put (To_Symop (Translations_6_1, I));
      New_Line;
   end loop;
   
   for I in 1..3 loop
      Put (To_Symop (Translations_6_4, I));
      New_Line;
   end loop;
   
   for I in 1..3 loop
      Put (To_Symop (Translations_6_5, I));
      New_Line;
   end loop;
   
   Put_Line ("Principal Rotations:");
   for I in Principal_Rotations'Range(1) loop
      for J in Principal_Rotations'Range(2) loop
         Put (Principal_Rotations (I,J));
         New_Line;         
      end loop;
   end loop;
   
   Put_Line ("Face Diagonal Rotations:");
   for I in Face_Diagonal_Rotations'Range(1) loop
      for J in Face_Diagonal_Rotations'Range(2) loop
         Put (Face_Diagonal_Rotations (I,J));
         New_Line;         
      end loop;
   end loop;
   
   for I in 1 .. Argument_Count loop
      Put_Line (Argument (I));
      declare
         Symops : Symop_Array := Decode_Hall (Argument (I));
      begin
         for I in Symops'Range loop
            Put (Symops (I));
            New_Line;
         end loop;
      end;
   end loop;
   
end Decode_Hall;
