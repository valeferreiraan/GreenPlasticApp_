import 'package:firebase_database/firebase_database.dart';

/*
DEBEMOS TENER:
  1. Base de datos de los productos
    OPERACIONES CRUD:
    -READ: para la sección de Catálogo
  2. Base de datos de los vendedores (podemos comenzar con usuarios de prueba)
    OPERACIONES CRUD:
    -READ: en el caso del lider, para la vista de vendedores a cargo

SE VA A CREAR MIENTRAS DE USA LA APP:
  1. Cotización: para agregar cotizaciones
    OPERACIONES CRUD:
      -CREATE: generar cotizaciones nuevas
      -READ: para la vista de "Historial"
      -UPDATE: para actualizar info de la cotización (corregir errores, poder reflejar cambios de opinión del cliente)
      -DELETE: para eliminar cotizaciones (ctrl+z)
  2. Cliente: se crea en el formulario de Contacto (DEL CRUD: CREATE, de pronto UPDATE)
    OPERACIONES CRUD:
      -CREATE: agregar nuevos contactos
      -READ: para la vista de "Historial"
      -UPDATE: para actualizar datos de los contactos (cambio de número/email, cambio de representante de la empresa, etc)
      -DELETE: para eliminar contactos que ya no se estén usando (podríamos no implementarlo)

RESUMEN: FUNCIONES QUE DEBEN EXISTIR

getProducts(): obtener la lista de productos disponibles
getProduct(id): obtener un producto a partir de su identificador

getSellers(): obtener la lista de vendedores
getSeller(id): obtener un vendedor a partir de su identificador

newCoti(): crear nueva cotización
getCotis(): obtener la lista de cotizaciones
getCoti(id): obtener una cotización a partir de su identificador
editCoti(id): modificar cotización
delCoti(id): eliminar cotización

newClient(): agregar un nuevo cliente
getClients(): obtener la lista de clientes
getClient(id): obtener un cliente a partir de su identificador
editClient(id): modificar cliente
delClient(id): eliminar un cliente 

*/

class Cotizacion{
  String? key;
  late Vendedor vendedor;
  late Cliente cliente;
  late Map<Producto,int> productos;
  double precioTotal=0;

  Cotizacion(this.key, this.vendedor, this.cliente, this.productos);
  
  Cotizacion.calcPrecioTotal(){
    for(Producto prod in productos.keys){
      precioTotal+=prod.precio*productos[prod]!;
    }
  }
  
}

class Producto{
  String? key;
  late String nombre;
  late double precio;

  Producto(this.key, this.nombre, this.precio);
}

class Vendedor{
  String? key;
  late String rol;
  late String nombre;
  late String apellido;
  late String email;
  late String passw;

  Vendedor(this.key, this.rol, this.nombre, this.apellido, this.email, this.passw);
}

class Cliente{
  String? key;
  late String nombre;
  late String apellido;
  late int telefono;
  late BigInt nitEmpresa;
  late String empresa;
  late String ciudad;
  late Vendedor vendedor;

  Cliente(this.key, this.nombre, this.apellido, this.telefono, this.nitEmpresa, this.empresa, this.ciudad, this.vendedor);

}