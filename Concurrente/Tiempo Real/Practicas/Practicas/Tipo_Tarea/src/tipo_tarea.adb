With Ada.Text_IO;

procedure Tipo_Tarea is
   task type A_Type;
   task type B_Type;

   A: A_Type;
   B: B_Type;

   task body A_Type is
   begin
      loop
         Ada.Text_IO.Put_Line("Soy la tarea A, con 3 de delay");
         delay 3.0;
      end loop;

   end A_Type;

   task body B_Type is
   begin
      loop
         Ada.Text_IO.Put_Line("Soy la tarea A, con 3 de delay");
         delay 3.0;
      end loop;

   end B_Type;

begin
   Ada.Text_IO.Put_Line("Prog. prpal.");

end Tipo_Tarea;
