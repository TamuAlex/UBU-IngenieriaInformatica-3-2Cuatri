with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Ejemplo_For is
   Maximo : Float := Float'First;
   --Float'First es el minimo valor que puede tomar la variable float.
   --Tambien es el primer valor de un tipo enumerado o del indice de un vector.
   --Type Tipo_entero is range -1..5;
   --pragma Assert (Tipo_entero'First = -1); --Correcto
   X : Float;
   Num_Veces : Integer;

begin
   Put("Maximo: ");
   Put(Maximo); New_Line;
   Put("Numero de valores: ");
   Get(Num_Veces); Skip_Line;

   for I in 1..Num_Veces loop
      Put("Valor :");
      Get(X); Skip_Line;
      if X>Maximo then
         Maximo:=X;
      end if;
   end loop;
   Put("El maximo es: ");
   Put(Maximo);
   New_Line;
end Ejemplo_For;
