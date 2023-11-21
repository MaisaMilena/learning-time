import 'package:flutter/material.dart';

import '../widgets/button_hub.dart';

class CalculatorController extends ChangeNotifier {
  var display = '0';
  double result = 0.0;
  ButtonActionType? currentSymbolAction;
  bool isStartingNextNumber = false;

  void onButtonTap(ButtonActionType action) {
    switch (action.runtimeType) {
      case NumberAction:
        if ((display == '0' && action.value != '.') || isStartingNextNumber) {
          display = '';
        }
        formatNumberDisplay(action.value);
      case SymbolAction:
        handleSymbolAction(action as SymbolAction);
      case FinishAction:
        handleFinishAction();
      default:
        break;
    }
    notifyListeners();
  }
  
  void formatNumberDisplay(String value) {
    isStartingNextNumber = false;
    if (value == '.' && !display.contains('.')) {
      display += '.';
    } else {
      display += value;
    }
  }

  void handleSymbolAction(SymbolAction action) {
    if (action.value == "C") {
      result = 0;
      display = '0';
      currentSymbolAction = null;
    } else if (action.value == "+/-") {
      var aux = double.parse(display);
      display = (aux * -1).toString();
    } else {
      result = double.parse(display);
      isStartingNextNumber = true;
      currentSymbolAction = action;
    }
  }

  void handleFinishAction() {
    var operation = 0.0;
    switch (currentSymbolAction?.value) {
      case "/":
        operation = result / double.parse(display);
      case "%":
        operation = result % double.parse(display);
      case "*":
        operation = result * double.parse(display);
      case "+":
        operation = result + double.parse(display);
      case "-":
        operation = result - double.parse(display);
      default:
        break;
    }
    result = operation;
    display = roundDisplay(operation);
  }

  String roundDisplay(double result) {
    if (result.isInfinite || result.isNaN ) {
      return '0';
    }
    if (result == result.round()) {
      return result.round().toString();
    } else {
      return result.toString();
    }
  }   

  @override
  String toString() {
    return 'CalculatorController: {result: $result, display: $display, currentSymbolAction: ${currentSymbolAction?.value}}';
  }
}