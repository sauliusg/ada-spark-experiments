with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
with Ada.Float_Text_IO;   use Ada.Float_Text_IO; 

procedure Binary is
   
   One : constant Float := 1.0;
   
   function Machine_Epsilon return Float is
      Eps : Float := 1.0;
   begin
      while Eps + 1.0 /= 1.0 loop
         Eps := Eps / 2.0;
      end loop;
      return Eps;
   end;
   
   type Float_Array is array (Integer range <>) of FLoat;
   
   procedure Pad (S : in out String; C : Character) is
   begin
      for I in S'Range loop
         if S (I) = ' ' or else S (I) = '#' or else S (I) = '2' then
            S (I) := C;
         end if;
      end loop;
      S (S'Last) := '#';
      S (S'First) := '2';
      S (S'First + 1) := '#';
   end;
   
begin
   
   for M of Float_Array'(1.0, Machine_Epsilon, Float'Model_epsilon) loop
      declare
         Exp : constant Integer := 24;
         Width : constant Integer := Exp + 4;
         
         FM : Float := M * 2.0**Exp;
         IM : Integer := Integer (FM);
         Buffer : String (1 .. Width);
      begin
         Put (M); New_Line;
         Put (FM); New_Line;
         Put (IM); New_Line;
         Put (Buffer, IM, Base => 2);
         Pad (Buffer, '0');
         Put (Buffer); New_Line;
         New_Line;
         
         -- Check whether the printed value can be parsed:
         declare
            Dummy : Integer;
         begin
            Buffer := "2#0000000000000000000000010#";
            Get (Buffer, IM, Dummy);
            Put_Line ("Got back the value: " & IM'Image);
         end;
      end;
   end loop;
   
end;
