import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({super.key});

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endDate = DateTime.now();

  final List<SalesData> salesData = [
    SalesData('Vegetables', 8500, 34.6, Colors.indigo),
    SalesData('Fruits', 6300, 25.6, Colors.teal),
    SalesData('Dry Fruits', 5200, 21.2, Colors.orange),
    SalesData('Grains', 4567, 18.6, Colors.purple),
  ];

  // Method to show date range picker
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalSales = salesData.fold(0, (sum, item) => sum + item.amount);
    
    // Format dates for display
    final DateFormat dateFormat = DateFormat('MMM d, yyyy');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Sales Report", 
          style: TextStyle(
            fontWeight: FontWeight.w600, 
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.black),
            onPressed: () {
              // Implement download functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Date Range Selector
              GestureDetector(
                onTap: () => _selectDateRange(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${dateFormat.format(_startDate)} - ${dateFormat.format(_endDate)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(Icons.calendar_month, color: Colors.deepPurple),
                    ],
                  ),
                ),
              ),
              // Rest of the code remains the same as in the previous implementation
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<SalesData, String>(
                          dataSource: salesData,
                          pointColorMapper: (SalesData data, _) => data.color,
                          xValueMapper: (SalesData data, _) => data.category,
                          yValueMapper: (SalesData data, _) => data.percentage,
                          innerRadius: '70%',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Total Sales",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "₹${totalSales.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ...salesData.map((sale) => _buildSalesBreakdownItem(sale)).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement download report functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Download Report",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Previous methods remain the same
  Widget _buildSalesBreakdownItem(SalesData sale) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: sale.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getIconForCategory(sale.category),
              color: sale.color,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.category,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "₹${sale.amount}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "+${sale.percentage.toStringAsFixed(1)}%",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Electronics':
        return Icons.phone_android;
      case 'Clothing':
        return Icons.local_mall;
      case 'Food':
        return Icons.fastfood;
      case 'Accessories':
        return Icons.watch;
      default:
        return Icons.category;
    }
  }
}

class SalesData {
  final String category;
  final double amount;
  final double percentage;
  final Color color;

  SalesData(this.category, this.amount, this.percentage, this.color);
}