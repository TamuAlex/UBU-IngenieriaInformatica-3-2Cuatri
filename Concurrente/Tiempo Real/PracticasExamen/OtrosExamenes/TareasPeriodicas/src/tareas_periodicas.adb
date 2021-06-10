with Ada.Text_IO, Ada.Real_Time;
use Ada.Text_IO, Ada.Real_Time;


procedure Tareas_Periodicas is

   task Tarea_periodica_1seg;
   task body Tarea_periodica_1seg is

   begin
      loop
         Put_Line("Soy la tarea que se ejecuta cada segundo");

         Delay(1.0);

      end loop;
   end Tarea_periodica_1seg;

   task Tarea_periodica_2seg;
   task body Tarea_periodica_2seg is
   begin
       loop
         Put_Line("Soy la tarea que se ejecuta cada 2 segundos");

         Delay(2.0);

      end loop;
   end Tarea_periodica_2seg;

begin
Put_Line("Comienza el programa");



end Tareas_Periodicas;

