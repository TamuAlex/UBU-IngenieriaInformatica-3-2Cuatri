with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body biblioteca is

   opcion: Integer;
     
   
  
   libros:tipoLibros:=(2,2,2,2,2);
   
   procedure Coger_Libro is
   begin
      
      New_Line;
      Put_Line("Elige que libro quieres retirar (1-5)");
      Get(opcion);
      
      while opcion < 0 or opcion > 5 loop
         Put_Line("Elige un numero correcto (Del 1 al 5)");
         Get(opcion);
      end loop;
      
      if libros(opcion)<=0 then
         Put_Line("Lo siento, no quedan libros");
      else
         libros(opcion):=libros(opcion)-1;
         Put_Line("Libro sacado con exito");
      end if;
      
   end Coger_Libro;
   
   
   
   
   procedure Dejar_Libro is
   begin
      
      New_Line;
      Put_Line("Elige que libro quieres devolver (1-5)");
      Get(opcion);
      
      while opcion < 0 or opcion > 5 loop
         Put_Line("Elige un numero correcto (Del 1 al 5)");
         Get(opcion);
      end loop;
      
      libros(opcion):=libros(opcion)+1;
      Put_Line("Libro devuelto con exito, ahora quedan: " & Integer'Image(libros(opcion)) &"libros");
   
      
   end Dejar_Libro;
   
   
   
   procedure Consultar_Copias is
   begin
      
      New_Line;
      Put_Line("Elige que libro quieres consultar (1-5)");
      Get(opcion);
      
      while opcion < 0 or opcion > 5 loop
         Put_Line("Elige un numero correcto (Del 1 al 5)");
         Get(opcion);
      end loop;
      
      Put_Line("Quedan " & Integer'Image(libros(opcion)) & " libros del libro " & Integer'Image(opcion));

      
      
   end Consultar_Copias;
        
        
      
   

end biblioteca;
