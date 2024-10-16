import 'package:flutter/material.dart';

class OverallEfficiencyPage extends StatelessWidget {
  const OverallEfficiencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overall Efficiency'),
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Task Status Breakdown",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                // Remove the PieChart
                Expanded(
                  child: _buildEfficiencySummary(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Custom summary of efficiency below the chart area
  Widget _buildEfficiencySummary(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      color: Colors.white,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEfficiencyRow(
              context,
              status: 'Completed',
              count: 35,
              color: Colors.green,
            ),
            _buildEfficiencyRow(
              context,
              status: 'Pending',
              count: 25,
              color: Colors.orange,
            ),
            _buildEfficiencyRow(
              context,
              status: 'Ongoing',
              count: 30,
              color: Colors.blue,
            ),
            _buildEfficiencyRow(
              context,
              status: 'Cancelled',
              count: 10,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEfficiencyRow(
    BuildContext context, {
    required String status,
    required int count,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10),
              Text(
                status,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            '$count%',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
