/*
### Problema:
Buscamos que nuestro equipo de programadores genere un sistema de organizacion de pedidos de una Ortopedia o varias ortopedias,
y tenemos como problema a resolver poder crear una base de datos eficiente que pueda manejar todas las operaciones 
relacionadas con los pedidos de manera óptima para tener todo mas organizado y que los clientes esten satisfechos.
### Descripción del Problema:
1. **Clientes y Empleados**: 
Debemos crear una base de datos que nos permita observar toda la informacion de la persona que nos este comprando,
para poder finalizar la compra de los elementos o mismo por devoluciones que deberemos comprobar si aun sigue en garantia su elemento comprado,
tener una base de datos nos permitira resolver dudas del momento y ser de ayuda memoria,
así como de los empleados que podemos observar quien hizo la venta y en que dia, año fue y mas detalles de su atención al cliente.
2. **Ventas, Compras , Proveedores y Dueño**: 
Necesitamos saber que elemento se vendio en que año,mes y dia tener la informacion detallada de cada elemeto por si hay una posterior devolucion 
o mismo para un control de stock que nos permita saber cuantos elementos, nos quedan ya que si faltaran el empleado debera pedirlos a un proveedor
ver sus precios,luego consultarlo con el dueño si le parece razonable realizar la compra del mismo para que despues pueda ser entregado al cliente. 
3. **Stock**: 
Nos permitira saber la cantidad de elementos disponibles, el lugar de almacenamiento asi como la fecha, hora de ingreso 
de los distintos elementos para poder tener la capacidad de poder brindar un buen servicio sin demoras y cumpliendo con el cliente.
4. **´Pedidos**: 
Debemos saber que pedidos se realizaron en que momento y saber cuales estan con demora y cuales son los que deben ser entregados de manera inmediata
y cuales estan en un proceso de compra que aun no han pagado dicho pedido por lo que no se puede entregar hasta dicho pago.
### Objetivo:
El obejetivo es tener una base de datos que nos permita tener todo tipo de informacion sea del cliente o del comprador y demas para que al momento
de la consulta uno tenga una ayuda memoria y pueda guiarse del mismo para poder tener un servicio de exelencia que nos permita cumplir con todos 
los pedidos solicitado sin tener demoras.
Las Ortopedias manejan un amplio nivel de relacion con los clientes por lo que tiene que tener una gran base de datos de cada uno de ellos
para poder brindar el mejor servicio y asistencia.Generando un base de datos facil de utilizar para cada una de ella que lo tengan.
*/

/*
## Descripción de la Base de Datos - Base de Pedidos en La Ortopedia
### ENTIDADES | ACTORES QUE INTERVIENEN EN ESTA BASE DE DATOS:
1. **CLIENTE**:
- Almacena toda la información sobre los clientes que realizan pedidos o compras.
- Atributos: 
   IDCLIENTE   INT NOT NULL PK AI
,   NOMBRE      VARCHAR(100)    DEFAULT 'PARTICULAR'
,   TELEFONO    VARCHAR(20)     DEFAULT '000-000-000'
,   CORREO      VARCHAR(50)		UNIQUE NOT NULL
,   CUIT        VARCHAR(11)     UNIQUE NOT NULL
,   IDORTOPEDIA INT
2. **EMPLEADO**:
- Contiene información sobre los empleados involucrados en el proceso de pedidos de una Ortopedia.
- Atributos: 
	IDEMPLEADO 	INT NOT NULL PK AI
, 	NOMBRE		VARCHAR(100)    DEFAULT 'EMPLEADOBM'
, 	TELEFONO    VARCHAR(20)     DEFAULT '000-000-000'
, 	CORREO      VARCHAR(50)		UNIQUE NOT NULL
, 	IDORTOPEDIA INT
,  IDSTOCK     INT
,  IDCLIENTE   INT
,  IDDUEÑO     INT
);
        
3. **DUEÑO**:
- Guarda datos sobre los dueños de las Ortopedias.
-Atributos:
   IDORTOPEDIA INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE		VARCHAR(100)
,  DIRECCION	VARCHAR(100)
,  TELEFONO		VARCHAR(100)
);
   
4. **Compras**:
- Define diferentes tipos de compras sea para clientes segun el pedido o para otras ortopedias para tener stock.
- Atributos:
	IDCOMPRAS    INT PRIMARY KEY AUTO_INCREMENT
,  NOMBRE       VARCHAR(100) DEFAULT 'USUARIO'
,  TELEFONO     VARCHAR(10) 
,  CORREO       VARCHAR(100)  UNIQUE NOT NULL
,  CUIT         VARCHAR(11)  
,  IDORTOPEDIA  INT
,  IDPROVEEDORES INT
);

5. **ORTOPEDIA**:
- Almacena información sobre las distintas Ortopedias disponibles se la propia o no.
- Atributos: 
   IDORTOPEDIA  INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE		 VARCHAR(100)
,  DIRECCION	 VARCHAR(100)
,  TELEFONO		 VARCHAR(100)
,  IDSTOCK      INT
);

6. **STOCK**:
- Contiene información sobre el stock disponibles en cada Ortopedia.
- Atributos:
   IDSTOCK 		 INT PRIMARY KEY AUTO_INCREMENT
,	IDORTOPEDIA	 INT
,	CANTIDAD		 INT
,	DISPONIBILIDAD	BOOLEAN
,  IDORTOPEDIA   INT
);
   
7. **Pedidos**:
- Registra las reservas realizadas por los clientes.
- Atributos: 	
	IDPEDIDOS 		INT PRIMARY KEY AUTO_INCREMENT
,   IDCLIENTE 		INT
,   IDVENTAS      INT
,   IDSTOCK 	   INT
,   IDEMPLEADO 	INT
,   IDPROVEEDORES INT
,   IDCOMPRAS     INT
,   FECHA 			DATETIME
,   CANCELACION 	DATETIME DEFAULT NULL
);

8. **Proveedores**:
-Nos abastecen cuando ya no tenemos stock suficiente para completar un pedido y nos entregan los elemtos para comoletarlo.
-Atributo:
	IDPROVEEDORES   INT PRIMARY KEY AUTO_INCREMENT
,   NOMBRE         VARCHAR(100) DEFAULT 'PROVEEDOR'
,   TELEFONO       VARCHAR(10) NOT NULL
,   CORREO         VARCHAR(100) UNIQUE NOT NULL
,   CUIT           VARCHAR(11)
,   IDORTOPEDIA    INT
);

9) **Empleado**
-Se encarga de preparar los pedidos, generar una buena atencion al cliente y consultar con el dueño por distintos compras que necesite
realizar para preparar un pedido y poder entrarlo a su cliente.
-Atributo:
	IDEMPLEADO		 INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE			 VARCHAR(100)
,	CORREO			 VARCHAR(100) DEFAULT	'Administracion@ortopediabm.com'
,	TELEFONO		    VARCHAR(100)
,	CUIT			    VARCHAR(11)
,	IDORTOPEDIA	    INT
,   IDDUEÑO        INT
,   IDCLIENTE      INT
,   IDSTOCK        INT
);
