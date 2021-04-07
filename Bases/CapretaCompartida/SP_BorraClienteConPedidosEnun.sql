DROP TABLE clientes CASCADE CONSTRAINTS;
DROP TABLE pedidos CASCADE CONSTRAINTS;

DROP SEQUENCE sec_clientes;
DROP SEQUENCE sec_pedidos;

CREATE SEQUENCE sec_clientes;
CREATE SEQUENCE sec_pedidos;

CREATE TABLE clientes(
	idCliente	INTEGER PRIMARY KEY,
	nombre		VARCHAR(20) NOT NULL
);

CREATE TABLE pedidos(
	idPedido	INTEGER PRIMARY KEY,
	idCliente	INTEGER REFERENCES clientes NOT NULL,
	articulo	CHAR(10),
	cantidad	INTEGER,
	precio		NUMERIC(5,2)
);

INSERT INTO clientes VALUES( sec_clientes.nextval, 'PEPE');
--PEPE compra 5 unidades del articulo 1
INSERT INTO pedidos VALUES( sec_pedidos.nextval, sec_clientes.currval, 'ARTICULO 1', 5, 10);
--PEPE compra 5 unidades del articulo 2
INSERT INTO pedidos VALUES( sec_pedidos.nextval, sec_clientes.currval, 'ARTICULO 2', 5, 10);	


INSERT INTO clientes VALUES( sec_clientes.nextval, 'ANA');


/*
Borrar Clientes

Author: Juan Luis Garcia Gonzalez && Alejandro Ortega Martinez

Date: 31/03/2021
*/
create or replace procedure borrarCliente(arg_nroDelCliente clientes.idCliente%type) is

    FK_REFERENCED   exception;
    CLI_NO_EXIST    exception;
    CLI_CON_PEDID   exception;
    
    PRAGMA EXCEPTION_INIT(FK_REFERENCED, -2292);
    PRAGMA EXCEPTION_INIT(CLI_NO_EXIST, -20001);
    PRAGMA EXCEPTION_INIT(CLI_CON_PEDID, -20002);
    
 begin
    delete from clientes where idCliente = arg_nroDelCliente;
    if sql%rowcount=1 then
        commit;
    else
        raise_application_error(-20001, 'El cliente'||arg_nrodelcliente||' no existe');
        rollback;
    end if;

exception
    when FK_REFERENCED then
        raise_application_error(-20002, 'El cliente'||arg_nrodelcliente||' aun tiene pedidos');
        rollback;
    
commit;
end;
/

/*
Test Borrar Clientes

Author: Juan Luis Garcia Gonzalez && Alejandro Ortega Martinez

Date: 31/03/2021
*/
create or replace procedure test_borra_cliente is
begin
  --Caso 1: Intentar Borrar cliente 3  
  begin
    borrarCliente(3);
    dbms_output.put_line('Mal no detecta CLIENTE_NO_EXIST');
  exception
    when others then
      if sqlcode = -20001 then
        dbms_output.put_line('Detecta OK CLIENTE_NO_EXIST: '||sqlerrm);
      else
        dbms_output.put_line('Mal no detecta CLIENTE_NO_EXIST: '||sqlerrm);
      end if;
  end;
  
  --Caso 2: Intenta borrar el cliente 1 (tiene 2 pedidos)
   begin
    borrarCliente(1);
    dbms_output.put_line('Mal no detecta CLIENTE_TIENE_PEDIDOS');
  exception
    when others then
      if sqlcode = -20002 then
        dbms_output.put_line('Detecta OK CLIENTE_TIENE_PEDIDOS: '||sqlerrm);
      else
        dbms_output.put_line('Mal no detecta CLIENTE_TIENE_PEDIDOS: '||sqlerrm);
      end if;
  end;
    
  --Caso 5: Todo OK
  declare
    varContenidoReal varchar(500);
    varContenidoEsperado    varchar(500):=    
    '1PEPE';
    
      
  begin
    borrarCliente(2);
    rollback; --por si se olvida commit de matricular
    
    SELECT listagg( idCliente||nombre, '#')
     within group (order by idCliente)
    into varContenidoReal
    FROM clientes;
    
    if varContenidoReal=varContenidoEsperado then
      dbms_output.put_line('BIEN: si modifica bien la BD.'); 
    else
      dbms_output.put_line('Mal: no modifica bien la BD.'); 
      dbms_output.put_line('Contenido real:     '||varContenidoReal); 
      dbms_output.put_line('Contenido esperado: '||varContenidoEsperado); 
    end if;
    
  exception
    when others then
      dbms_output.put_line('Mal caso todo OK: '||sqlerrm);
  end;
  
end;
/

begin
  test_borra_cliente;
end;
/


