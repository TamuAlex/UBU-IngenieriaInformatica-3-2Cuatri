with Ada.Text_IO;
use Ada.Text_IO;

procedure Una_Tarea is
   task Tarea_1;           --Declaracion de la tarea
   task body Tarea_1 is    --Cuerpo de la tarea
   begin
      loop
         Put_Line("Soy la tarea 1");
         delay 1.0;
      end loop;
   end Tarea_1;

begin
   Put_Line("Soy el prog. pral.");
end Una_Tarea;             --No termina hasta que no termina la Tarea_1
