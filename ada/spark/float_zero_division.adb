with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Float_Zero_Division is
   pragma Spark_Mode(ON);
   
   X, Y, Z : Float;
   
begin
   
   X := 1.0;
   Y := 0.0;
   
   Put(X); New_Line;
   Put(Y); New_Line;
   
   Z := X / Y;
   
   Put(Z); New_Line;
   
   X := -1.1;
   
   Put(X); New_Line;
   
   Z := X / Y;
   
   Put(Z); New_Line;   
   
end Float_Zero_Division;
