import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Tomato",
      "category": "Vegetables",
      "unitPrice": "₹ 150",
      "purchasePrice": "₹ 1000",
      "quantity": "500gm",
      "totalQuantity": "20kg",
      "createdAt": "22 Nov 2021 04:24 PM",
      "image":
          "https://cdn.britannica.com/16/187216-131-FB186228/tomatoes-tomato-plant-Fruit-vegetable.jpg"
    },
    {
      "name": "Almonds",
      "category": "Dry Fruits",
      "unitPrice": "₹ 450",
      "purchasePrice": "₹ 100",
      "quantity": "500gm",
      "totalQuantity": "70kg",
      "createdAt": "23 Nov 2023 05:44 PM",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj8MKP068QSzL18OyYRp-4Wrvy_ZVAgD5xSzawmtmq6YHqKik_f2_mdy4TDeJ3oYo5hR6g5dAEqPWkGbBEo0mSXw"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        color: Color.fromARGB(255, 225, 226, 226),
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
                  Container(
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
                  Container(
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
                              "Bulk Upload Product",
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
                                              products[index]["quantity"],
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
                                            "Unit Price",
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
                                            products[index]["unitPrice"],
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
                                            "Purchase Price",
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
                                            products[index]["purchasePrice"],
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
                                            " ${products[index]["totalQuantity"]}",
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
                                              Image.asset(
                                                  "assets/images/edit.png"),
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
                            )),
                        Positioned(
                          top: 0,
                          left: 30,
                          child: Container(
                            height: 120,
                            width: 130,
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              "https://cdn.britannica.com/16/187216-131-FB186228/tomatoes-tomato-plant-Fruit-vegetable.jpg",
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
