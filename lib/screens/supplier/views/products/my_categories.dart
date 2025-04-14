import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/ListOfCategories.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/add_category.dart';

class MyCategories extends StatefulWidget {
  final List<Map<String, dynamic>> newproducts;
  const MyCategories({super.key,required this.newproducts});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
 final List<Map<String, dynamic>> categories = [
  {
    "name": "Grains",
    "image": "assets/images/wheat.png",
    "subcategories": [
      "Wheat",
      "Rice",
      "Corn",
      "Oats",
      "Barley",
      "Millets"
    ]
  },
  {
    "name": "Vegetables",
    "image": "assets/images/vegetable.png",
    "subcategories": [
      "Leafy Greens",
      "Root Vegetables",
      "Cruciferous",
      "Allium Vegetables",
      "Legumes",
      "Marrow Vegetables"
    ]
  },
  {
    "name": "Fruits",
    "image": "assets/images/fruits.png",
    "subcategories": [
      "Citrus Fruits",
      "Berries",
      "Stone Fruits",
      "Tropical Fruits",
      "Melons",
      "Pomes (Apples & Pears)"
    ]
  },
  {
    "name": "Dry Fruits",
    "image": "assets/images/almond.png",
    "subcategories": [
      "Almonds",
      "Cashews",
      "Walnuts",
      "Pistachios",
      "Raisins",
      "Dates"
    ]
  }
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "My Categories",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert),
          SizedBox(
            width: 10,
          )
        ],
      ),
    
      body: Container(
  padding: EdgeInsets.all(20),
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
    color: const Color.fromARGB(255, 236, 235, 234),
  child: Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategory()),
          );
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent,
          ),
          child: Center(
            child: Text(
              "Add new category",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(height: 20),

      /// Wrap GridView.count inside Expanded
      Expanded(
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          children: List.generate(categories.length, (index) {
            return GestureDetector(
                onTap: () {
                  String selectedCategory = categories[index]["name"];

                      /// Filter products based on selected category
                      List<Map<String, dynamic>> filteredProducts =
                          widget.newproducts
                              .where((product) =>
                                  product["category"] == selectedCategory)
                              .toList();

                      // print("Selected Category: $selectedCategory");
                      // print("Filtered Products: $filteredProducts");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Listofcategories(
          sortedProducts: filteredProducts,
          name: categories[index]["name"],
          image: categories[index]["image"],
          subcategories: List<String>.from(categories[index]["subcategories"],),
        ),
      ),
    );
  },
             
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 105,
                        padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 236, 235, 234),
                      ),
                        width: double.infinity,
                        child: Image.asset(categories[index]["image"],width: 10,),),
                      Text(categories[index]["name"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),)
                    ],
                  )
                ),
              ),
            );
          }),
        ),
      ),
    ],
  ),
),

    );
  }
}
