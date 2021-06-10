with Ada.Real_Time, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Real_Time, Ada.Text_IO, Ada.Integer_Text_IO;

--Calcula cuanto tarda en contar desde 1 hasta 2001
procedure Duracion is

   Inicio, Fin : Time;
   Intervalo : Integer;

   A : Time_Span := Milliseconds(1);
   Cont : Integer :=0;

begin
   Inicio := Clock; --Guarda el tiempo inicial

   --Tarea a medir:
   loop
      exit when Cont > 20000;
      Cont := Cont+1;
      Put(Cont);
      New_Line;
   end loop;

   Fin := Clock; --guarda el tiempo final

   Intervalo := (Fin - Inicio) / A;
   Put("La duracion es de: ");
   Put(Intervalo);
   Put(" milisegundos");
end Duracion;
