import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SalesReportScreen extends StatefulWidget {
  const SalesReportScreen({super.key});

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F8FB),
        elevation: 0,
        title: const Text(
          "Earnings",
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
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This Month",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset("assets/svgs/Frame.svg"),
              ],
            ),
            SizedBox(height: 20),
            buildSalesGrid(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
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
              child: Image.network("https://raw.githubusercontent.com/infinum/flutter-charts/master/assets/showcase.gif",fit: BoxFit.cover,),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Payment History",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Payment Setting",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
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
            )
          ],
        ),
      ),
    );
  }

  /// 🔹 Reusable Card Widget
  Widget buildSalesCard(
      String imagePath, String amount, String title, String percentage) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.43,
      width: MediaQuery.of(context).size.width * 0.43,
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
                    Text("+${percentage}%",
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
            buildSalesCard(
                "assets/svgs/Group62.png", "600.00", "This Month", "10"),
            SizedBox(
              width: 20,
            ),
            buildSalesCard("assets/svgs/Group62.png", "10000.00",
                "Last Month Earning", "15"),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
