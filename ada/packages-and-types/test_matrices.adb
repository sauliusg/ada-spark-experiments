with Text_IO;  use Text_IO;
with Matrices; use Matrices;
with Symops;   use Symops;

procedure Test_Matrices is
   
   M1 : Matrix :=
     (
      (1.1, 2.2, 0.3),
      (7.8, 1.2, 9.7),
      (4.3, 8.1, 2.7)
     );
   
   M2 : Matrix :=
     (
      (0.1, 0.2, 0.3),
      (0.4, 0.5, 0.6),
      (0.7, 0.8, 0.9)
     );
   
   M : Matrix :=
     (
      (1.1, 2.2, 0.3, 1.1),
      (7.8, 1.2, 9.7, 3.3),
      (4.3, 8.1, 2.7, 5.2),
      (4.4, 3.1, 7.9, 1.2)
     );
   
   S1 : Symop :=
     (
      (1.0, 0.0, 0.0, 0.0),
      (0.0, 1.0, 0.0, 0.0),
      (0.0, 0.0, 1.0, 0.0),
      (0.0, 0.0, 0.0, 1.0)
     );
   
   S2 : Symop :=
     (
      (-1.0,  0.0, 0.0, 0.0),
      ( 0.0, -1.0, 0.0, 0.0),
      ( 0.0,  0.0, 1.0, 0.0),
      ( 0.0,  0.0, 0.0, 1.0)
     );
   
begin
   
   Put (M1);
   New_Line;
   
   Put (M2);
   New_Line;
   
   Put (M1 * M2);
   New_Line;
   
   Put (M2 * M1);
   New_Line;
   
   Put_Line ("Symops:");
   New_Line;
   
   Put (S2);
   New_Line;
   
   Put (S2 * S2);
   New_Line;
   
   Put (Matrix (S2));
   New_Line;
   
   Put (Symop (M));
   New_Line;
   
end Test_Matrices;
