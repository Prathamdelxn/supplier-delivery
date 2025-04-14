import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';
import 'package:supplier_dashboard/screens/supplier/views/orders/order_details.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

     @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.loadUserData(); // Load stored credentials
      await authProvider.fetchSupplierData(); // Fetch supplier details
    });
  }

  final List OrdersData = [
    {
      "user_name": "Abhijeet Ghode",
      "order_id": "#3456",
      "profile_image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJHQ4cPkyAVoOW6k6sxCgneuowfXOQ5h7FKg&s=0",
      "order_date": "2 Nov 2021 04:24 PM",
      "address":"Near Zeal college of engineering , narhe gaon road , pune-411041",
      "items": [
        {"item_name": "Tomato", "qunatity_unit":"500gm","item_quantity": 2, "price": 50},
        {"item_name": "Carrot", "qunatity_unit":"500gm","item_quantity": 6, "price": 150},

      ],
        "total_amount": 190.00,
      "created_at": "20 Nov 2021 04:24 PM",
    },
    {
      "user_name": "Sammedh Patil",
      "profile_image":"https://pbs.twimg.com/profile_images/646981916747415554/24p4kWBY_400x400.jpg",
      "order_id": "#3416",
      "order_date": "2 Nov 2021 07:24 PM",
        "address":"Shree classic society , narhe gaon road , pune-411041",
      "items": [
        {"item_name": "Tomato", "qunatity_unit":"500gm","item_quantity": 2, "price": 50},
        {"item_name": "Almonds", "qunatity_unit":"500gm","item_quantity":3, "price": 120},
      

      ],
        "total_amount": 100.00,
           "created_at": "20 April 2021 04:24 PM",
    }
  ];
  String getFormattedDate() {
  DateTime now = DateTime.now();
  return DateFormat("dd MMM yyyy").format(now).toUpperCase();
}
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi ${authProvider.supplierData?['supplierName'] ?? 'N/A'}",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Text(
              getFormattedDate(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ],
        ),
        actions: [
          Icon(Icons.support_agent, size: 25, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.notifications, size: 25, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 228, 240, 239),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Sales Overview Cards
              SizedBox(height: 10),
              buildSalesGrid(),

              // New Orders Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "New Orders",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "See All Orders",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: OrdersData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      OrdersData[index]["profile_image"],
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return CircularProgressIndicator();
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.error,
                                            size: 45, color: Colors.grey);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(OrdersData[index]["user_name"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("${   OrdersData[index]["order_id"]}  |  ${OrdersData[index]["order_date"]}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                                  ],
                                )
                              ],
                            ),
                                SizedBox(height: 15),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.pin_drop_outlined),
                             
                                Container(
                                
                                  width: MediaQuery.of(context).size.width * 0.72,
                              
                                  child: Text(OrdersData[index]["address"],style: TextStyle(fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 63, 63, 63)),),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            // Order Items
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: OrdersData[index]["items"].length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text(OrdersData[index]["items"][index]["item_name"],
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                                            SizedBox(width: 15,),
                                            Text("(${OrdersData[index]["items"][index]["qunatity_unit"]})",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 43, 44, 44))),
                                        Spacer(),
                                        Text("${OrdersData[index]["items"][index]["item_quantity"]}x",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 43, 44, 44))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("₹ ${OrdersData[index]["items"][index]["price"]}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  );
                                }),
                            Divider(
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Total Amount :",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  OrdersData[index]["total_amount"].toString(),
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                      
                            SizedBox(height: 15),
                      
                            // Action Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 228, 240, 239),
                                    ),
                                    child: Center(
                                        child: Text("Out of stock",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black))),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blueAccent,
                                    ),
                                    child: Center(
                                        child: Text("Accept Order",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Reusable Card Widget
  Widget buildSalesCard(String imagePath, String amount, String title) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.45,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(9, 30, 66, 0.25),
              blurRadius: 8,
              spreadRadius: -2,
              offset: Offset(0, 4)),
          BoxShadow(
              color: Color.fromRGBO(9, 30, 66, 0.08),
              blurRadius: 0,
              spreadRadius: 1,
              offset: Offset(0, 0)),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(imagePath, height: 80),
                Row(
                  children: [
                    Text("+10%",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.green)),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_upward, color: Colors.green, size: 20),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          Row(children: [
            SizedBox(width: 20),
            Text("₹ $amount",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24))
          ]),
          Row(children: [
            SizedBox(width: 20),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.blueGrey))
          ]),
        ],
      ),
    );
  }

  /// 🔹 Grid Layout for Sales Cards
  Widget buildSalesGrid() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildSalesCard("assets/images/Group.png", "450.00", "Gross Sales"),
            buildSalesCard("assets/images/Group2.png", "320.00", "Net Sales"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildSalesCard(
                "assets/images/Group3.png", "780.00", "Total Orders"),
            buildSalesCard("assets/images/Group4.png", "120.00", "Refunds"),
          ],
        ),
      ],
    );
  }
}
