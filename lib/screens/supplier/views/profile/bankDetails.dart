import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplier_dashboard/screens/supplier/providers/auth_provider.dart';

void showBankingForm(BuildContext context) {
  // Create controllers for all input fields
  TextEditingController accountHolderController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();

  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromARGB(255, 239, 238, 238),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(
              "Banking Information",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(height: 15),
            _buildBankFormField("Account Holder Name", Icons.person, accountHolderController),
            SizedBox(height: 18),
            _buildBankFormField("Bank Name", Icons.dashboard, bankNameController),
            SizedBox(height: 18),
            _buildBankFormField("Account Number", Icons.credit_card, accountNumberController),
            SizedBox(height: 18),
            _buildBankFormField("IFSC Code", Icons.key, ifscCodeController),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                // Call update function with controller values
                updateBankDetails(
                  context,
                  accountHolderController.text,
                  bankNameController.text,
                  accountNumberController.text,
                  ifscCodeController.text,
                );

                // Close the bottom sheet
                Navigator.pop(context);
              },
              child: Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}

// Function to update bank details in Provider
void updateBankDetails(
  BuildContext context,
  String accountHolderName,
  String bankName,
  String accountNumber,
  String ifscCode,
) async {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);

  Map<String, dynamic> bankData = {
   
      "bankDetails": {
        "accountHolderName": accountHolderName,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "ifscCode": ifscCode,
      }
    
  };

  // Print the updated data
  print("========== Updated Bank Details ==========");
  print(bankData);
  print("==========================================");

  // Call Provider method to update backend (if needed)
 bool success = await authProvider.addNewSupplierFields(bankData);
      print(success);
}

// Function to build input fields
Widget _buildBankFormField(String hint, IconData icon, TextEditingController controller) {
  return Container(
    height: 50,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, size: 22),
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 13),
      ),
    ),
  );
}
