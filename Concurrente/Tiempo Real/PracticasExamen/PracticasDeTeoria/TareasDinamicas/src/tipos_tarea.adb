with Ada.Text_IO;

package body Tipos_Tarea is
   ----------------------
   -- Tarea Repetitiva --
   ----------------------
   
   task body Tarea_Repetitiva is
      
   begin
      loop
         Ada.Text_IO.Put_Line("Id="&IdTarea'Img);
         delay 1.0;
      end loop;
   end Tarea_Repetitiva;
end Tipos_Tarea;
