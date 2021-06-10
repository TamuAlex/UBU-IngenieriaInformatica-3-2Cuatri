with Ada.Text_IO;
with Ada.Strings.Unbounded;


procedure Crearfichero is
   package ASU renames Ada.Strings.Unbounded;
   Fich: Ada.Text_IO.File_Type;
   S: ASU.Unbounded_String;
   T: ASU.Unbounded_String;
begin
   Ada.Text_IO.Create(Fich, Ada.Text_IO.Out_File, "prueba.tmp");
   --Ada.Text_IO.Open(Fich, Ada.Text_IO.In_File, "prueba.tmp");
   Ada.Text_IO.Put_Line(Fich, "esta es una linea");
   S:=ASU.To_Unbounded_String(Ada.Text_IO.Get_Line(Fich));
   Ada.Text_IO.Put(Asu.To_String(T));; New_Line;
   Ada.Text_IO.Close(Fich);
end Crearfichero;
