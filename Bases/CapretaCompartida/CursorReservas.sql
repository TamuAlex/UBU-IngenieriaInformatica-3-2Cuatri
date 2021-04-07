create or replace procedure listaReservas is
    type typeReserva is RECORD (
        pista integer,
        fecha reservas.fecha%type,
        socio reservas.socio%type,
        hora integer
    );
    
    miReserva typeReserva;
    
    cursor cursorReserva is
        select pista, fecha, socio, hora from reservas;
        
begin
    
    open cursorReserva;
    
    loop
        fetch cursorReserva into miReserva;
        
        exit when cursorReserva%notfound;
        DBMS_OUTPUT.put_line(miReserva.pista || ' ' ||miReserva.fecha || ' ' ||miReserva.socio || ' ' ||miReserva.hora );
    
    end loop;
    
    close cursorReserva;
    
end;
/


set serveroutput on
declare
begin
    listaReservas;
end;
/