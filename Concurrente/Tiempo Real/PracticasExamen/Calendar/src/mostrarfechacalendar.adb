with Ada.Text_IO, ada.Calendar;
use Ada.Text_IO, ada.Calendar;

procedure Mostrarfechacalendar is

   Tiempo : Ada.Calendar.Time;


   Dia    : Ada.Calendar.Day_Number;
   Mes    : Ada.Calendar.Month_Number;
   Anio   : Ada.Calendar.Year_Number;


   Hora, Minuto, Segundo : Integer;


begin
   Tiempo := Ada.Calendar.Clock;
   --Usamos el reloj para sincronizar el tiempo, sino, nos lo da mal

   Dia := Ada.Calendar.Day(Tiempo);
   Mes := Ada.Calendar.Month(Tiempo);
   Anio := Ada.Calendar.Year(Tiempo);

   Hora := Integer(Seconds(Tiempo))/3600;
   Minuto:= (Integer(Seconds(Tiempo))-Hora*3600)/60;
   Segundo:= (Integer(Seconds(Tiempo))-Hora*3600-Minuto*60);

   Put("La fecha de hoy es: ");
   Put( Ada.Calendar.Day_Number'Image(Dia));
   Put(" /");
   Put( Ada.Calendar.Month_Number'Image(Mes));
   Put(" /");
   Put( Ada.Calendar.Year_Number'Image(anio));

   Put_Line("Y la hora es: "&Integer'Image(Hora)&":"&Integer'Image(Minuto)
           &":"&Integer'Image(Segundo));

end Mostrarfechacalendar;
