import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String catName;
  const CategoryProductsScreen({required this.catName,Key? key}) : super(key: key);
  final Color greyColor = const Color(0xffA71E27);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: greyColor,
        actions: [
          Icon(Icons.search_rounded,size: 30,),
          SizedBox(width: 16,),
          Icon(Icons.shopping_cart,size: 30,),
          SizedBox(width: 16,),
        ],
        title: Text(catName),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft:  Radius.circular(15),
        ),
        child: BottomNavigationBar(
          selectedItemColor: greyColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,
                  size: 35,),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined,size: 35,color: Colors.grey,),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined,size: 35,color: Colors.grey,),
                label: ""
            ),
          ],
        ),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
        future: FirebaseFirestore.instance.collection("products")
            .where("category",isEqualTo:catName ).get(),
        builder: (context,connection){
          switch(connection.connectionState){
            case ConnectionState.none:
              return const Center(child: Text("none!"),);
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Center(child: Text("active!"),);
            case ConnectionState.done:
              if(connection.hasData){
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                    scrollDirection: Axis.vertical,
                    itemCount: connection.data?.docs.length,
                    itemBuilder: (context,index){
                      //"${connection.data?.docs[index]['image']}"
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration:BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ) ,
                                  child: Image.network("${connection.data?.docs[index]['productImage']}",fit: BoxFit.fill,),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${connection.data?.docs[index]['productName']}",
                                  textAlign:TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ) ,
                        ),
                      );
                    },
                  ),
                );
              }else{
                return const Center(child: Text("Error!"),);
              }
          }
        },
      ),
    );
  }
}