with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with Llaves; use Llaves;
procedure Estanteria is
Num_Opcion : Integer range 1..4;
begin
loop
New_Line;
Put_Line("MENU:");
Put_Line(" ");
Put_Line("1-Coger llave");
Put_Line("2-Dejar llave");
Put_Line("3-Consultar llaves");
Put_Line("4-Salir");
Put("Elige una opcion:");
Get(Num_Opcion);
Skip_Line;
Put_Line(" ");
case Num_Opcion is
when 1 =>
Coger_Llave; --Procedimiento de Llaves
when 2 =>
Dejar_Llave; --Procedimiento de Llaves
when 3 =>
Consultar_Llaves; --Procedimiento de Llaves
when 4 => exit;
end case;
end loop;
end Estanteria;
