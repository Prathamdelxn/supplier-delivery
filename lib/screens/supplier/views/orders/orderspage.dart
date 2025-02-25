import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

enum OrderFilter { total, pending, placed }

class _OrdersPageState extends State<OrdersPage> {
  OrderFilter selectedFilter = OrderFilter.total; // Default to total orders

  final List<Map<String, String>> allOrders = [
    {
      "id": "#20211028-07104354",
      "date": "2 Nov 2021 04:24 PM",
      "amount": "₹ 450.00",
      "status": "Paid",
      "customer": "Ankit Ghode",
      "deliveryStatus": "Placed"
    },
    {
      "id": "#20211029-08105412",
      "date": "3 Nov 2021 01:15 PM",
      "amount": "₹ 620.00",
      "status": "Paid",
      "customer": "Rahul Sharma",
      "deliveryStatus": "Pending"
    },
    {
      "id": "#20211030-09101234",
      "date": "4 Nov 2021 11:30 AM",
      "amount": "₹ 800.00",
      "status": "Unpaid",
      "customer": "Priya Verma",
      "deliveryStatus": "Pending"
    }
  ];

  List<Map<String, String>> get filteredOrders {
    if (selectedFilter == OrderFilter.total) {
      return allOrders;
    } else if (selectedFilter == OrderFilter.pending) {
      return allOrders
          .where((order) => order["deliveryStatus"] == "Pending")
          .toList();
    } else {
      return allOrders
          .where((order) => order["deliveryStatus"] == "Placed")
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Orders",
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
color: Color(0xFFF6F8FB),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildFilterButton("Total Orders", OrderFilter.total,
                      const Color.fromARGB(255, 76, 111, 209)),
                  buildFilterButton(
                      "Pending Orders", OrderFilter.pending, const Color.fromARGB(255, 76, 111, 209)),
                  buildFilterButton(
                      "Placed Orders", OrderFilter.placed, const Color.fromARGB(255, 76, 111, 209)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredOrders.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredOrders.length,
                      itemBuilder: (context, index) {
                        final order = filteredOrders[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow:[
    BoxShadow(
          color: Color.fromRGBO(149, 157, 165, 0.2),
          blurRadius: 24,
          spreadRadius: 0,
          offset: Offset(
             0,
             8,
          ),
       ),
       
]
  
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order["id"]!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        order["date"]!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    order["amount"]!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    order["status"]!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: order["status"] == "Paid"
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Customer Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          order["customer"]!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 55, 72, 80)),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          "Delivery Status",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          order["deliveryStatus"]!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 55, 72, 80)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset("assets/images/Invoice.png",
                                      height: 80),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No Orders Found",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterButton(String title, OrderFilter filter, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedFilter == filter ? color : Colors.grey[300],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: selectedFilter == filter ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
