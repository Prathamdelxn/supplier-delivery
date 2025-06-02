// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// class AddCategory extends StatefulWidget {
//   const AddCategory({super.key});

//   @override
//   State<AddCategory> createState() => _AddCategoryState();
// }

// class _AddCategoryState extends State<AddCategory> {
//    File? _selectedImage;
//   final ImagePicker _picker = ImagePicker();
  

  
//   Future<void> _pickImage() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Icon(Icons.arrow_back_ios)),
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         title: Text(
//           "Add new Category",
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         // actions: [Icon(Icons.more_vert)],
//         shape: Border.all(
//             color: const Color.fromARGB(255, 232, 230, 230), width: 0.8),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         color: Colors.white,
//         child: Column(
//           children: [
//             SizedBox(height: 40),
//             // DottedBorder(
//             //   padding: EdgeInsets.zero,
//             //   dashPattern: [7, 5],
//             //   borderType: BorderType.RRect,
//             //   radius: Radius.circular(15),
//             //   color: const Color.fromARGB(255, 54, 54, 54),
//             //   strokeWidth: 1.2,
//             //   child: Container(
//             //     height: 130,
//             //     width: 130,
//             //     decoration: BoxDecoration(
//             //       borderRadius: BorderRadius.circular(15),
//             //       color:
//             //           const Color.fromARGB(255, 240, 239, 239).withOpacity(0.5),
//             //     ),
//             //     child: Center(
//             //       child: Column(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           Image.asset("assets/images/upload.png"),
//             //           SizedBox(
//             //             height: 5,
//             //           ),
//             //           Text(
//             //             "Upload Image",
//             //             style: TextStyle(
//             //                 fontWeight: FontWeight.w600, color: Colors.grey),
//             //           )
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//              GestureDetector(
//               onTap: _pickImage, // Add tap event
//               child: DottedBorder(
//                 padding: EdgeInsets.zero,
//                 dashPattern: [7, 5],
//                 borderType: BorderType.RRect,
//                 radius: Radius.circular(15),
//                 color: const Color.fromARGB(255, 54, 54, 54),
//                 strokeWidth: 1.2,
//                 child: Container(
//                   height: 130,
//                   width: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: const Color.fromARGB(255, 240, 239, 239)
//                         .withOpacity(0.5),
//                   ),
//                   child: Center(
//                     child: _selectedImage != null
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.file(
//                               _selectedImage!,
//                               width: 130,
//                               height: 130,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                         : Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset("assets/images/upload.png"),
//                               SizedBox(height: 5),
//                               Text(
//                                 "Upload Image",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.grey),
//                               )
//                             ],
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Category Name",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromARGB(255, 73, 73, 73),
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter Category Name",
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 18),

//                 // Default border when not focused
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     width: 1.2,
//                     color: Color.fromARGB(255, 191, 190, 190)
//                         .withOpacity(0.5), // Custom color
//                   ),
//                 ),

//                 // Border when TextField is focused
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     width: 1.5,
//                     color: Colors
//                         .blue, // Change this to any color you want when focused
//                   ),
//                 ),
//               ),
//             ),
//              SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Sub-Category Name",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromARGB(255, 73, 73, 73),
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter Sub-Category Name",
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 18),

//                 // Default border when not focused
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     width: 1.2,
//                     color: Color.fromARGB(255, 191, 190, 190)
//                         .withOpacity(0.5), // Custom color
//                   ),
//                 ),

//                 // Border when TextField is focused
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     width: 1.5,
//                     color: Colors
//                         .blue, // Change this to any color you want when focused
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Description (Optional)",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromARGB(255, 73, 73, 73),
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               maxLines: 4,
//               decoration: InputDecoration(
//                 hintText: "Enter Category Description",
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 18),

//                 // Default border when not focused
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(color: Color.fromARGB(255, 191, 190, 190).withOpacity(0.5), width: 1.5),
//                 ),

//                 // Border when TextFormField is focused
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                       color: Colors.blue,
//                       width: 2.0), // Change to your preferred color
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32),
//             Row(
//               children: [
//                Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                    Text("Display in Store",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: const Color.fromARGB(255, 73, 73, 73),
//                         fontSize: 20)),
//                         Text("Category will be visible to customers",style: TextStyle(color: Colors.grey),),
//                 ],
//                ),
//                         Spacer(),
//                 Switch(
//                   value: true,
//                   onChanged: (value) {},
//                   activeColor: Colors.blue,
//                 ),
//               ],
//             ),
//             Spacer(),
//             Container(
//               height: 60,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color:  Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   "Add Category",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 22),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,)
//           ],
//         ),
//       ),
//     );
//   }
// }


// // import 'dart:io';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:dotted_border/dotted_border.dart';
// // import 'package:flutter/material.dart';

// // class AddCategory extends StatefulWidget {
// //   const AddCategory({super.key});

// //   @override
// //   State<AddCategory> createState() => _AddCategoryState();
// // }

// // class _AddCategoryState extends State<AddCategory> {
// //   File? _selectedImage;
// //   final ImagePicker _picker = ImagePicker();

// //   // Function to pick image
// //   Future<void> _pickImage() async {
// //     final XFile? pickedImage =
// //         await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedImage != null) {
// //       setState(() {
// //         _selectedImage = File(pickedImage.path);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: GestureDetector(
// //             onTap: () => Navigator.pop(context),
// //             child: Icon(Icons.arrow_back_ios)),
// //         backgroundColor: Colors.white,
// //         surfaceTintColor: Colors.white,
// //         title: Text(
// //           "Add new Category",
// //           style: TextStyle(fontWeight: FontWeight.w600),
// //         ),
// //         centerTitle: true,
// //         actions: [Icon(Icons.more_vert)],
// //         shape: Border.all(
// //             color: const Color.fromARGB(255, 232, 230, 230), width: 0.8),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.symmetric(horizontal: 20),
// //         child: Column(
// //           children: [
// //             SizedBox(height: 40),
// //             GestureDetector(
// //               onTap: _pickImage, // Add tap event
// //               child: DottedBorder(
// //                 padding: EdgeInsets.zero,
// //                 dashPattern: [7, 5],
// //                 borderType: BorderType.RRect,
// //                 radius: Radius.circular(15),
// //                 color: const Color.fromARGB(255, 54, 54, 54),
// //                 strokeWidth: 1.2,
// //                 child: Container(
// //                   height: 130,
// //                   width: 130,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(15),
// //                     color: const Color.fromARGB(255, 240, 239, 239)
// //                         .withOpacity(0.5),
// //                   ),
// //                   child: Center(
// //                     child: _selectedImage != null
// //                         ? ClipRRect(
// //                             borderRadius: BorderRadius.circular(15),
// //                             child: Image.file(
// //                               _selectedImage!,
// //                               width: 130,
// //                               height: 130,
// //                               fit: BoxFit.cover,
// //                             ),
// //                           )
// //                         : Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Image.asset("assets/images/upload.png"),
// //                               SizedBox(height: 5),
// //                               Text(
// //                                 "Upload Image",
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.w600,
// //                                     color: Colors.grey),
// //                               )
// //                             ],
// //                           ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             // Add remaining UI components here...
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supplier_dashboard/screens/supplier/services/claudinary_service.dart';
 // Update path

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _subCategoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _displayInStore = true;

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _handleAddCategory() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image')),
      );
      return;
    }

    final imageUrl = await uploadImageToCloudinaryWithSignature(
      imageFile: _selectedImage!,
    );

    if (imageUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image upload failed')),
      );
      return;
    }

    // Log or submit the data
    print('✅ Image URL: $imageUrl');
    print('📝 Category: ${_categoryController.text}');
    print('📝 Subcategory: ${_subCategoryController.text}');
    print('📝 Description: ${_descriptionController.text}');
    print('🛒 Display in store: $_displayInStore');

    // You can now send this data to your backend
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _subCategoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Add new Category",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        shape: Border.all(
            color: const Color.fromARGB(255, 232, 230, 230), width: 0.8),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: _pickImage,
              child: DottedBorder(
                dashPattern: [7, 5],
                borderType: BorderType.RRect,
                radius: Radius.circular(15),
                color: const Color.fromARGB(255, 54, 54, 54),
                strokeWidth: 1.2,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 240, 239, 239)
                        .withOpacity(0.5),
                  ),
                  child: Center(
                    child: _selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              _selectedImage!,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/upload.png"),
                              SizedBox(height: 5),
                              Text(
                                "Upload Image",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            buildLabel("Category Name"),
            buildTextField(_categoryController, "Enter Category Name"),
            SizedBox(height: 30),
            buildLabel("Sub-Category Name"),
            buildTextField(_subCategoryController, "Enter Sub-Category Name"),
            SizedBox(height: 30),
            buildLabel("Description (Optional)"),
            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: buildInputDecoration("Enter Category Description"),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Display in Store",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 73, 73, 73),
                            fontSize: 20)),
                    Text("Category will be visible to customers",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                Switch(
                  value: _displayInStore,
                  onChanged: (value) {
                    setState(() {
                      _displayInStore = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: _handleAddCategory,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Add Category",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 73, 73, 73),
              fontSize: 20),
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: buildInputDecoration(hint),
    );
  }

  InputDecoration buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            width: 1.2,
            color: Color.fromARGB(255, 191, 190, 190).withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1.5, color: Colors.blue),
      ),
    );
  }
}
