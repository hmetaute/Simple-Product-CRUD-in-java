--Scripts para correr en plsql 

--Creación de secuencia para clave primaria de productos
create sequence producto_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

--Creacion de la tabla de productos
CREATE OR REPLACE TYPE OBJ_PRODUCTO AS OBJECT (
   id_producto number(9),
   nombre varchar2(15),
   descripcion varchar2(200),
   activo varchar2(1)
);

--Creacion de la tabla de subsaldos
CREATE TABLE TAB_PRODUCTOS OF OBJ_PRODUCTO;

--Insercion de datos semilla en la base de datos
insert into TAB_PRODUCTOS values(
producto_seq.nextval,
'Camisa Polo',
'Camisa polo Jeff'
);

insert into TAB_PRODUCTOS values(
producto_seq.nextval,
'Zapatos Colegio',
'Referencia 2010-015'
);

insert into TAB_PRODUCTOS values(
producto_seq.nextval,
'Camiseta jeff',
'Camiseta marca Jeff'
);

insert into TAB_PRODUCTOS values(
producto_seq.nextval,
'Tenis Adidas',
'Tenis marca Adidas'
);

--Creacion del paquete
CREATE OR REPLACE Package pck_productos is

cursor cur_productos_consulta (inmid_producto in number, ivanombre in varchar2, ivadescripcion in varchar2) is
  select 
    prod.id_producto,
    prod.nombre, 
    prod.descripcion 
  from 
    tab_productos prod
  where 
    lower(prod.nombre) like ('%' || lower(ivanombre) || '%') and
    lower(prod.descripcion) like ('%' || lower (ivadescripcion) || '%') and
    inmid_producto like ('%' || inmid_producto || '%');
    

    procedure sp_buscar_producto(ivanombre in varchar2, ivadescripcion in varchar2, cur_resulado out pck_tipos.ty_cursor_retorno);
    
    procedure sp_ingresar_producto(ivanombre in varchar2, ivadescripcion in varchar2, ivaactivo in varchar2);
    
    procedure sp_eliminar_producto(inmid_producto in number);
    
    procedure sp_actualizar_producto(inmid_producto in number, ivanombre in varchar2, ivadescripcion in varchar2, ivaactivo in varchar2);


end pck_productos;



--Implementacion del paquete
create or replace package body pck_productos is
    
    --Procedimiento que busca un producto por sus atributos
    procedure sp_buscar_producto(ivanombre in varchar2, ivadescripcion in varchar2, cur_resulado out pck_tipos.ty_cursor_retorno) is
              
    begin  
    open cur_resulado for
     select 
        prod.id_producto,
        prod.nombre, 
        prod.descripcion 
      from 
        tab_productos prod
      where 
        lower(prod.nombre) like ('%' || lower(nvl(ivanombre, '')) || '%') and
        lower(prod.descripcion) like ('%' || lower (nvl(ivadescripcion, '')) || '%');        
       
                                    
    end sp_buscar_producto;
    
    
    
    --Procedimiento que ingresa un producto a la base de datos
    procedure sp_ingresar_producto(ivanombre in varchar2, ivadescripcion in varchar2, ivaactivo in varchar2) is
                                       
    begin
              insert into tab_productos values(
              producto_seq.nextval,
              ivanombre,
              ivadescripcion,
              ivaactivo
              );
              commit;
        
    end sp_ingresar_producto;
    
    --Procedimiento que elimina un producto dada su id
    procedure sp_eliminar_producto(inmid_producto in number) is

    begin
      delete from tab_productos
             where id_producto = inmid_producto;
             commit;
    end sp_eliminar_producto;
    
    procedure sp_actualizar_producto(inmid_producto in number, ivanombre in varchar2, ivadescripcion in varchar2, ivaactivo in varchar2) is
                    
    begin
              update tab_productos 
              set
              nombre = ivanombre,
              descripcion = ivadescripcion,
              activo = ivaactivo               
              where
              id_producto = inmid_producto;
              commit;
    end sp_actualizar_producto;


end pck_productos;






--Paquete de tipos de retorno
create or replace package pck_tipos is
	type ty_cursor_retorno is ref cursor;
end pck_tipos;


