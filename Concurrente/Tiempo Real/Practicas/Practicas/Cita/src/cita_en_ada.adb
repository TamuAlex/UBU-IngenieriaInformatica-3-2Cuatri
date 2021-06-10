with Ada.Text_IO;
use Ada.Text_IO;

procedure Cita_En_Ada is

   task Tarea_1 is
      entry incrementar;
      entry decrementar;
      entry sumar (S: in Integer);
      entry mostrar;
      entry doblar;
   end Tarea_1;

   task body Tarea_1 is
      Contador : Integer:=0;
   begin
      Put_Line("Tarea 1 preparada");
      loop
         --Put_Line("Texto dentro del loop");

         select
            accept incrementar  do
               Contador:=Contador + 1;
            end incrementar;
         or
            accept decrementar  do
               Contador:=Contador-1;
            end decrementar;
         or
            accept sumar (S : in Integer) do
               Contador:=Contador+S;
            end sumar;
         or
            accept mostrar  do
               Put("         El valor del contador es");
               Put(Integer'Image(Contador));
               New_Line;
            end mostrar;
         or
            accept doblar  do
               Contador:=Contador*2;
            end doblar;
         or --Si esta esta sentencia, cuando el programa principal termina, la tarea tambien termina.
            --Si no, estaria todo el rato en bucle.

            terminate;
         end select;
      end loop;
   end; --Tarea_1

begin
   Put_Line("Soy el programa principal");
   delay 5.0;
   Tarea_1.mostrar;
   delay 1.0;
   Put_Line("Orden de incrementar");
   Tarea_1.incrementar;
      Tarea_1.mostrar;

   delay 1.0;
   Put_Line("Orden de decrementar");
   Tarea_1.decrementar;
      Tarea_1.mostrar;

   delay 1.0;
   Put_Line("Orden de sumar 3");
   Tarea_1.sumar(3);
   Tarea_1.mostrar;
   delay 1.0;
   Put_Line("Orden de doblar");
   Tarea_1.doblar;
   Tarea_1.mostrar;
   delay 5.0;
   Put_Line("Fin del programa principal");



end Cita_En_Ada;
