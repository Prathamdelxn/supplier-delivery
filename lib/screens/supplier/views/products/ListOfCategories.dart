import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/edit_product.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/products_details.dart';

class Listofcategories extends StatefulWidget {
  final String name;
  final String image;
  final List<String> subcategories;
  final List<Map<String, dynamic>> sortedProducts;

  const Listofcategories({
    super.key,
    required this.name,
    required this.image,
    required this.subcategories,
    required this.sortedProducts
  });

  @override
  State<Listofcategories> createState() => _ListofcategoriesState();
}

class _ListofcategoriesState extends State<Listofcategories> {
  final List<Map> products=[
    {
      "image":"https://hips.hearstapps.com/hmg-prod/images/766/grapes-main-1506688521.jpg?resize=640:*",
      "name":"Organic Grapes",
      "price":"₹ 450.00",
      "status":"In Stock",
      "subcategory":"Fruits"

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
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          widget.name, 
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 236, 235, 234),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            // Subcategories List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
  
                  Container(
                    margin: EdgeInsets.only(right: 10), // Add space between items
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Dynamically Generated Subcategories
                  ...widget.subcategories.map((subcategory) {
                    return Container(
                      margin: EdgeInsets.only(right: 10), // Add space between items
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      child: Center(
                        child: Text(
                          subcategory,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.sortedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsDetails(productData: widget.sortedProducts[index])));
                          // print(widget.sortedProducts);
                        },
                        child: Container(
                        
                          height: 130,
                          padding: EdgeInsets.all(15),
                          margin:
                              EdgeInsets.symmetric( vertical: 10),
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
                                    child: Image.network(widget.sortedProducts[index]["image_url"][0],fit: BoxFit.cover,)),
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
                                  Text(widget.sortedProducts[index]["name"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                  Text(widget.sortedProducts[index]["discounted_price"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.blue),),
                                  Container(height: 25,
                                  width: double.infinity,
                                             
                                  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector( onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProduct(productdataedit: widget.sortedProducts[index],)));
                                                  },child: Text("Edit",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
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
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
