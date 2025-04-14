import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  String? _selectedCategory;
  String _selectedUnit = 'kg';
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  
  // List of available units and categories for dropdown
  final List<String> _units = ['kg', 'g', 'lb', 'ltr', 'Pieces', 'box'];
  final List<String> _categories = ['Vegetables', 'Fruits', 'Dairy', 'Meat', 'Bakery', 'Beverages', 'Snacks'];
  
  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _selectImages() async {
    try {
      final List<XFile> selectedImages = await _picker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        if (_images.length + selectedImages.length > 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You can upload maximum 5 images')),
          );
          
          // Only add images up to the max limit
          final int remainingSlots = 5 - _images.length;
          if (remainingSlots > 0) {
            setState(() {
              _images.addAll(
                selectedImages.take(remainingSlots).map((image) => File(image.path)).toList()
              );
            });
          }
        } else {
          setState(() {
            _images.addAll(selectedImages.map((image) => File(image.path)).toList());
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting images: $e')),
      );
    }
  }
  
  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }
  
  void _saveAsDraft() {
    // Implement save as draft functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product saved as draft')),
    );
  }
  
  void _submitProduct() {
    if (_formKey.currentState!.validate()) {
      // Implement product submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product submitted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        centerTitle: true,
        shape: Border.all(color: Colors.grey),
        backgroundColor: Colors.white,
         surfaceTintColor: Colors.white,
        title: const Text("Add New Product",style: TextStyle(fontWeight: FontWeight.w600),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Upload Section
              Container(
            
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                      color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: _selectImages,
                      child: DottedBorder(
                        dashPattern: [5, 3], 
                          borderType: BorderType.RRect,
  radius: Radius.circular(12),
                           color: const Color.fromARGB(255, 99, 99, 99),
    strokeWidth: 0.8,
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            // border: Border.all(style: BorderStyle.solid, color: Colors.grey),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                              SizedBox(height: 8),
                              Text(
                                'Upload Product Images',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Max 5 images',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    if (_images.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              _images.length, 
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: FileImage(_images[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () => _removeImage(index),
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.close, size: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Product Name Field
              const Text(
                'Product Name*',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter product name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product name is required';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 24),
              
              // Category Dropdown
              const Text(
                'Category*',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  hintText: 'Select category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Category is required';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 24),
              
              // Price and Unit Row
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price per unit*',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixText: '₹',
                            hintText: '0.00',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Price is required';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Enter a valid price';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Unit*',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _selectedUnit,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          items: _units.map((String unit) {
                            return DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedUnit = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Stock Quantity Field
              const Text(
                'Stock Quantity*',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter available quantity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stock quantity is required';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Enter a valid quantity';
                  }
                  return null;
                },
              ),
              if (_stockController.text.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Stock quantity is required',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              
              const SizedBox(height: 24),
              
              // Product Description
              const Text(
                'Product Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Describe your product',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _saveAsDraft,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Save as Draft'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitProduct,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}