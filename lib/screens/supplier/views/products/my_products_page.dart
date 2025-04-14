import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/add_product.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/edit_product.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/products_details.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  bool activeproduct = true;

  final List<Map> products=[
    {
      "image":"https://hips.hearstapps.com/hmg-prod/images/766/grapes-main-1506688521.jpg?resize=640:*",
      "name":"Organic Grapes",
      "price":"₹ 450.00",
      "status":"In Stock"

    },
    {
      "image":"https://media.post.rvohealth.io/wp-content/uploads/2020/09/papaya-benefits-732x549-thumbnail-732x549.jpg",
      "name":"Organic Papaya",
      "price":"₹ 100.00",
      "status":"Low Stock"
      
    },
    {
      "image":"https://cdn-prod.medicalnewstoday.com/content/images/articles/272/272782/oranges-in-a-box.jpg",
      "name":"Organic Oranges",
      "price":"₹ 200.00",
      "status":"Out of Stock"
    }
    

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            "My Products",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [Icon(Icons.more_vert)],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 236, 235, 234),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 140,
                      width: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/total.png",
                            ),
                            Text(
                              "22",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.blue),
                            ),
                            Container(
                                width: 70,
                                child: Text(
                                  "Total Products",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 140,
                      width: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/available.png",
                            ),
                            Text(
                              "18",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.green),
                            ),
                            Container(
                                width: 70,
                                child: Text(
                                  "Available Products",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 140,
                      width: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/outofstock.png",
                            ),
                            Text(
                              "06",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.grey),
                            ),
                            Container(
                                width: 70,
                                child: Text(
                                  "Out of Stock",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
                  },
                  child: Container(
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueAccent),
                    child: Center(
                      child: Text(
                        "+ Add New Product",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeproduct = true;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Active Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: activeproduct
                                      ? const Color.fromARGB(255, 53, 107, 199)
                                      : Colors.black87),
                            ),
                            activeproduct
                                ? Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: 150,
                                    color:
                                        const Color.fromARGB(255, 99, 113, 240),
                                    height: 2,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeproduct = false;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Draft Products",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: !activeproduct
                                        ? const Color.fromARGB(
                                            255, 53, 107, 199)
                                        : Colors.black87)),
                            !activeproduct
                                ? Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: 150,
                                    color:
                                        const Color.fromARGB(255, 99, 113, 240),
                                    height: 2,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 130,
                        padding: EdgeInsets.all(15),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                       ),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75,
                          
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,width: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(products[index]["image"],fit: BoxFit.cover,)),
                              ],
                            ),
                          ),
                            Container(
                              // color: Colors.grey,
                            width: MediaQuery.of(context).size.width*0.43,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[index]["name"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                Text(products[index]["price"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.blue),),
                                Container(height: 25,
                                width: double.infinity,
                                           
                                
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      // onTap:(){
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProduct(productdataedit: ,)));
                                      // },
                                      child: Text("Edit",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
                                    // Text("Hide",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,),),
                                     Text("Delete",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,),)
                                  ],
                                ),
                                ),
                              ],
                            ),
                          )
                          ,
                            Container(
                                        
                            //  color: Colors.grey,
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                 padding: EdgeInsets.symmetric(horizontal:10),
                               decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:products[index]["status"] == "Out of Stock"? const Color.fromARGB(255, 239, 155, 149).withOpacity(0.6): products[index]["status"]=="Low Stock"?const Color.fromARGB(255, 244, 221, 150).withOpacity(0.6) : Colors.green.withOpacity(0.6),
                               ),
                                  child: Center(
                                    child: Text(products[index]["status"],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12, color: products[index]["status"] == "Out of Stock"
                                ? Colors.red: products[index]["status"] == "Low Stock"? const Color.fromARGB(255, 190, 144, 7)
                                : const Color.fromARGB(255, 11, 98, 14),),),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                       ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
