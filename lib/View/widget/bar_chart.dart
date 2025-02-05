import 'package:dbumms_app/View/widget/custom_text.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  final List<double> values = [0.7, 0.90, 0.8, 0.3, 0.5, 0.9, 0.2];
  final List<String> days = ["Today", "T", "W", "T", "F", "S", "S"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(values.length, (index) {
            return Column(
              children: [
                Container(
                  height: 140,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: values[index],
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Customtext(
                  text: days[index],
                  color: Colors.lightBlueAccent,
                  weight: FontWeight.w400,
                  size: 15,
                ),
                //View All work Orders

              ],
            );
          }),
        ),
      ],
    );
  }
}
