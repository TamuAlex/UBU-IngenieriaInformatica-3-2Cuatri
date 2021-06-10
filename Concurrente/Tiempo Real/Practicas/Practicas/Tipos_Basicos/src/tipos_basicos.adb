with Ada.Integer_Text_IO use Ada.Integer_Text_IO;
with Ada.Float_Text_IO use Ada.Float_Text_IO;
with Ada.Text_IO use Ada.Text_IO;


procedure Tipos_Basicos is

   I:   Integer := 10;
   J, K:Integer;
   M:   Integer := 2*I;
   F:   Float;
   Pi:  constant Float := 3.14159_26536;
   B:   Character;

begin
   J := 2 * J; --Correcto, pero de resultado indeterminado, porque
               --J no esta inicializado
               --Dara un Warning al compilar

   --F := 2 * I; --error de compilacion: Tipos incompatibles
   F := 2.0 * Float(I); --Correcto


   Ada.Text_IO.Put(Integer'Impage(I));Ada.Text_IO.New_Line;
   Text_IO.Put("    Sin 'Image   ");
   Put(F);
   Text_IO.New_Line;

   M:= A mod I;

   --Put("  Mod  " & Integer'Image(A)) Me ha quitado el ejemplo de la pizarra
end Tipos_Basicos;
