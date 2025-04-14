import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supplier_dashboard/screens/supplier/views/profile/bankDetails.dart';
import 'package:supplier_dashboard/screens/supplier/views/profile/edit_profile.dart';
import 'package:supplier_dashboard/screens/supplier/views/profile/edit_store_details.dart';

import '../../providers/auth_provider.dart';

class SalesProfileScreen extends StatefulWidget {
  const SalesProfileScreen({super.key});

  @override
  State<SalesProfileScreen> createState() => _SalesProfileScreenState();
}

class _SalesProfileScreenState extends State<SalesProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.loadUserData(); // Load stored credentials
      await authProvider.fetchSupplierData(); // Fetch supplier details
    });

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState == null) return;

    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  String _capitalize(String? text) {
    if (text == null || text.isEmpty) return "Loading...";
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    // dynamic data = authProvider.supplierData;
    // dynamic dd = data.containsKey('bankDetails') ? data['bankDetails'] : null;
dynamic data = authProvider.supplierData ?? {};
  dynamic dd = data is Map && data.containsKey('bankDetails') 
      ? data['bankDetails'] 
      : null;
     print(dd);
    //  print(dd["bankDetails"]["accountHolderName"]);

    // if (dd == null) {
    //   print("Data is null");
    // } else {
    //   print("Data exists");
    // }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: screenWidth * 0.85,
        child: Drawer(
          backgroundColor: const Color.fromARGB(255, 236, 235, 234),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/fflogo.png",
                      height: 50,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Supplier's",
                      style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 12, 76, 28),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Menu",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 75, 75, 75),
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 208, 208, 207),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.person,
                            size: 30,
                            color: const Color.fromARGB(255, 44, 43, 43),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color.fromARGB(255, 56, 56, 56)),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditStoreDetails()));
                  },
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 208, 208, 207),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.store,
                            size: 30,
                            color: const Color.fromARGB(255, 44, 43, 43),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Store Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color.fromARGB(255, 56, 56, 56)),
                          )
                        ],
                      )),
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 208, 208, 207),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.notifications,
                          size: 30,
                          color: const Color.fromARGB(255, 44, 43, 43),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color.fromARGB(255, 56, 56, 56)),
                        )
                      ],
                    )),
                Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 208, 208, 207),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.support_agent_outlined,
                          size: 30,
                          color: const Color.fromARGB(255, 44, 43, 43),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Help and Support",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color.fromARGB(255, 56, 56, 56)),
                        )
                      ],
                    )),
                Spacer(),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Dark Mode",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color.fromARGB(255, 56, 56, 56)),
                        ),
                        Spacer(),
                        Switch(
                            value: isDarkMode,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                isDarkMode = value;
                              });
                            }),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    authProvider.logout(context);
                  },
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 37, 82, 6),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: const Color.fromARGB(255, 251, 250, 250),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color:
                                    const Color.fromARGB(255, 255, 251, 251)),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      backgroundColor: Color.fromARGB(255, 228, 240, 239),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Top Blue Header
                Container(
                  height: 175,
                  color: const Color.fromARGB(255, 33, 82, 243),
                ),
                // Expanded Section with Scrollable Content
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: 80, left: 16, right: 16, bottom: 16),
                    children: [
                      // bankdetails==null? Container(
                      //   child: Text('data'),
                      // ):
                      _buildSection(context,
                          icon: Icons.business,
                          title: 'Business Details',
                          children: [
                            _buildDetailRow('Business Type',
                                '${authProvider.supplierData?["supplierBusiness_type"] ?? " Loading Business.."}'),
                            _buildDetailRow('Shop Name',
                                '${authProvider.supplierData?["supplierShop_name"] ?? " Loading Name.."} '),
                            _buildDetailRow('GST Number', '29ABCDE1234F1Z5'),
                            _buildDetailRow('PAN', 'ABCDE1234F'),
                          ]),
                      SizedBox(height: 12),
                      _buildSection(context,
                          icon: Icons.phone,
                          title: 'Contact Details',
                          children: [
                            _buildDetailRow('Email',
                                ' ${authProvider.supplierData?['supplierEmail'] ?? "  contact@techsupplies.com"}',
                                icon: Icons.email),
                            _buildDetailRow('Phone',
                                ' ${authProvider.supplierData?['supplierPhone'] ?? "  Mobile number ..."}',
                                icon: Icons.phone),
                          ]),
                      SizedBox(height: 12),
                      _buildSection(context,
                          icon: Icons.location_on,
                          title: 'Address',
                          children: [
                           _buildDetailRow(
  "",
  '${_capitalize(authProvider.supplierData?['address']?['street'] ?? "NA")}, '
  '${_capitalize(authProvider.supplierData?['address']?['city'] ?? "NA")}, '
  '${_capitalize(authProvider.supplierData?['address']?['state'] ?? "NA")}, '
  '${_capitalize(authProvider.supplierData?['address']?['country'] ?? "NA")}, '
  '${authProvider.supplierData?['address']?['pincode'] ?? "Loading Address..."}',
),

                          ]),
                      SizedBox(height: 12),
                      dd == null
                          ? GestureDetector(
                            onTap:() {
                              showBankingForm(context);
                            },
                            child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(9, 30, 66, 0.25),
                                        blurRadius: 8,
                                        spreadRadius: -2,
                                        offset: Offset(
                                          0,
                                          4,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Color.fromRGBO(9, 30, 66, 0.08),
                                        blurRadius: 0,
                                        spreadRadius: 1,
                                        offset: Offset(
                                          0,
                                          0,
                                        ),
                                      ),
                                    ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_circle_outline),
                                        SizedBox(width: 10,),
                                        Text("Add Bank Account Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
                                      ],
                                    ),
                              ),
                          )
                          : _buildSection(context,
                              icon: Icons.account_balance,
                              title: 'Bank Details',
                              children: [
                                   _buildDetailRow(
                                      'Account Holder', '${dd["accountHolderName"]?? "NA"}'),
                                   _buildDetailRow(
                                      'Bank Name', '${dd["bankName"]?? "NA"}'),
                                   _buildDetailRow(
                                       'Account Number', '${dd["accountNumber"]?? "NA"}'),
                                   _buildDetailRow('IFSC Code', '${dd["ifscCode"]?? "NA"}'),
                                ]),
                      SizedBox(height: 12),
                      _buildSection(context,
                          icon: Icons.verified,
                          title: "Verification Status",
                          children: [
                            _buildVerificationStatus(),
                          ]),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Overlapping Card
            Positioned(
              top: 120,
              left: 10,
              right: 10,
              child: _buildCard(context),
            ),
            // Header (Company Name + Icon)
            Positioned(
              top: 35,
              left: 20,
              right: 20,
              child: _buildHeader(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsColumn(IconData icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: Color.fromARGB(255, 33, 82, 243)),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 114, 113, 113))),
      ],
    );
  }

  Widget _buildHeader() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(Icons.store,
                  color: Color.fromARGB(255, 33, 82, 243), size: 30),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${authProvider.supplierData?['supplierName'] != null ? authProvider.supplierData!['supplierName'][0].toUpperCase() + authProvider.supplierData!['supplierName'].substring(1) : "Loading Name.."}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${authProvider.supplierData?["supplierBusiness_type"] != null ? authProvider.supplierData!["supplierBusiness_type"][0].toUpperCase() + authProvider.supplierData!["supplierBusiness_type"].substring(1) : "Loading Business.."}',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    _buildStatusBadge(true),
                  ],
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            _toggleDrawer();
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
              color: Colors.white,
              size: 32.0,
              semanticLabel: 'Show menu',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(bool isVerified) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isVerified ? Colors.green : Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isVerified ? Icons.verified : Icons.info,
            color: Colors.white,
            size: 16,
          ),
          SizedBox(width: 4),
          Text(
            isVerified ? 'Verified' : 'Pending',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatsColumn(Icons.shopping_bag, '1,234', 'Orders'),
            Container(height: 50, width: 1, color: Colors.grey[300]),
            _buildStatsColumn(
                FontAwesomeIcons.chartLine, '\$50,000', 'Revenue'),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required IconData icon,
      required String title,
      required List<Widget> children}) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {IconData? icon}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: Colors.blueAccent),
            SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty) ...[
                  Text(
                    title.isNotEmpty
                        ? title[0].toUpperCase() + title.substring(1)
                        : "",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                ],
                Text(
                  value.isNotEmpty
                      ? value[0].toUpperCase() + value.substring(1)
                      : "",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationStatus() {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row( 
          children: [
            Icon(Icons.verified, color: Colors.green),
            SizedBox(width: 10),
            Text("Verified Supplier",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
