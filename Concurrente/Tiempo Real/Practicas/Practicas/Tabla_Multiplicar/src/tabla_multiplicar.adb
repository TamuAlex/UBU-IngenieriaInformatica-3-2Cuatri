with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO,  Ada.Integer_Text_IO;

procedure Tabla_Multiplicar is
   Resultado,Limite:  Integer;
begin
   Put_Line("Hasta que numero quieres la tabla?");
   Get (Limite);
   Skip_Line;

   Put_Line("Tablas de Multiplicar");
   Put_Line("=====================");
   New_Line(2);

   for Fila in 1..Limite loop
      for Columna in 1..10 loop
         Resultado := Fila * Columna;

         --Put (Integer'Image(Fila) & "*" &
         --       Integer'Image(Columna) & "=" &
         --       Integer'Image(Resultado));
         Put (Fila);
         Put ("*");
         Put (Columna);
         Put("=");
         Put (Resultado);
         New_Line;
      end loop;
   end loop;

end Tabla_Multiplicar;
