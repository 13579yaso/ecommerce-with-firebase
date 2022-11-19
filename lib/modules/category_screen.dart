import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  final Color greyColor = const Color(0xffA71E27);
  getProducts()async{
    QuerySnapshot<Map<String,dynamic>> products = await FirebaseFirestore.instance.collection("products").get();
    products.docs.forEach((element) { });
  }
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
        title: Text(
          'Categories',style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft:  Radius.circular(15),
        ),
        child: BottomNavigationBar(
          selectedItemColor: greyColor,
          currentIndex:1,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,
                  size: 35,),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined,size: 35,color:greyColor,),
                label: "Catogries"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined,size: 35,color: Colors.grey,),
                label: ""
            ),
          ],
        ),
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
              Column(
          children: [
            FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
              future: FirebaseFirestore.instance.collection("category").get(),
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
                      return Column(
                        children: [
                          SizedBox(
                            height:MediaQuery.of(context).size.height,
                         //   width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              itemCount: connection.data?.docs.length,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                          children: [
                                            Image.network(
                                                "${connection.data?.docs[index]['image']}",
                                              ),

                                            Container(
                                              color: Colors.white,
                                              width:MediaQuery.of(context).size.width ,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                "${connection.data?.docs[index]['name']}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),

                                              ),
                                            ),
                                          ]
                                      ),

                                  ),

                                );
                              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,

                            ),
                            ),
                          )
                        ],
                      );
                    }else{
                      return const Center(child: Text("Error!"),);
                    }
                }
              },
            ),


          ],
        ),
        ],
      ),
    );
  }
}
