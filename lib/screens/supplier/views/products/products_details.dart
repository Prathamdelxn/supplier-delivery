import 'package:flutter/material.dart';
import 'package:supplier_dashboard/screens/supplier/views/products/edit_product.dart';

class ProductsDetails extends StatefulWidget {
  final Map productData;
  const ProductsDetails({super.key,required this.productData});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {


  // Currently selected image index
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: Border.all(color: Colors.grey),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          GestureDetector( onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProduct(productdataedit: widget.productData,)));
                                                  }, child: Image.asset("assets/images/edit.png")),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Carousel for Big Image
              Container(
                color: Color.fromARGB(255, 245, 247, 245),
                height: 250,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemCount: widget.productData["image_url"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      margin: EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        widget.productData["image_url"][index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              // Thumbnail Images
              Container(
                color: Color.fromARGB(255, 245, 247, 245),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.productData["image_url"].length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(index);
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentImageIndex == index
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            widget.productData["image_url"][index],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 5, 116, 37), width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "📷  Manage Photos",
                    style: TextStyle(
                        color: Color.fromARGB(255, 5, 116, 37),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
             
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Almonds',
                      widget.productData["name"],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromARGB(255, 211, 211, 211),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Center(
                            child: Text(
                              widget.productData["category"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                         widget.productData["subcategory"] == null
                            ? Container()
                            :
                         Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromARGB(255, 211, 211, 211),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Center(
                            child: Text(
                             widget.productData["subcategory"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                         "₹ ${ widget.productData["discounted_price"]}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                        "₹ ${ widget.productData["price_per_quantity"]}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '10% OFF',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 62, 141, 64),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 129, 178, 218)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                         "${widget.productData["quantity"]}${widget.productData["quantity_unit"]}",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 41, 91, 147),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 236, 236),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Available Stock",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.lock_clock),
                              SizedBox(
                                width: 2,
                              ),
                              Text("Last Updated 2 hrs",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        widget.productData["stock_quantity"],
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              // Stock and Last Updated

              // Description
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                       widget.productData["description"],
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal:  20),
                child: Row(
                  children: [
                    Text("Specification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
          
                margin: EdgeInsets.symmetric(horizontal:  20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                ),
                child: Row(
                  children: [
                    Text("Category",style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    Text(    widget.productData["category"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),
              ),
                  widget.productData["subcategory"] == null
                            ? Container()
                            :
                Container(
          
                margin: EdgeInsets.symmetric(horizontal:  20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                ),
                child: Row(
                  children: [
                    Text("Subcategory",style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    Text( widget.productData["subcategory"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),
              ),
                Container(
          
                margin: EdgeInsets.symmetric(horizontal:  20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                ),
                child: Row(
                  children: [
                    Text("Unit Size",style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    Text(           "${widget.productData["quantity"]}${widget.productData["quantity_unit"]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),
              ),
                Container(
          
                margin: EdgeInsets.symmetric(horizontal:  20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                ),
                child: Row(
                  children: [
                    Text("Stock Status",style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    Text( widget.productData["active"]? "Active": "Deactive",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),
              ),
                Container(
          
                margin: EdgeInsets.symmetric(horizontal:  20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                ),
                child: Row(
                  children: [
                    Text("Created Date",style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    Text(widget.productData["createdAt"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),
              ),
            
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: const Color.fromARGB(255, 206, 76, 67)
                ),
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text("Delete Product",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                ),
              ),
              SizedBox(height: 50,)
              
            ],
          ),
        ),
      ),
    );
  }
}
