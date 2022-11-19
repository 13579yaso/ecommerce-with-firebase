import 'package:flutter/material.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
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
        title: Text(
          'Milk',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
        leading: Icon(Icons.arrow_back_outlined,
            size: 30,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
           Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(18)
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsKVumfFv-JRuiZz6PKOIdH_WKgoseeKzmmg&usqp=CAU",
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            horizontal: 10
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Almarai milk",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                             Spacer(),
                              Icon(
                                Icons.favorite_border_outlined,
                                size: 30,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 30,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(18)
                                ),
                                child: Text(
                                  "36.59 SAR",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: greyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: greyColor,
                          size: 25,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "100",
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            width: 20
                        ),
                        Icon(
                          Icons.favorite,
                          color:greyColor,
                          size: 25,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "100",
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Like This",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 155,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      Container(
                         width:150,
                        margin: EdgeInsets.only(
                            bottom: 5,
                            right: 15
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsKVumfFv-JRuiZz6PKOIdH_WKgoseeKzmmg&usqp=CAU",
                              width: 150,
                              height: 100,
                            ),
                          //  SizedBox(height: 35,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Almarai Milk",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "36.59 SAR",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        'add to cart',style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyColor
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: greyColor
                      )
                    ),
                    child: Icon(
                      Icons.minimize
                      ,color: greyColor,
                      size: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '01',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: greyColor
                          )
                      ),
                      child: Icon(
                        Icons.add
                        ,color: greyColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,

            )
          ],
        ),
  ],
      ),

    );
  }
}
