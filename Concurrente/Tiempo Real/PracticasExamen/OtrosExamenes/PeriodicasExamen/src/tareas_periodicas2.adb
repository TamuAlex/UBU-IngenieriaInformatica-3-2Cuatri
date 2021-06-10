With Ada.Real_Time, Ada.Text_IO;
use Ada.Real_Time, Ada.Text_IO;

procedure Tareas_Periodicas2 is
   Inicio : Time := Clock;
   Actual: Time;
   Tiempo : Integer :=0;
   A : Time_Span := Milliseconds(1000);

   task tarea1;
   task body tarea1 is
      Period : constant Time_Span:=Milliseconds(1000);
      Next_Time : Time := Clock;

   begin
      loop
         delay until Next_Time;
         Actual := Clock;
         Tiempo := (Actual - Inicio)/A;
         Put_Line("Segundo "& Tiempo'Img &" -> Soy la tarea que se ejecuta cada 1 segundo");
         Next_Time := Next_Time + Period;
      end loop;
   end tarea1;


   task tarea2;
   task body tarea2 is
      Period : constant Time_Span:=Milliseconds(2000);
      Next_Time : Time := Clock;

   begin
      loop
         delay until Next_Time;
         Actual := Clock;
         Tiempo := (Actual - Inicio)/A;
         Put_Line("Segundo "& Tiempo'Img &" -> Soy la tarea que se ejecuta cada 2 segundo");
         Next_Time := Next_Time + Period;

         if Tiempo = 10 then
            Put_Line("Abortando tarea 1");
            abort tarea1;
         end if;

         if tiempo = 16 then
            Put_Line("Abortando tarea 2");
            abort tarea2;
            end if;
      end loop;
   end tarea2;





begin
   null;

end Tareas_Periodicas2;
