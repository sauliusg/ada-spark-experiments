with Text_IO; use Text_IO;

procedure Try_Tasks is
   
   task Counter_Task is
      entry Increment;
      entry Get_Counter( Counter_Value : out Integer );
      entry Finish;
   end;
   
   task Subtask_1 is
      entry Wait;
   end;
   
   task Subtask_2 is
      entry Wait;
   end;
   
   task body Counter_Task is
      Counter : Integer := 0;
   begin
      loop
         select
            accept Increment do
               Counter := Counter + 1;
            end;
         or 
            accept Get_Counter( Counter_Value : out Integer ) do
               Counter_Value := Counter;
            end;
         or
            accept Finish;
            exit;
         end select;
      end loop;
   end;
   
   task body Subtask_1 is
   begin
      Put_Line ("This is a subtask 1");
      for I in 1 .. 10000 loop
         Counter_Task.Increment;
         if I mod 1000 = 0 then
            Put_Line ("Task 1: incrementing counter for the " & 
                        Integer'Image (I) & "-th time" );
         end if;
      end loop;
      accept Wait;
   end;
   
   task body Subtask_2 is
   begin
      Put_Line ("This is a subtask 2");
      for I in 1 .. 10000 loop
         Counter_Task.Increment;
         if I mod 1000 = 0 then
            Put_Line ("Task 2: incrementing counter for the " & 
                        Integer'Image (I) & "-th time" );
         end if;
      end loop;
      accept Wait;
   end;
   
begin
   Put_Line ("This is the MAIN task");
   Subtask_1.Wait;
   Subtask_2.Wait;
   declare
      Counter : Integer;
   begin
      Counter_Task.Get_Counter (Counter);
      Put (Integer'Image (Counter));
   end;
   Counter_Task.Finish;
end;
