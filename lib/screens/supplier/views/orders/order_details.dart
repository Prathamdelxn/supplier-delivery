import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int currentStep = 0; // Update dynamically based on order status

  // Order details
  final Map<String, dynamic> orderDetails = {
    "orderId": "#123456",
    "placedDate": "March 4, 2025",
    "estimatedDelivery": "March 7, 2025",
    "status": "Delivered",
    "items": [
      {
        "name": "Organic Cotton T-shirt",
        "variant": "Blue, Size M",
        "price": 29.99,
        "quantity": 2,
        "image": "assets/images/tshirt.jpg"
      },
      {
        "name": "Slim Fit Jeans",
        "variant": "Black, Size 32",
        "price": 49.99,
        "quantity": 1,
        "image": "assets/images/jeans.jpg"
      }
    ],
    "subtotal": 109.97,
    "shipping": 5.99,
    "tax": 11.00,
    "total": 126.96,
    "shippingAddress": {
      "name": "John Smith",
      "street": "123 Main Street, Apt 4B",
      "city": "New York",
      "state": "NY",
      "zip": "10001",
      "country": "United States"
    },
    "paymentMethod": {"type": "Credit Card", "last4": "4242", "brand": "Visa"}
  };

  List<String> stepTitles = [
    "Order Accepted",
    "Processing",
    "Shipped",
    "Delivered"
  ];
  List<String> stepDescriptions = [
    "Your order has been accepted and is being processed.",
    "Your order is being prepared for shipment.",
    "Your order has been shipped and is on the way.",
    "Your order has been delivered to your address."
  ];
  List<IconData> stepIcons = [
    Icons.shopping_cart_checkout,
    Icons.inventory,
    Icons.local_shipping,
    Icons.home
  ];
  List<String> stepDates = [
    "Mar 4, 9:30 AM",
    "Mar 5, 10:15 AM",
    "Mar 6, 8:45 AM",
    "Mar 7, 2:20 PM"
  ];

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Order Details",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.help_outline, color: Colors.black87, size: 22),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Order Summary Card
          Container(
            width: w,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order ${orderDetails["orderId"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Placed on: ${orderDetails["placedDate"]}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green[300]!),
                        ),
                        child: Text(
                          orderDetails["status"],
                          style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Stepper
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Status",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Custom stepper that ensures connected lines
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(stepTitles.length * 2 - 1, (index) {
                          // If even index, show circle
                          if (index % 2 == 0) {
                            final int stepIndex = index ~/ 2;
                            final bool isCompleted = stepIndex <= currentStep;
                            final bool isCurrent = stepIndex == currentStep;

                            return Column(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isCompleted
                                        ? Colors.blue[600]
                                        : Colors.grey[300],
                                    border: isCurrent
                                        ? Border.all(
                                            color: Colors.blue[300]!, width: 3)
                                        : null,
                                    boxShadow: isCurrent
                                        ? [
                                            BoxShadow(
                                              color:
                                                  Colors.blue.withOpacity(0.3),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            )
                                          ]
                                        : null,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      stepIcons[stepIndex],
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  stepTitles[stepIndex],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isCompleted
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: isCompleted
                                        ? Colors.black87
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            );
                          }
                          // If odd index, show line
                          else {
                            final int beforeIndex = index ~/ 2;
                            final bool isCompleted = beforeIndex < currentStep;

                            return Expanded(
                              child: Container(
                                height: 3,
                                color: isCompleted
                                    ? Colors.blue[600]
                                    : Colors.grey[300],
                              ),
                            );
                          }
                        }),
                      ),
                      SizedBox(height: 20),
                      // Current step description
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue[100]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline,
                                color: Colors.blue[700], size: 18),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    stepDates[currentStep],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    stepDescriptions[currentStep],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16, bottom: 5),
                        child: Row(
                          children: [
                            Icon(Icons.pin_drop,
                                color: Colors.black87, size: 18),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Delivery Address",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: const Color.fromARGB(221, 28, 28, 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(221, 128, 127, 127),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16, bottom: 5),
                        child: Row(
                          children: [
                            Icon(Icons.phone, color: Colors.black87, size: 18),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Contact Number",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: const Color.fromARGB(221, 28, 28, 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "+91 9356942975",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(221, 128, 127, 127),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 226, 226).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                         
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: const Color.fromARGB(255, 17, 159, 184)
                                  ),
                                ),
                              SizedBox(width: 10,),
                                Text("Prathmesh Godage", style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(221, 42, 42, 42)
                                ),),
                                Spacer(),
                                Icon(Icons.phone)
                                
                              ],
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          // Order Items
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Order Items",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(children: [
                ...List.generate(orderDetails["items"].length, (index) {
                  final item = orderDetails["items"][index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: index < orderDetails["items"].length - 1
                          ? Border(bottom: BorderSide(color: Colors.grey[200]!))
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(Icons.image, color: Colors.grey[400]),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item["variant"],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Qty: ${item["quantity"]}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "\$${(item["price"] * item["quantity"]).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }),

              ])),
              Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Payment summary",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
             margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
         
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    child: Row(
                      children: [
                        Text("Subtotal", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                               color: const Color.fromARGB(221, 66, 66, 66)
                        ),),
                        Spacer(),
                        Text("₹ 150", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                                                   color: const Color.fromARGB(221, 66, 66, 66)

                        ),),
                      ],
                    ),

                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    child: Row(
                      children: [
                        Text("Delivery Charge", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(221, 66, 66, 66)
                        ),),
                        Spacer(),
                        Text("₹ 15", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                                                       color: const Color.fromARGB(221, 66, 66, 66)

                        ),),
                      ],
                    ),

                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    child: Row(
                      children: [
                        Text("Taxes", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                               color: const Color.fromARGB(221, 66, 66, 66)
                        ),),
                        Spacer(),
                        Text("₹ 50", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                                                 color: const Color.fromARGB(221, 66, 66, 66)

                        ),),
                      ],
                    ),

                  ),
                  Divider(),
                    Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    child: Row(
                      children: [
                        Text("Total Amount", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                               color: const Color.fromARGB(221, 14, 14, 14)
                        ),),
                        Spacer(),
                        Text("₹ 215", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87
                        ),),
                      ],
                    ),

                  ),
                  Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 226, 226).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                         
                            ),
                            child: Row(
                             
                              children: [
                              Icon(Icons.credit_card),
                              SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Payment Method", style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(221, 42, 42, 42)
                                    ),),
                                    Text("Cash on Delivery",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 94, 94, 94)),)
                                  ],
                                ),
                                Spacer(),
                                Container(height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightGreen.withOpacity(0.5)
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Center(
                                  child: Text("Paid",style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 14, 95, 16)
                                  ),),
                                ),
                                )
                                
                              ],
                            ),
                      )
                  
                ],
              ),
          )
        ])));
  }
}
