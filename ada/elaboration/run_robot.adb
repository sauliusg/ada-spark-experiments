pragma Ada_2022;

with Ada.Text_IO;      use Ada.Text_IO;
with Robot_Controller; use Robot_Controller;

procedure Run_Robot is
begin
   Put_Line ("Robot Sense = " & Position'Image (Sense));
end Run_Robot;
