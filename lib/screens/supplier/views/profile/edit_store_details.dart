import 'package:flutter/material.dart';

class EditStoreDetails extends StatefulWidget {
  const EditStoreDetails({super.key});

  @override
  State<EditStoreDetails> createState() => _EditStoreDetailsState();
}

class _EditStoreDetailsState extends State<EditStoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Edit Store Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Implement save functionality
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Information Section
              _buildSectionHeader(Icons.business_center_rounded, 'Business Information'),
              const SizedBox(height: 20),
              
              // Business Type
              _buildFieldLabel('Business Type', isRequired: true),
              _buildDropdown('Select business type'),
              const SizedBox(height: 20),
              
              // Business Category
              _buildFieldLabel('Business Category', isRequired: true),
              _buildDropdown('Select category'),
              const SizedBox(height: 20),
              
              // Shop Name
              _buildFieldLabel('Shop Name', isRequired: true),
              _buildTextField('Enter shop name'),
              const SizedBox(height: 32),
              
              // Contact Details Section
              _buildSectionHeader(Icons.phone_rounded, 'Contact Details'),
              const SizedBox(height: 20),
              
              // Contact Number
              _buildFieldLabel('Contact Number', isRequired: true),
              _buildTextField('Enter contact number'),
              const SizedBox(height: 20),
              
              // Location
              _buildFieldLabel('Location', isRequired: true),
              _buildTextField('Enter location'),
              const SizedBox(height: 20),
              
              // GST Number
              _buildFieldLabel('GST Number', isOptional: true),
              _buildTextField('Enter GST number'),
              const SizedBox(height: 20),
              
              // PAN Number
              _buildFieldLabel('PAN Number', isOptional: true),
              _buildTextField('Enter PAN number'),
              const SizedBox(height: 32),
              
              // Address Information Section
              _buildSectionHeader(Icons.location_on_rounded, 'Address Information'),
              const SizedBox(height: 20),
              
              // Street Address
              _buildFieldLabel('Street Address'),
              _buildTextField('Enter street address', maxLines: 2),
              const SizedBox(height: 20),
              
              // City and State
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('City'),
                        _buildTextField('Enter city'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('State'),
                        _buildTextField('Enter state'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Country and Pincode
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Country'),
                        _buildTextField('Enter country'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Pincode'),
                        _buildTextField('Enter pincode'),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Delete Profile Button
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade300),
                  ),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Implement delete functionality
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    label: const Text(
                      'Delete Profile',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade700, size: 22),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFieldLabel(String label, {bool isRequired = false, bool isOptional = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          if (isRequired)
            Text(
              ' *',
              style: TextStyle(
                color: Colors.red.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (isOptional)
            Text(
              ' (Optional)',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
  
  Widget _buildTextField(String hintText, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
  
  Widget _buildDropdown(String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(color: Colors.grey.shade400),
          ),
          items: null,
          onChanged: (value) {},
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade700),
        ),
      ),
    );
  }
}