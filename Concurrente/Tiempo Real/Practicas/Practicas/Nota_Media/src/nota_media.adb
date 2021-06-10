with Ada.Text_IO,Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;


procedure Nota_Media is
   Nota1, Nota2, Nota3, Nota_Media : Float;
begin
   Ada.Text_IO.Put("Nota del primer trimestre: ");
   Ada.Float_Text_IO.Get(Nota1);
   Ada.Text_IO.Skip_Line;

   Ada.Text_IO.Put("Nota del segundo trimestre: ");
   Ada.Float_Text_IO.Get(Nota2);
   Ada.Text_IO.Skip_Line;

   Ada.Text_IO.Put("Nota del tercer trimestre: ");
   Ada.Float_Text_IO.Get(Nota3);
   Ada.Text_IO.Skip_Line;mmmmmmmmmmmmmmmmmm

   Ada.Text_IO.New_Line;
   Nota_Media:=(Nota1+Nota2+Nota3)/3.0;

   --Ada.Text_IO.Put("Nota Media: ");
   --Ada.Float_Text_IO.Put(Nota_Media);
   Put("Nota media: " & Float'image(Nota_Media));
end Nota_Media;
