import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/views/analytics/sales_report_screen.dart';
import 'package:supplier_dashboard/screens/supplier/views/home/home_screen.dart';
import 'package:supplier_dashboard/screens/supplier/views/orders/order_details.dart';
import 'package:supplier_dashboard/screens/supplier/views/orders/orderspage.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/product_page.dart';
import 'package:supplier_dashboard/screens/supplier/views/profile/profile_screen.dart';

class NavigationPage extends StatefulWidget {
  final int selectedIndex; // Accept selected index

  const NavigationPage(
      {super.key, this.selectedIndex = 0}); // Default is HomePage

  @override
  State<NavigationPage> createState() => _NavigationpageState();
}

class _NavigationpageState extends State<NavigationPage> {
  Color bottomNavBgColor = const Color.fromARGB(255, 12, 107, 12);
  late int pageIndex;

  List<Widget> pages = [
    HomeScreen(),
    // CategoriesPage(),
    OrdersPage(),
    ProductPage(),
   // SalesReportScreen(),
   SalesAnalyticsScreen(),
    // ProfileScreen()
    SalesProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    pageIndex = widget.selectedIndex; // Set initial index from parameter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 77, 10),
      body: Stack(
        children: [
          pages[pageIndex],
          Positioned(
            bottom: 20,
            left: 24,
            right: 24,
            child: Container(
              height: 65,
              padding: EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 119, 181, 253),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.dashboard, "Dashboard", 0),
                  _buildNavItem(Icons.list, "Orders", 1),
                  _buildNavItem(
                      Icons.production_quantity_limits, "Products", 2),
                  _buildNavItem(Icons.price_check_outlined, "Sales", 3),
                  _buildNavItem(Icons.person, "Profile", 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = pageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 24, 117, 217)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            // if (isSelected)
            //   Text(
            //     label,
            //     style: const TextStyle(color: Colors.white, fontSize: 12),
            //   ),
          ],
        ),
      ),
    );
  }
}
