import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // Green Background Section
                Container(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 8, 159, 89),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://img.etimg.com/thumb/width-1200,height-900,imgsize-2430285,resizemode-75,msid-99091239/industry/services/retail/mom-and-pop-store-day-why-kirana-will-survive-the-corporate-blitz.jpg"),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Green Valley Farms",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Organic Produce Supplier",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_city, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "Katraj, Pune",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.phone, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "+91 9812763405",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "⭐ ⭐ ⭐ ⭐ ⭐ (245 reviews)",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Selling Products",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                   
                      SizedBox(
                        height: 20,
                      ),  
                      Container(
                        height: 250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, itemBuilder: (BuildContext context,int index){
                          return Container(
         
                                width: 185,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  
                                  children: [
                                  ClipRRect(  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)), child: Image.network("https://cdn.britannica.com/16/187216-131-FB186228/tomatoes-tomato-plant-Fruit-vegetable.jpg",width: double.infinity,)),
                                  SizedBox(height: 10,),
                                  Text("Tomato's",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("₹ 25 / kg",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),

                                  Text("230 sold",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              );
                        }),
                      ),
                      SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Recent Orders",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: NeverScrollableScrollPhysics(  ),

                            itemBuilder: (BuildContext context , int index){
                              return Container(
                               
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(top: 10), 
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 218, 217, 216),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("#ORD-1234",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                        Spacer(),
                                        Text("₹ 250",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    Row(
                                      children: [
                                        Text("Prathmesh",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                        Spacer(),
                                        Container(height: 30,width: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Center(
                                          child: Text("Delivered",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                                        ),
                                     )
                                      ],
                                    )
                                  ],
                                ),
                              );

                          }
                        ))
                    ],
                  ),
                ),
                // White Background Section
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ],
            ),
            // Scrolling Cards Section positioned at the intersection
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35 -
                  10, // Center the cards at the intersection
              left: 0,
              right: 0,
              child: Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _buildCard(
                        "assets/images/write.png", "100", "Total Orders"),
                    SizedBox(width: 10),
                    _buildCard(
                        "assets/images/wallet.png", "₹ 1899", "Earnings"),
                    SizedBox(width: 10),
                    _buildCard(
                        "assets/images/category.png", "45", "Dashboard"),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String image, String amount, String title) {
    return Container(
      height: 120,
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(149, 157, 165, 0.2),
            blurRadius: 24,
            spreadRadius: 0,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 24,
          ),
          SizedBox(height: 10),
          Text(
            "${amount}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
