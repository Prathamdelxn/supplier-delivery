import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/add_category.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/add_product.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/edit_product.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/my_categories.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/my_products_page.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/products_details.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 


 final List<Map<String, dynamic>> products = [
    // Vegetables
    {
      "name": "Tomato",
      "category": "Vegetables",
      "subcategory": "Fresh",
      "discounted_price": "80",
      "price_per_quantity": "100",
      "offer_percentage": "20%",
      "active": false,
      "image_url": [
        "https://cdn.britannica.com/16/187216-131-FB186228/tomatoes-tomato-plant-Fruit-vegetable.jpg",
        "https://tagawagardens.com/wp-content/uploads/2023/08/TOMATOES-RED-RIPE-VINE-SS-1-1024x681.jpg"
      ],
      "quantity": "500",
      "quantity_unit":"gm",
      "stock_quantity": "20",
      "description": "Fresh tomatoes rich in vitamins and antioxidants.",
      "createdAt": "22 Nov 2021 04:24 PM",
    },
    {
      "name": "Broccoli",
      "category": "Vegetables",
      "subcategory": "Leafy Green",
      "discounted_price": "120",
      "price_per_quantity": "150",
      "offer_percentage": "20%",
      "active": true,
      "image_url": [
        "https://www.allrecipes.com/thmb/wuGZbV12TACKERKpMZ1StYM-wDQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-240438-easy-roasted-broccoli--ddmfs-beauty-4x3-d1c1fa3a3e364e93a82e4dee791d4979.jpg",
        "https://images.squarespace-cdn.com/content/v1/5b5aa0922487fd1ce32c117a/1547765015801-FSR1DVSKCZU3PAYWIRQG/broccoli.jpg"
      ],
      "quantity": "500",
      "quantity_unit":"gm",
      "stock_quantity": "15",
      "description": "Nutritious broccoli rich in fiber and antioxidants.",
      "createdAt": "29 Nov 2023 11:45 AM",
    },

    // Fruits
    {
      "name": "Banana",
      "category": "Fruits",
      "subcategory": "Fresh",
      "discounted_price": "50",
      "price_per_quantity": "60",
      "offer_percentage": "15%",
      "active": true,
      "image_url": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAiE9BZy3SyV4Xb83a3V-e8Ywq6z1bVZlGsA&s",
        "https://cdn.britannica.com/58/194358-050-91CE9CB6/Gros-Michel-banana-tree.jpg?w=400&h=225&c=crop"
      ],
      "quantity": "1",
      "quantity_unit":"kg",
      "stock_quantity": "30",
      "description": "Bananas are a great source of potassium and energy.",
      "createdAt": "25 Nov 2023 10:00 AM",
    },
    {
      "name": "Apple",
      "category": "Fruits",
      "subcategory": "Fresh",
      "discounted_price": "180",
      "price_per_quantity": "200",
      "offer_percentage": "10%",
      "active": true,
      "image_url": [
        "https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ868djAR5mIlAFnnjF---4paarCg48aQTr-g&s"
      ],
      "quantity": "1",
      "quantity_unit":"kg",
      "stock_quantity": "25",
      "description": "Crisp and sweet apples full of nutrients.",
      "createdAt": "26 Nov 2023 12:00 PM",
    },

    // // Dry Fruits
    {
      "name": "Almonds",
      "category": "Dry Fruits",
      "subcategory": "Nuts",
      "discounted_price": "400",
      "price_per_quantity": "450",
      "offer_percentage": "10%",
      "active": true,
      "image_url": [
        "https://cdn.britannica.com/04/194904-050-1B92812A/Raw-Food-Almond-food-Nut-Snack.jpg",
        "https://images.immediate.co.uk/production/volatile/sites/30/2021/02/almonds-9e25ce7.jpg?quality=90&resize=556,505"
      ],
      "quantity": "500",
      "quantity_unit":"gm",
      "stock_quantity": "50",
      "description": "Almonds are rich in protein and healthy fats.",
      "createdAt": "23 Nov 2023 05:44 PM",
    },
     {
      "name": "Cashews",
      "category": "Dry Fruits",
      "subcategory": "Nuts",
      "discounted_price": "850",
      "price_per_quantity": "1000",
      "offer_percentage": "15%",
      "active": true,
      "image_url": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzs9S6osbUVTMwYkvczd1PfBYV0njoqCMwzA&s",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTidbTREzGojiCK7tPp16WEXlWkkQqvJGQfAA&s"
      ],
      "quantity": "1",
      "quantity_unit":"kg",
      "stock_quantity": "40kg",
      "description": "Cashews are creamy, delicious, and nutrient-rich.",
      "createdAt": "27 Nov 2023 01:20 PM",
    },

    // Grains
    {
      "name": "Basmati Rice",
      "category": "Grains",
      "subcategory": "Staple",
      "discounted_price": "90",
      "price_per_quantity": "120",
      "offer_percentage": "25%",
      "active": true,
      "image_url": [
        "https://5.imimg.com/data5/SELLER/Default/2022/3/LJ/ZL/GQ/49710505/soft-basmati-rice.png",
        "https://upload.wikimedia.org/wikipedia/commons/0/07/Khyma_and_Basmati_rice.jpg"
      ],
      "quantity": "1",
      "quantity_unit":"kg",
      "stock_quantity": "100kg",
      "description": "Long-grain Basmati rice with a rich aroma.",
      "createdAt": "28 Nov 2023 02:30 PM",
    },
    {
      "name": "Wheat Flour",
      "category": "Grains",
      "subcategory": "Staple",
      "discounted_price": "40",
      "price_per_quantity": "50",
      "offer_percentage": "20%",
      "active": true,
      "image_url": [
        "https://5.imimg.com/data5/ST/QW/MY-38700875/fresh-wheat-crop.jpg",
        "https://4.imimg.com/data4/MC/IA/MY-5308089/wheat-grains.jpg"
      ],
      "quantity": "200",
      "quantity_unit":"gm",
      "stock_quantity": "200kg",
      "description": "Whole wheat flour rich in fiber and nutrients.",
      "createdAt": "30 Nov 2023 09:00 AM",
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
        actions: const [
          Icon(Icons.support_agent, size: 25, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.notifications, size: 25, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 228, 240, 239),

        // color: Color.fromARGB(255, 225, 226, 226),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyProductsPage())); 
                    },
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(149, 157, 165, 0.2),
                              blurRadius: 24,
                              spreadRadius: 0,
                              offset: Offset(
                                0,
                                8,
                              ),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/productpage1.png"),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              width: 100,
                              child: Text(
                                "Add New Product",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 70, 121, 147),
                                  fontWeight: FontWeight.w600,
                                  height: 0.9,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyCategories(newproducts: products,)));
                    },
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(149, 157, 165, 0.2),
                              blurRadius: 24,
                              spreadRadius: 0,
                              offset: Offset(
                                0,
                                8,
                              ),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/productpage2.png"),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              width: 100,
                              child: Text(
                                "Add New Category",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 70, 121, 147),
                                  fontWeight: FontWeight.w600,
                                  height: 0.9,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(149, 157, 165, 0.2),
                        blurRadius: 24,
                        spreadRadius: 0,
                        offset: Offset(
                          0,
                          8,
                        ),
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/exceldownload.png"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Download Report Sheet",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 70, 121, 147),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text("Products List",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: const Color.fromARGB(255, 55, 72, 80))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                                 onTap: (){
                                  // print(products[index]);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsDetails(productData: products[index],)));
                        },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(149, 157, 165, 0.2),
                                        blurRadius: 24,
                                        spreadRadius: 0,
                                        offset: Offset(
                                          0,
                                          8,
                                        ),
                                      ),
                                    ]),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 205,
                                          child: Row(
                                            children: [
                                              Text(
                                                products[index]["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                    color: const Color.fromARGB(
                                                        255, 55, 72, 80)),
                                              ),
                                              Spacer(),
                                              Text(
                                                         "${products[index]["quantity"]}${products[index]["quantity_unit"]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 205,
                                          child: Text(
                                            products[index]["category"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                color: const Color.fromARGB(
                                                    255, 176, 177, 177)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Offer Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 142, 144, 146)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "₹ ${products[index]["discounted_price"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: const Color.fromARGB(
                                                      255, 55, 72, 80)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Actual Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 146, 147, 147)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                            "₹ ${products[index]["price_per_quantity"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: const Color.fromARGB(
                                                      255, 55, 72, 80)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 130, 131, 131)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              " ${products[index]["stock_quantity"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: const Color.fromARGB(
                                                      255, 55, 72, 80)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Created at :",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color.fromARGB(
                                                        255, 130, 131, 131)),
                                              ),
                                              Text(
                                                products[index]["createdAt"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: const Color.fromARGB(
                                                        255, 55, 72, 80)),
                                              )
                                            ],
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProduct(productdataedit: products[index],)));
                                                  },
                                                  child: Image.asset(
                                                      "assets/images/edit.png"),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                    "assets/images/delete.png"),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Positioned(
                          top: 0,
                          left: 30,
                          child: Container(
                            height: 120,
                            width: 130,
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              products[index]["image_url"][0],
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(24, 24, 24, 0.2),
                                    blurRadius: 29,
                                    spreadRadius: 0,
                                    offset: Offset(
                                      0,
                                      7,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
