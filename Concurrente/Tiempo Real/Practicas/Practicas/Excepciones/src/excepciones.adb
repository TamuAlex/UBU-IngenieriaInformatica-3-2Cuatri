With Ada.Text_IO;

procedure Excepciones is
   I: Integer;

begin
   I :=0;
   I := 4 / I; --Elevara una excepcion constrainte_error
   Ada.Text_IO.Put_Line("resultado" & Integer'Image(I));

exception
   when Constraint_Error =>
      Ada.Text_IO.Put_Line("Intento de dividir por 0");
end Excepciones;
