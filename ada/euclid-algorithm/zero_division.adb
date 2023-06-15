with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Zero_Division is
   pragma Spark_Mode(ON);
   
   function F( X : Integer ) return Integer is
   begin
      pragma Assert ( X * X / X > 0 );
      return X;
   end;
   
   X : Integer;
   
begin
   
   X := F(1);
   
   Put(X); New_Line;
   
   X := F(0);
   
   Put(X); New_Line;
   
end Zero_Division;
