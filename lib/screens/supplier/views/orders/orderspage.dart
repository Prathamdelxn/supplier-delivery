// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class OrdersPage extends StatefulWidget {
//   const OrdersPage({super.key});

//   @override
//   State<OrdersPage> createState() => _OrdersPageState();
// }

// enum OrderFilter { total, pending, placed }

// class _OrdersPageState extends State<OrdersPage> {
//   OrderFilter selectedFilter = OrderFilter.total; // Default to total orders

//   final List<Map<String, String>> allOrders = [
//     {
//       "id": "#20211028-07104354",
//       "date": "2 Nov 2021 04:24 PM",
//       "amount": "₹ 450.00",
//       "status": "Paid",
//       "customer": "Ankit Ghode",
//       "deliveryStatus": "Placed"
//     },
//     {
//       "id": "#20211029-08105412",
//       "date": "3 Nov 2021 01:15 PM",
//       "amount": "₹ 620.00",
//       "status": "Paid",
//       "customer": "Rahul Sharma",
//       "deliveryStatus": "Pending"
//     },
//     {
//       "id": "#20211030-09101234",
//       "date": "4 Nov 2021 11:30 AM",
//       "amount": "₹ 800.00",
//       "status": "Unpaid",
//       "customer": "Priya Verma",
//       "deliveryStatus": "Pending"
//     }
//   ];

//   List<Map<String, String>> get filteredOrders {
//     if (selectedFilter == OrderFilter.total) {
//       return allOrders;
//     } else if (selectedFilter == OrderFilter.pending) {
//       return allOrders
//           .where((order) => order["deliveryStatus"] == "Pending")
//           .toList();
//     } else {
//       return allOrders
//           .where((order) => order["deliveryStatus"] == "Placed")
//           .toList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double h = MediaQuery.of(context).size.height;
//       final double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   backgroundColor: Colors.white,
//       //   elevation: 0,
//       //   title: const Text(
//       //     "Orders",
//       //     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
//       //   ),
//       //   actions: const [
//       //     Icon(Icons.support_agent, size: 25, color: Colors.black),
//       //     SizedBox(width: 15),
//       //     Icon(Icons.notifications, size: 25, color: Colors.black),
//       //     SizedBox(width: 10),
//       //   ],
//       // ),
//       // body: Container(
//       //   color: Color(0xFFF6F8FB),
//       //   padding: const EdgeInsets.all(15),
//       //   width: double.infinity,
//       //   child: Column(
//       //     children: [
//       //       const SizedBox(height: 10),
//       //       SingleChildScrollView(
//       //         physics: const BouncingScrollPhysics(),
//       //         scrollDirection: Axis.horizontal,
//       //         child: Row(
//       //           children: [
//       //             buildFilterButton("Total Orders", OrderFilter.total,
//       //                 const Color.fromARGB(255, 76, 111, 209)),
//       //             buildFilterButton("Pending Orders", OrderFilter.pending,
//       //                 const Color.fromARGB(255, 76, 111, 209)),
//       //             buildFilterButton("Placed Orders", OrderFilter.placed,
//       //                 const Color.fromARGB(255, 76, 111, 209)),
//       //           ],
//       //         ),
//       //       ),
//       //       const SizedBox(height: 20),
//       //       Expanded(
//       //         child: filteredOrders.isNotEmpty
//       //             ? ListView.builder(
//       //                 itemCount: filteredOrders.length,
//       //                 itemBuilder: (context, index) {
//       //                   final order = filteredOrders[index];
//       //                   return Container(
//       //                     margin: const EdgeInsets.only(bottom: 15),
//       //                     padding: const EdgeInsets.all(15),
//       //                     decoration: BoxDecoration(
//       //                         borderRadius: BorderRadius.circular(10),
//       //                         color: Colors.white,
//       //                         boxShadow: [
//       //                           BoxShadow(
//       //                             color: Color.fromRGBO(149, 157, 165, 0.2),
//       //                             blurRadius: 24,
//       //                             spreadRadius: 0,
//       //                             offset: Offset(
//       //                               0,
//       //                               8,
//       //                             ),
//       //                           ),
//       //                         ]),
//       //                     child: Column(
//       //                       children: [
//       //                         Row(
//       //                           children: [
//       //                             Column(
//       //                               crossAxisAlignment:
//       //                                   CrossAxisAlignment.start,
//       //                               children: [
//       //                                 Text(
//       //                                   order["id"]!,
//       //                                   style: const TextStyle(
//       //                                       fontSize: 18,
//       //                                       fontWeight: FontWeight.w500),
//       //                                 ),
//       //                                 Text(
//       //                                   order["date"]!,
//       //                                   style: const TextStyle(
//       //                                       fontSize: 16,
//       //                                       fontWeight: FontWeight.w400,
//       //                                       color: Colors.grey),
//       //                                 ),
//       //                               ],
//       //                             ),
//       //                             const Spacer(),
//       //                             Text(
//       //                               order["amount"]!,
//       //                               style: const TextStyle(
//       //                                   fontSize: 20,
//       //                                   fontWeight: FontWeight.w600),
//       //                             ),
//       //                             const SizedBox(width: 6),
//       //                             Text(
//       //                               order["status"]!,
//       //                               style: TextStyle(
//       //                                   fontSize: 12,
//       //                                   fontWeight: FontWeight.w400,
//       //                                   color: order["status"] == "Paid"
//       //                                       ? Colors.green
//       //                                       : Colors.red),
//       //                             ),
//       //                           ],
//       //                         ),
//       //                         const SizedBox(height: 10),
//       //                         Row(
//       //                           children: [
//       //                             Expanded(
//       //                               child: Column(
//       //                                 crossAxisAlignment:
//       //                                     CrossAxisAlignment.start,
//       //                                 children: [
//       //                                   const Text(
//       //                                     "Customer Name",
//       //                                     style: TextStyle(
//       //                                         fontWeight: FontWeight.w400,
//       //                                         fontSize: 18,
//       //                                         color: Colors.blueGrey),
//       //                                   ),
//       //                                   Text(
//       //                                     order["customer"]!,
//       //                                     style: const TextStyle(
//       //                                         fontWeight: FontWeight.w600,
//       //                                         fontSize: 16,
//       //                                         color: Color.fromARGB(
//       //                                             255, 55, 72, 80)),
//       //                                   ),
//       //                                   const SizedBox(height: 10),
//       //                                   const Text(
//       //                                     "Delivery Status",
//       //                                     style: TextStyle(
//       //                                         fontWeight: FontWeight.w400,
//       //                                         fontSize: 18,
//       //                                         color: Colors.blueGrey),
//       //                                   ),
//       //                                   Text(
//       //                                     order["deliveryStatus"]!,
//       //                                     style: const TextStyle(
//       //                                         fontWeight: FontWeight.w600,
//       //                                         fontSize: 16,
//       //                                         color: Color.fromARGB(
//       //                                             255, 55, 72, 80)),
//       //                                   ),
//       //                                 ],
//       //                               ),
//       //                             ),
//       //                             Image.asset("assets/images/Invoice.png",
//       //                                 height: 80),
//       //                           ],
//       //                         ),
//       //                       ],
//       //                     ),
//       //                   );
//       //                 },
//       //               )
//       //             : const Center(
//       //                 child: Text(
//       //                   "No Orders Found",
//       //                   style: TextStyle(
//       //                       fontSize: 18, fontWeight: FontWeight.w500),
//       //                 ),
//       //               ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       body: Container(
//         height: h,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: h * 0.08,
//               decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("Orders",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
//                   Spacer(),
//                   Icon(Icons.search, size: 30),
//                   SizedBox(width: 20),
//                   SvgPicture.asset("assets/svgs/filter.svg"),
//                 ],
//               ),
//             ),
//             Container(
//               width: w,
//               height: h * 0.07,
              
//               color: Colors.amber,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       margin: EdgeInsets.only(right: 20),
//                       color: Colors.blue,
//                       child: Center(
//                         child: Text("All Orders  12",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 18)),
//                       ),
//                     ),
//                     Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                       margin: EdgeInsets.only(right: 20),
//                       color: Colors.blue,
//                       child: Center(
//                         child: Text("All Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 18)),
//                       ),
//                     ),
//                     Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//   margin: EdgeInsets.only(right: 20),                      color: Colors.blue,
//                       child: Center(
//                         child: Text("All Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 18)),
//                       ),
//                     ),
//                     Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                   margin: EdgeInsets.only(right: 20),
//                       color: Colors.blue,
//                       child: Center(
//                         child: Text("All Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 18)),
//                       ),
//                     ),
//                     Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                      margin: EdgeInsets.only(right: 20),
//                       color: Colors.blue,
//                       child: Center(
//                         child: Text("All Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 18)),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildFilterButton(String title, OrderFilter filter, Color color) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedFilter = filter;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         margin: const EdgeInsets.symmetric(horizontal: 5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: selectedFilter == filter ? color : Colors.grey[300],
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//             color: selectedFilter == filter ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supplier_dashboard/screens/supplier/views/orders/order_details.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

enum OrderFilter { all, new_orders, preparing, ready }

class _OrdersPageState extends State<OrdersPage> {
  OrderFilter selectedFilter = OrderFilter.all;

  final List<Map<String, dynamic>> orders = [
    {
      "id": "# 12345",
      "time": "10:30 AM",
      "customer": "John Smith",
      "address": "123 Main Street, Apt 4B, New York, NY 10001",
      "itemCount": 3,
      "amount": 45.99,
      "status": "New Order"
    },
    {
      "id": "# 12346",
      "time": "10:15 AM",
      "customer": "Emma Wilson",
      "address": "456 Park Avenue, Suite 2C, New York, NY 10022",
      "itemCount": 2,
      "amount": 32.50,
      "status": "Preparing"
    },
    {
      "id": "# 12347",
      "time": "9:45 AM",
      "customer": "Michael Brown",
      "address": "789 Broadway, Floor 5, New York, NY 10003",
      "itemCount": 4,
      "amount": 67.80,
      "status": "Ready"
    },
  ];

  List<Map<String, dynamic>> get filteredOrders {
    if (selectedFilter == OrderFilter.all) {
      return orders;
    } else if (selectedFilter == OrderFilter.new_orders) {
      return orders.where((order) => order["status"] == "New Order").toList();
    } else if (selectedFilter == OrderFilter.preparing) {
      return orders.where((order) => order["status"] == "Preparing").toList();
    } else {
      return orders.where((order) => order["status"] == "Ready").toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 228, 240, 239),
          height: h,
          width: w,
          child: Column(
            children: [
              // App Bar
              Container(
                width: w,
                height: h * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Filter tabs
              Container(
                width: w,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildFilterTab("All Orders", "12", OrderFilter.all),
                      buildFilterTab("New", "3", OrderFilter.new_orders),
                      buildFilterTab("Preparing", "4", OrderFilter.preparing),
                      buildFilterTab("Ready", "2", OrderFilter.ready),
                    ],
                  ),
                ),
              ),

              // Orders list
              Expanded(
                child: ListView.builder(
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, index) {
                    final order = filteredOrders[index];
                    return buildOrderCard(order);
                  },
                ),
              ),

              // Bottom indicator
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilterTab(String title, String count, OrderFilter filter) {
    bool isSelected = selectedFilter == filter;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[50] : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          count.isEmpty ? title : "$title ($count)",
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.black,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget buildOrderCard(Map<String, dynamic> order) {
    Color statusColor;
    Color statusBgColor;
    
    switch (order["status"]) {
      case "New Order":
        statusColor = Colors.green;
        statusBgColor = Colors.green.withOpacity(0.1);
        break;
      case "Preparing":
        statusColor = Colors.blue;
        statusBgColor = Colors.blue.withOpacity(0.1);
        break;
      case "Ready":
        statusColor = Colors.orange;
        statusBgColor = Colors.orange.withOpacity(0.1);
        break;
      default:
        statusColor = Colors.grey;
        statusBgColor = Colors.grey.withOpacity(0.1);
    }

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetails()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Order header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        order["id"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        order["time"],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      order["status"],
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            // Customer info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.person_outline, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    order["customer"],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
      
            // Address
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      order["address"],
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            // Order summary
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${order["itemCount"]} items",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "\$ ${order["amount"].toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
      
            // Action buttons
            if (order["status"] == "New Order")
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Accept"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Reject"),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}