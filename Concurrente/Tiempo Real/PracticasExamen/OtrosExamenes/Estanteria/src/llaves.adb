with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Llaves is

   es_llaves : estanteria_llaves :=(others => True);
   procedure Crear is
   begin
      
      null;
      
   end Crear;
   
   
   
   procedure Coger_Llave is

      llave : Integer;
      Dni : String(1..9);
      Fich: Ada.Text_IO.File_Type;
      
   begin
         Put_Line("Introduce el numero de llave que quieras coger: ");
         Get(llave);


         if llave <=0 or llave > es_llaves'Size then
            Put_Line("Introduce un numero de llave correcto");
         else
            Put_Line("Introduce tu DNI");
            Get(Dni);
            if es_llaves(llave) then
               es_llaves(llave) := False;
            Put_Line("Llave retirada");
            Ada.Text_IO.Create(Fich, Ada.Text_IO.Out_File, "DNI.txt");
            Ada.Text_IO.Put_Line(Fich, Dni);
            Ada.Text_IO.Close(Fich);
            else
            Put_Line("La llave ya estaba retirada");
            end if;
            
            
            
            
         end if;

         
      end Coger_Llave;
      
            
 
   procedure Dejar_Llave is
      
      llave : Integer;
      
   begin
      Put_Line("Introduce el numero de llave que quieras dejar: ");
      Get(llave);
      
      
      if llave <=0 or llave >es_llaves'Size then
         Put_Line("Introduce un numero de llave correcto");
         
      else
         
        if es_llaves(llave) = False then
            es_llaves(llave) := true;
            Put_Line("Llave dejada"); 
         else
            Put_Line("La llave ya estaba retirada");
         end if;
      end if;
      
   end Dejar_Llave;
   
   
   procedure Consultar_Llaves is
   begin
      Put_Line("CONSULTA LLAVES ");
      
      for i in es_llaves'Range loop
         if es_llaves(i) then
            Put_Line("La llave " & Integer'Image(i) & " se encuentra en la estanteria");
         else
            Put_Line("La llave " & Integer'Image(i) & " no se encuentra en la estanteria");
         end if;
      end loop;
   end Consultar_Llaves;
   
   begin
         
   
   null;

         
         
   
end Llaves;
