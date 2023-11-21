import 'package:app_from_docs/src/controllers/calculator_controller.dart';
import 'package:app_from_docs/src/widgets/button_hub.dart';
import 'package:app_from_docs/src/widgets/display.dart';
import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  final controller = CalculatorController();
  
  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_listener);
  }
  
  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(flex: 1, child: Display(value: controller.display)),
          Expanded(
            flex: 3, 
            child: 
              ButtonHub(onTap: controller.onButtonTap)
            )
        ],
      ),
    );
  }
}