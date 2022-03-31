with Text_IO; use Text_IO;

procedure Try_Tasks is
   
   Counter : Integer := 0;
   
   task Counter_Task is
      entry Increment;
   end;
   
   task Subtask_1;
   task Subtask_2;
   
   task body Counter_Task is
   begin
      loop
         accept Increment do
            Counter := Counter + 1;
         end;
      end loop;
   end;
   
   task body Subtask_1 is
   begin
      Put_Line ("This is a subtask 1");
      for I in 1 .. 10000 loop
         Counter_Task.Increment;
      end loop;
   end;
   
   task body Subtask_2 is
   begin
      Put_Line ("This is a subtask 2");
      for I in 1 .. 10000 loop
         Counter_Task.Increment;
      end loop;
   end;
   
begin
   Put_Line ("This is the MAIN task");
   Put (Integer'Image (Counter));
end;
