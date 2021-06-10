package body ModCola is

   type Nodo_Cola_T;
   type Nodo_Cola_PtrT is access Nodo_Cola_T;
   type Nodo_Cola_T is
      record
         Contenido : Elemento;
         Siguiente : Nodo_Cola_PtrT;
      end record;
   
   type Cola_T is
      record
         Frente : Nodo_Cola_PtrT;
         Fina : Nodo_Cola_PtrT;
      end record;
   
   type Cola_T is
         record
            Frente : Nodo_Cola_PtrT;
            Final : Nodo_Cola_PtrT;
         end record;
      
   type Cola_PtrT is access Cola_T;
   
   Q : Cola_PtrT;
   
   
   procedure Crear is
   begin
      Q:= new Cola_T;
   end Crear;
   
   
   function Vacia return Boolean is
   begin
      return Q.Frente = null;
   end Vacia;
   
   procedure Insertar(E: Elemento) is
      Nodo_Nuevo : Nodo_Cola_PtrT;
   begin
      Nodo_Nuevo := new Nodo_Cola_T;
      Nodo_Nuevo.Contenido := E;
      Nodo_Nuevo.Siguiente := null;
      if Vacia then
         Q.Frente := Nodo_Nuevo;
      else
         Q.Final.Siguiente := Nodo_Nuevo;
      end if;
      Q.Final := Nodo_Nuevo;
   end Insertar;
   
   
   procedure Eliminar (E: out Elemento) is
      Nodo_Antiguo : Nodo_Cola_Ptr;
   begin
      Nodo_Antiguo := Q.Frente;
      E := Nodo_Antiguo.Contenido;
      Q.Frente := Q.Frente.Siguiente;
      if Q.Frente = null then
         Q.Final := null;
      end if
   end Eliminar;
   
begin
   Crear;
   end ModCola;

end ModCola;
