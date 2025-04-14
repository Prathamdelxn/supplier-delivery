// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SalesReportScreen extends StatefulWidget {
//   const SalesReportScreen({super.key});

//   @override
//   State<SalesReportScreen> createState() => _SalesReportScreenState();
// }

// class _SalesReportScreenState extends State<SalesReportScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Earnings",
//           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
//         ),
//         actions: const [
//           Icon(Icons.support_agent, size: 25, color: Colors.black),
//           SizedBox(width: 15),
//           Icon(Icons.notifications, size: 25, color: Colors.black),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Container(
//                 color: Color.fromARGB(255, 228, 240, 239),

//         padding: EdgeInsets.symmetric(horizontal: 15),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "This Month",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                 ),
//                 SvgPicture.asset("assets/svgs/Frame.svg"),
//               ],
//             ),
//             SizedBox(height: 20),
//             buildSalesGrid(),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 150,
//                 width: double.infinity,
//                 clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Color.fromRGBO(9, 30, 66, 0.25),
//                       blurRadius: 8,
//                       spreadRadius: -2,
//                       offset: Offset(0, 4)),
//                   BoxShadow(
//                       color: Color.fromRGBO(9, 30, 66, 0.08),
//                       blurRadius: 0,
//                       spreadRadius: 1,
//                       offset: Offset(0, 0)),
//                 ],
                
//               ),
//               child: Image.network("https://raw.githubusercontent.com/infinum/flutter-charts/master/assets/showcase.gif",fit: BoxFit.cover,),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 60,
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.timer_outlined),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Payment History",
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//                   )
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Color.fromRGBO(9, 30, 66, 0.25),
//                       blurRadius: 8,
//                       spreadRadius: -2,
//                       offset: Offset(0, 4)),
//                   BoxShadow(
//                       color: Color.fromRGBO(9, 30, 66, 0.08),
//                       blurRadius: 0,
//                       spreadRadius: 1,
//                       offset: Offset(0, 0)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 60,
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.settings),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Payment Setting",
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//                   )
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Color.fromRGBO(9, 30, 66, 0.25),
//                       blurRadius: 8,
//                       spreadRadius: -2,
//                       offset: Offset(0, 4)),
//                   BoxShadow(
//                       color: Color.fromRGBO(9, 30, 66, 0.08),
//                       blurRadius: 0,
//                       spreadRadius: 1,
//                       offset: Offset(0, 0)),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   /// 🔹 Reusable Card Widget
//   Widget buildSalesCard(
//       String imagePath, String amount, String title, String percentage) {
//     return Container(
//       height: MediaQuery.of(context).size.width * 0.43,
//       width: MediaQuery.of(context).size.width * 0.43,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Color.fromRGBO(9, 30, 66, 0.25),
//               blurRadius: 8,
//               spreadRadius: -2,
//               offset: Offset(0, 4)),
//           BoxShadow(
//               color: Color.fromRGBO(9, 30, 66, 0.08),
//               blurRadius: 0,
//               spreadRadius: 1,
//               offset: Offset(0, 0)),
//         ],
//       ),
//       padding: EdgeInsets.all(10),
//       child: Column(
//         children: [
//           Container(
//             height: 90,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Image.asset(imagePath, height: 80),
//                 Row(
//                   children: [
//                     Text("+${percentage}%",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.green)),
//                     SizedBox(width: 2),
//                     Icon(Icons.arrow_upward, color: Colors.green, size: 20),
//                     SizedBox(width: 10),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Row(children: [
//             SizedBox(width: 20),
//             Text("₹ $amount",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24))
//           ]),
//           Row(children: [
//             SizedBox(width: 20),
//             Text(title,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 15,
//                     color: Colors.blueGrey))
//           ]),
//         ],
//       ),
//     );
//   }

//   /// 🔹 Grid Layout for Sales Cards
//   Widget buildSalesGrid() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             buildSalesCard(
//                 "assets/svgs/Group62.png", "600.00", "This Month", "10"),
//             SizedBox(
//               width: 20,
//             ),
//             buildSalesCard("assets/svgs/Group62.png", "10000.00",
//                 "Last Month Earning", "15"),
//           ],
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supplier_dashboard/screens/supplier/views/analytics/analystics_detailsPage.dart'; 
import 'package:syncfusion_flutter_charts/charts.dart';


class SalesAnalyticsScreen extends StatefulWidget {
  const SalesAnalyticsScreen({super.key});

  @override
  State<SalesAnalyticsScreen> createState() => _SalesAnalyticsScreenState();
}

class _SalesAnalyticsScreenState extends State<SalesAnalyticsScreen> {
   late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  int _selectedIndex = 0; // Track selected index

  final List<String> _filters = ["Today", "This Week", "This Month", "Custom"];
  @override
  void initState() {
    data = [
      
      _ChartData('Fruits', 15),
      _ChartData('Dry Fruits', 30),
      _ChartData('Grains', 6.4),
      _ChartData('Vegetables', 12),
      // _ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        elevation: 0,
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 228, 240, 239),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(16.0),
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Period", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
      children: List.generate(_filters.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index; // Update selected index
            });
          },
          child: Container(
            height: 37,
            padding: EdgeInsets.symmetric(horizontal: 13),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Color.fromARGB(255, 200, 200, 200),
                width: 1,
              ),
              color: _selectedIndex == index
                  ? Colors.blue // Selected button color
                  : Colors.white, // Default color
            ),
            child: Center(
              child: Row(
                children: [
                  if (_selectedIndex == index) Icon(Icons.check, size: 17, color: _selectedIndex == index ? Colors.white : Colors.black54),
                  if (_selectedIndex == index) SizedBox(width: 5),
                  Text(
                    _filters[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == index ? Colors.white : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),),
              
              ),
              SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard("₹45,280", "Total Sales", Icons.account_balance_wallet, Colors.blue),
                  _buildInfoCard("324", "Total Orders", Icons.shopping_cart, Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard("₹139.75", "Avg. Order", Icons.bar_chart, Colors.orange),
                  _buildInfoCard("189", "Active Users", Icons.people, Colors.purple),
                ],
              ),
              
              SizedBox(height: 20),
              Text("Sales Trend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 1500),
                          FlSpot(1, 1200),
                          FlSpot(2, 3000),
                          FlSpot(3, 3500),
                          FlSpot(4, 4500),
                          FlSpot(5, 3900),
                          FlSpot(6, 4200),
                        ],
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 3,
                        isStrokeCapRound: true,
                      ),
                    ],
                  ),
                ),
              ),
        
              SizedBox(height: 20),
Text("Sales by Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
               SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: _tooltip,
            series: <CartesianSeries<_ChartData, String>>[
              BarSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold',
                  color: Color.fromRGBO(8, 142, 255, 1))
            ]),
              
              // _buildCategoryBar("Vegetables", 30),
              // _buildCategoryBar("Fruits", 20),
              // _buildCategoryBar("Groceries", 15),
              // _buildCategoryBar("Dry Fruits", 10),
        
              SizedBox(height: 20),
              Text("Top Selling Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _buildProductTile("Organic Tomatoes", "₹12,480", "324 sales", "https://media.istockphoto.com/id/1132371208/photo/three-ripe-tomatoes-on-green-branch.jpg?s=612x612&w=0&k=20&c=qVjDb5Tk3-UccV-E9gqvoz97PTsP1QmBftw27qA9kEo="),
              _buildProductTile("Fresh Apples", "₹8,960", "256 sales", "https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-600nw-1727544364.jpg"),
              _buildProductTile("Cashew Nuts", "₹7,920", "198 sales", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSflSYGfvGIi4zs0_An5jmzaLCfeaAZIZVDhA&s"),
        
              SizedBox(height: 20),
              
        
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent,
                ),
            
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Export Data", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 80,)
            ],
          ),
          ]
        ),
      ),
    );
  }

  Widget _buildInfoCard(String value, String title, IconData icon, Color color) {
    return Expanded(
      child: GestureDetector(
          onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesReportPage()));
                    },
        child: Card(
          color: Colors.white,
          // ignore: deprecated_member_use
         // color: color.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, size: 30, color: color),
                SizedBox(height: 8),
                Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
                Text(title, style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryBar(String category, double percentage) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(category),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              width: percentage * 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductTile(String name, String price, String sales, String imagePath) {
  bool isSvg = imagePath.endsWith(".svg");

  return ListTile(
    leading: isSvg
        ? SvgPicture.network(imagePath, width: 40, height: 40)
        : Image.network(imagePath, width: 40, height: 40, fit: BoxFit.cover),
    title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(sales),
    trailing: Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
  );
}
}
class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}