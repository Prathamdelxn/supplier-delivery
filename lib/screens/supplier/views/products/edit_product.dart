import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProduct extends StatefulWidget {
  final Map productdataedit;
  const EditProduct({super.key, required this.productdataedit});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  // bool isVisible = true;
  String selectedUnit = "gm";
  double offerPercentage = 20.0;
  late TextEditingController regularPriceController;
  late TextEditingController discountedPriceController;
  late TextEditingController descriptionController;

 @override
  void initState() {
     super.initState();
       final price = widget.productdataedit["price_per_quantity"].toString();
       print(price); 
      regularPriceController =TextEditingController(text: price);
      discountedPriceController =TextEditingController(text: widget.productdataedit["discounted_price"].toString());
      descriptionController = TextEditingController(
      text: widget.productdataedit["description"].toString());
    regularPriceController.addListener(() {
      setState(() {
        calculateOfferPercentage();
      });
    });

    discountedPriceController.addListener(() {
      setState(() {
        calculateOfferPercentage();
      });
    });
  }
  // final TextEditingController discountedPriceController =
  //     TextEditingController(text: "80");

  void calculateOfferPercentage() {
    // print(regularPriceController.text+"new");
    double regularPrice = double.tryParse(regularPriceController.text) ?? 150;
    double discountedPrice =
        double.tryParse(discountedPriceController.text) ?? 0;
    if (regularPrice > 0 &&
        discountedPrice > 0 &&
        discountedPrice < regularPrice) {
      double discount = ((regularPrice - discountedPrice) / regularPrice) * 100;
      setState(() {
        offerPercentage = discount;
      });
    } else {
      setState(() {
        offerPercentage = 0; 
      });
    }
  }

 
  final ImagePicker _picker = ImagePicker();
  List<String> imageUrls = [
    'https://www.jiomart.com/images/product/original/590003517/tomato-1-kg-product-images-o590003517-p590003517-0-202408091800.jpg?im=Resize=(420,420)',
    'https://www.jiomart.com/images/product/original/590003517/tomato-1-kg-product-images-o590003517-p590003517-0-202408091800.jpg?im=Resize=(420,420)',
    'https://www.jiomart.com/images/product/original/590003517/tomato-1-kg-product-images-o590003517-p590003517-0-202408091800.jpg?im=Resize=(420,420)',
    'https://www.jiomart.com/images/product/original/590003517/tomato-1-kg-product-images-o590003517-p590003517-0-202408091800.jpg?im=Resize=(420,420)',
  ];

  Future<void> pickImage() async {
    if (widget.productdataedit["image_url"].length >= 5) {
      // ✅ Show popup if image count exceeds 5
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Limit Reached"),
          content: const Text("You can only add up to 5 images."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          widget.productdataedit["image_url"].add(image.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  ImageProvider getImageProvider(String imagePath) {
    if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
      return NetworkImage(imagePath);
    } else {
      return FileImage(File(imagePath));
    }
  }

  void removeImage(int index) {
    setState(() {
      widget.productdataedit["image_url"].removeAt(index); // Removes the image at the selected index
    });
  }

 

  @override
  void dispose() {
    regularPriceController.dispose();
    discountedPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        centerTitle: true,
        title: const Text(
          "Edit Product",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Center(
                child: Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 35,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 227, 227, 227),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Images Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Product Images",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " (${widget.productdataedit["image_url"].length}/5)",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Text("+ Add Image",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height:
                          160, // Give enough height to avoid rendering issues
                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal, // To make it scroll horizontally
                        itemCount: widget.productdataedit["image_url"].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 10), // Spacing between items
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: getImageProvider(widget.productdataedit["image_url"][
                                        index]), // ✅ Common method used
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () => removeImage(index),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.delete_outline,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Product Name",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: TextEditingController(text: widget.productdataedit["name"]),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Category",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: widget.productdataedit["category"],
                                    isExpanded: true,
                                    items: ["Vegetables", "Fruits", "Grains","Dry Fruits"]
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Subcategory",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: "Fresh",
                                    isExpanded: true,
                                    items: ["Fresh", "Canned", "Frozen"]
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Quantity",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: TextEditingController(text: widget.productdataedit["stock_quantity"].toString()),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Stock Quantity",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextField(
                                      controller:
                                          TextEditingController(text: widget.productdataedit["quantity"].toString()),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: widget.productdataedit["quantity_unit"],
                                          isExpanded: true,
                                          items: ["gm", "kg", "pcs"]
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            if (newValue != null) {
                                              setState(() {
                                                selectedUnit = newValue;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Pricing Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pricing",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    //calculation of discount
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Regular Price",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                // controller: TextEditingController(text: "100"),
                                controller: regularPriceController,

                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      "₹",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                      minWidth: 0, minHeight: 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Discounted Price",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                // controller: TextEditingController(text: "80"),
                                controller: discountedPriceController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      "₹",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                      minWidth: 0, minHeight: 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Offer Percentage",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "${offerPercentage.toStringAsFixed(1)}% OFF",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Description Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      maxLines: 4,
                      maxLength: 500,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Product Status Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Status",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Product is visible to customers",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: widget.productdataedit["active"],
                          onChanged: (value) {
                            setState(() {
                              widget.productdataedit["active"] = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Created At",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                               Text(
                                widget.productdataedit["createdAt"],
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Modified",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "22 Nov 2021 04:24 PM",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
