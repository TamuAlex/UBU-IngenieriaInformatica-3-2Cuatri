package ModCola is

   function Vacia return Boolean;
   procedure Insertar (E: Elemento);
   --Asuminmos que Elemento est� en el alcance
   procedure Eliminar (E: out Elemento);

end ModCola;
