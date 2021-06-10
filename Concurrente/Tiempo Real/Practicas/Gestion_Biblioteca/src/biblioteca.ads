package biblioteca is
     type tipoLibros is private;
   procedure Coger_Libro;
   procedure Dejar_Libro;
   procedure Consultar_Copias;


private

   type tipoLibros is array (1..5) of integer;
end biblioteca;
