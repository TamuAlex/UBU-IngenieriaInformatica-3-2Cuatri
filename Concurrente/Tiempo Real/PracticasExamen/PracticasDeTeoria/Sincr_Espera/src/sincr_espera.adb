with Ada.Text_IO;
use Ada.Text_IO;

procedure Sincr_Espera is

   type Dato is new Integer;


   task T1 is
      entry Arranca(Datos_iniciales : in Dato);
   end T1;

   task T2 is
      entry Arranca_Fase1(Datos_iniciales : in Dato);
      entry Arranca_Fase2;
   end T2;


   task body T1 is
      D : Dato;

   begin
      Put_Line("T1 - Preparada");
      accept Arranca (Datos_Iniciales: in Dato)
      do
         D:=Datos_Iniciales;
         Put_Line("T1 - Arranca con "&D'Img);
         delay 3.0;
         Put_Line("T1 - Fin arranca con "&D'Img);
      end Arranca;
      delay 3.0;
      Put_Line("T1 - Va a empezar fase 2 de T2");
      T2.Arranca_Fase2;
      Put_Line("T1 - hace mas cosas");
   end T1;



   task body T2 is
      D:dato;
   begin
      Put_Line("T2 - Preparada");

      accept Arranca_Fase1 (Datos_iniciales : in Dato) do
            D:=Datos_iniciales;
            Put_Line("T2 - Arrancado en fase 1 con "&D'Img);
         --Hace cosas de la fase 1
         delay 3.0;
         Put_Line("T2-Fin de la fase 1 con "&D'Img);

      end Arranca_Fase1;

      Put_Line("T2 - En espera de la fase 2");


      accept Arranca_Fase2  do
         Put_Line("T2 - Arrancado en fase 2");
         --Hace cosas de la fase 2
         delay 3.0;
         Put_Line("T2 - Fin de la fase 2");
      end Arranca_Fase2;
   end T2;


begin
   delay 3.0;
   Put_Line("MAIN - Inicio Main");
   delay 2.0;
   Put_Line("MAIN - main arranca T1");
   T1.Arranca(1);
   delay 1.0;
   Put_Line("MAIN - Main arranca Fase 1 de T2");
   T2.Arranca_Fase1(2);
   Put_Line("MAIN - Todo arrancado");
   delay 10.0;
   Put_Line("MAIN - fin de main");
end Sincr_Espera;
