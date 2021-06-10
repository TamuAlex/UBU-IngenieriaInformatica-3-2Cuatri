package Llaves is

   procedure Coger_Llave;
   procedure Dejar_Llave;
   procedure Consultar_Llaves;
   
   
private
   procedure Crear;
   type estanteria_llaves is array (1..10) of Boolean;
   
   
end Llaves;
