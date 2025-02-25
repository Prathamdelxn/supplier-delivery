import 'package:flutter/material.dart';

class DocumentsList extends StatefulWidget {
  const DocumentsList({super.key});

  @override
  State<DocumentsList> createState() => _DocumentsListState();
}

class _DocumentsListState extends State<DocumentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF2F8FAFF),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _buildSectionTitle("Pending Documents"),
                  // _buildDocumentTile("Personal Documents"),
                  // _buildDocumentTile("Shop Details"),
                  // _buildDocumentTile("Bank Account Details"),
                  // _buildDocumentTile("Emergency Details"),
                  SizedBox(height: 20),
                  // _buildSectionTitle("Completed Documents"),
                  // _buildDocumentTile("Personal Information", isCompleted: true),
                  Spacer(),
                  // _buildSubmitButton(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
