import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Pratham",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Text(
              "12 JAN 2025",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
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
        child: Column(
          children: [
            // Sales Overview Cards
            SizedBox(height: 10),
            buildSalesGrid(),

            // New Orders Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "New Orders",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "See All Orders",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("#20211028-07104354",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          Text("2 Nov 2021 04:24 PM",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey),)
                        ],
                      ),
                      Spacer(),
                      Text("₹ 450.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      SizedBox(width: 6,),
                      Text("Paid", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.green)),
                    ],
                  ),
                 Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                   children: [
                     Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Customer Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,color: Colors.blueGrey),),
                          Text("Ankit Ghode",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: const Color.fromARGB(255, 55, 72, 80)),)
                        ],
                      ),
                     ),
                   ],
                 ),
                  Row(
                   children: [
                     Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dilivery Status",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,color: Colors.blueGrey),),
                          Text("Placed",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: const Color.fromARGB(255, 55, 72, 80)),)
                        ],
                      ),
                     ),
                   ],
                 )
                      ],
                    ),
                    Spacer(),
                    Image.asset("assets/images/Invoice.png",height: 100,)
                  ],
                 )
                ],
              ),
            ),
          ],
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
          BoxShadow(color: Color.fromRGBO(9, 30, 66, 0.25), blurRadius: 8, spreadRadius: -2, offset: Offset(0, 4)),
          BoxShadow(color: Color.fromRGBO(9, 30, 66, 0.08), blurRadius: 0, spreadRadius: 1, offset: Offset(0, 0)),
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
                    Text("+10%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green)),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_upward, color: Colors.green, size: 20),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          Row(children: [SizedBox(width: 20), Text("₹ $amount", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24))]),
          Row(children: [SizedBox(width: 20), Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.blueGrey))]),
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
            buildSalesCard("assets/images/Group3.png", "780.00", "Total Orders"),
            buildSalesCard("assets/images/Group4.png", "120.00", "Refunds"),
          ],
        ),
      ],
    );
  }
}
