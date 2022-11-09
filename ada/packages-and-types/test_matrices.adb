with Text_IO;  use Text_IO;
with Matrices; use Matrices;

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
   
begin
   
   Put (M1);
   New_Line;
   
   Put (M2);
   New_Line;
   
   Put (M1 * M2);
   New_Line;
   
   Put (M2 * M1);
   New_Line;
   
end Test_Matrices;
