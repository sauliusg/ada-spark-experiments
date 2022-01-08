function Two_Plus_Two return Integer 
  with 
  Spark_MOde,
  Post    => Two_Plus_Two'Result = 4
is
begin
   return 2 + 2;
end Two_Plus_Two;
