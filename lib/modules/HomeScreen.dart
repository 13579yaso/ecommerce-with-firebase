import 'package:first_app/modules/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LoginScreen.dart';
import 'category_product.dart';
class HomeScreen extends StatelessWidget {

  Color greyColor =const Color(0xffA71E27);
  final List<String> entries = <String>[
    'Milk', 'Vegatables', 'Meat','Sea Food','Eggs','Fish','Juice'];
  final List<Color> colorCodes = <Color>[
    Color(0xffE71E97),
    Color(0xffA45E27),
    Color(0xffa81d28),
    Color(0xff0a2b46),
    Color(0xff80613e),
    Color(0xff16941a),
    Color(0xff481f10),
  ];
  getProducts()async{
    QuerySnapshot<Map<String,dynamic>> products = await FirebaseFirestore.instance.collection("products").get();
    products.docs.forEach((element) { });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        //twitter logo
        title: Text("24 Express",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: false,
        elevation: 10,
        backgroundColor: greyColor,
        actions: [
          Icon(Icons.search_rounded,size: 30,),
          SizedBox(width: 16,),
          Icon(Icons.shopping_cart,size: 30,),
          SizedBox(width: 16,),
        ],
        leading:
          InkWell(
          onTap: (){
    FirebaseAuth.instance.signOut().then((value) {
    print("logged out");
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder:(co)=>LoginScreen()),
    (route)=>false,
    );
    });
    },
      child: Icon(Icons.segment,color: Colors.white,size: 30,),
    ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.category_outlined,
                  size: 35,
                  color: Colors.white,),
                SizedBox(
                  width: 5,),
                Text(
                  'Categories',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (builder)=>CategoryScreen(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                            right:Radius.circular(10)
                        )
                    ),
                     child: Row(
                       children: [
                         Text(
                         'see all',style: TextStyle(
                         color: Colors.white
                   ),
                   ),
                         Icon(
                           Icons.arrow_forward_ios_outlined,
                           color: Colors.white,
                           size: 15,
                         ),
                       ],
                     ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 10,
            ),
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
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: connection.data?.docs.length,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (builder)=>CategoryProductsScreen(
                                              catName: "${connection.data?.docs[index]['name']}",
                                            ),
                                          ));
                                    },
                                    child: Column(
                                      children: [
                                      CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 42,
                                      foregroundImage: NetworkImage(
                                          "${connection.data?.docs[index]['image']}",
                                      ),
                                        ),
                                const SizedBox(height: 16,),
                                Text(
                                "${connection.data?.docs[index]['name']}",
                                style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                ),

                                ),
                                      ]
                                ),
                                  ),

                                );
                              },
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
            SizedBox(
              height: 10,
            ),
            Row(
          children: [
            Icon(Icons.ac_unit_outlined,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Offer',style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
            )
          ],
        ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 130,
              child: Stack(
                children: [
               ListView.builder(
                    itemCount: colorCodes.length,
                    scrollDirection: Axis.horizontal,
                    //  shrinkWrap: true,
                    itemBuilder: (context , int index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                         // padding: EdgeInsets.all(10),
                          child:Image.network(
                              'https://media-cdn.tripadvisor.com/media/photo-s/17/10/0d/0f/hot-and-spicy.jpg'
                          )

                        ),
                      );
                    }
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120,top: 30),
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 60,
                      child:  Text(
                        "50%\nOFF",
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.ac_unit_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Popular',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 70,
              child: ListView.builder(
                  itemCount: colorCodes.length,
                  scrollDirection: Axis.horizontal,
                  //  shrinkWrap: true,
                  itemBuilder: (context , int index){

                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // padding: EdgeInsets.all(10),
                          child:Image.network(
                              'https://img-new.cgtrader.com/items/717115/a69ed5d165/large/milk-carton-3d-model-obj-mtl-fbx-blend.png'
                          )

                      ),
                    );
                  }
              ),
            ),
          ],
        ),
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

    );
  }
}

