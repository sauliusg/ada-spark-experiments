separate(Synthesis_Rational)

procedure Put_Rational (R : Rational) is
begin
   Put ("(");
   Put (Numerator(R),0);
   Put ("/");
   Put (Denominator(R),0);
   Put (")");
end;
