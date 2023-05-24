import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/database_controller.dart';
import '../../database/database.dart';

class ProductCatalog extends StatefulWidget {
  @override
  _ProductCatalogState createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  final dbRef = FirebaseDatabase.instance.ref().child("Productos");
  
  final TextEditingController _edtNameController = TextEditingController();
  final TextEditingController _edtPriceController = TextEditingController();
  final TextEditingController _edtSubjectController = TextEditingController();

  DatabaseController databaseController = Get.find();


  @override
  void initState() {
    super.initState();
    if(databaseController.productos.isEmpty){databaseController.getProds();}
  }

 bool updateProduct = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: SingleChildScrollView(
        child: Obx(()=>Column(
          children: [
            for(int i = 0 ; i < databaseController.productos.length ; i++)
              studentWidget(databaseController.productos[i])
          ],
        )),
      ),
    );
  }
  
  void studentDialog({String? key}) {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _edtNameController, decoration: const InputDecoration(helperText: "Nombre"),),
              TextField(controller: _edtPriceController, decoration: const InputDecoration(helperText: "Precio")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                

              }, child: Text(updateProduct ? "Update Data" : "Save Data"))
            ],
          ),
        ),
      );
    });
  }


  Widget studentWidget(Producto producto) {
    return InkWell(
      onTap: (){
        _edtNameController.text = producto.prodData!.nombre!;
        _edtPriceController.text = producto.prodData!.precio!.toString();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top:5,left: 10,right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(producto.prodData!.nombre!),
                Text(producto.prodData!.precio!.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

