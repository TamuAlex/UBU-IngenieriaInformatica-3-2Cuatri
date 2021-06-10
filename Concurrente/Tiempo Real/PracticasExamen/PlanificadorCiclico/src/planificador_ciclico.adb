with Ada.Text_IO, ada.Calendar;
use Ada.Text_IO, ada.Calendar;

procedure planificador_Ciclico is

   Comienzo : Time := Clock; --Hora de comienzo


   task principal is
      entry Ejecutar(Id : in Integer; Tiempo: in Integer);
   end principal;

   task body principal is
      Semaforo : Integer := 1;

   begin
      Put_Line("Principal - preparada");

      loop
         select
            when Semaforo = 1 =>
               accept Ejecutar(Id : in Integer; Tiempo: in Integer) do
                  Semaforo := 0;
                  Put_Line("+++Inicio Tarea"&Integer'Image(Id)&" "&Duration'Image(Clock-Comienzo));
                  delay (Duration(Tiempo));
                  Put_Line("---Fin    Tarea"&Integer'Image(Id)&" "&Duration'Image(Clock-Comienzo));
                  Semaforo := 1;
               end Ejecutar;
         end select;
      end loop;
   end principal;


   task type Tarea_periodica(Id: Integer; T: Integer; D: Integer; C: Integer);
   type Tarea_dinamica is access Tarea_periodica;

   task body Tarea_Periodica is
      Periodo : constant Duration:=Duration(T);
      Proximo_Periodo : Time := Clock;
   begin
      loop
         Principal.Ejecutar(Id, C);

         Proximo_Periodo:=Proximo_Periodo+Periodo;
         delay until Proximo_Periodo;
      end loop;
   end Tarea_Periodica;

   Tarea1 : Tarea_dinamica;
   Tarea2 : Tarea_dinamica;
   Tarea3 : Tarea_dinamica;



begin
   Put_Line("Inicio");

   Tarea1 := new Tarea_Periodica(1,4,4,1);
   Tarea2 := new Tarea_Periodica(2,5,5,2);
   Tarea3 := new Tarea_Periodica(3,10,10,1);

end planificador_Ciclico;
