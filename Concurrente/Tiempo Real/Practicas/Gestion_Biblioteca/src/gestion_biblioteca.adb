with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with Biblioteca; use Biblioteca;


procedure Gestion_Biblioteca is
 Num_Opcion : Integer range 1..4;
begin

   loop
      New_Line;
      Put_Line("MENU:");
      Put_Line(" ");
      Put_Line("1-Coger Libro");
      Put_Line("2-Dejar Libro");
      Put_Line("3-Consultar Copias");
      Put_Line("4-Salir");
      Put("Elige una opcion:");
      Get(Num_Opcion);
      Skip_Line;
      Put_Line(" ");

      case Num_Opcion is
      when 1 =>
         Coger_Libro; --Procedimiento de Biblioteca
      when 2 =>
         Dejar_Libro; --Procedimiento de Biblioteca
      when 3 =>
         Consultar_Copias; --Procedimiento de Biblioteca
      when 4 => exit;
      end case;

 end loop;
end Gestion_Biblioteca;
