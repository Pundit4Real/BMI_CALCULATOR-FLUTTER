import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: BMICalculator()));

class BMICalculator extends StatelessWidget {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: weightController, decoration: InputDecoration(labelText: 'Weight (kg)')),
            TextField(controller: heightController, decoration: InputDecoration(labelText: 'Height (m)')),
            ElevatedButton(
              onPressed: () {
                double weight = double.tryParse(weightController.text) ?? 0;
                double height = double.tryParse(heightController.text) ?? 0;
                String result = (weight > 0 && height > 0)
                    ? 'Your BMI: ${(weight / (height * height)).toStringAsFixed(2)}'
                    : 'Enter valid values';
                showDialog(context: context, builder: (_) => AlertDialog(content: Text(result)));
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
