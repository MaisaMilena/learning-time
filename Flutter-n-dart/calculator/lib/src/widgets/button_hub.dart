import 'package:flutter/material.dart';

abstract class ButtonActionType {
  final String value;

  ButtonActionType(this.value);
}

class NumberAction extends ButtonActionType {
  NumberAction(String value) : super(value);
}

class SymbolAction extends ButtonActionType {
  SymbolAction(String value) : super(value);
}

class FinishAction extends ButtonActionType {
  FinishAction(String value) : super(value);
}

// Button Hub
class ButtonHub extends StatelessWidget {
  final void Function(ButtonActionType action) onTap;
  const ButtonHub({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary.withAlpha(40);
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: <Widget>[
        // const CalculatorButton(value: "", backgroundColor: Colors.white),
        CalculatorButton(value: "C", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        CalculatorButton(value: "+/-", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        CalculatorButton(value: "%", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        CalculatorButton(value: "/", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        CalculatorButton(value: "7", onTap: onNumericButtonSelected),
        CalculatorButton(value: "8", onTap: onNumericButtonSelected),
        CalculatorButton(value: "9", onTap: onNumericButtonSelected),
        CalculatorButton(value: "*", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        CalculatorButton(value: "4", onTap: onNumericButtonSelected),
        CalculatorButton(value: "5", onTap: onNumericButtonSelected),
        CalculatorButton(value: "6", onTap: onNumericButtonSelected),
        CalculatorButton(value: "-", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        CalculatorButton(value: "1", onTap: onNumericButtonSelected),
        CalculatorButton(value: "2", onTap: onNumericButtonSelected),
        CalculatorButton(value: "3", onTap: onNumericButtonSelected),
        CalculatorButton(value: "+", backgroundColor: primaryColor, onTap: onSymbolButtonSelected),
        const CalculatorButton(value: "", backgroundColor: Colors.white),
        CalculatorButton(value: "0", onTap: onNumericButtonSelected),
        CalculatorButton(value: ".", backgroundColor: primaryColor, onTap: onNumericButtonSelected),
        CalculatorButton(value: "=", backgroundColor: primaryColor, onTap: onFinishActionSelected),
      ]
    );
  }

  void onNumericButtonSelected(String value) {
    onTap(NumberAction(value));
  }

  void onSymbolButtonSelected(String value) {
     onTap(SymbolAction(value));
  }

  void onFinishActionSelected(String value) {
    onTap(FinishAction(value));
  }
}

class CalculatorButton extends StatelessWidget {
  final String value;
  final Color? backgroundColor;
  final void Function(String value)? onTap;
  const CalculatorButton({super.key, required this.value, this.backgroundColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? Theme.of(context).colorScheme.primary.withAlpha(110);
    return Material(
      color: color,
      child: InkWell(
          onTap: onTap == null ? null : () => onTap!(value),
          child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(value)),
          ),
        )
    );
  }
}
