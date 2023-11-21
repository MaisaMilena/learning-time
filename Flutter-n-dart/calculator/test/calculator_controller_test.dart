import 'package:app_from_docs/src/calc_page.dart';
import 'package:app_from_docs/src/controllers/calculator_controller.dart';
import 'package:app_from_docs/src/widgets/button_hub.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO: find a way to make this work
  group('CalculatorController - operations', () {
    late CalculatorController calculatorController;
    List<Map<String, dynamic>> timelapse = [];
    // final notifyListenerCallback = MockCallbackFunction(); // Your callback function mock

    setUp(() {
      calculatorController = CalculatorController();
      calculatorController.addListener(() {
        timelapse.add(
          {"display": calculatorController.display, "result": calculatorController.result}
        );
      });
    });

    tearDown(() => {
      timelapse = []
    });

    // MARK: -- "C" symbol
    test('on tapping C should clear the display', () {
      calculatorController.display = '0';
      calculatorController.onButtonTap(SymbolAction('C'));
      expect(calculatorController.display, '0');

      calculatorController.display = '5';
      calculatorController.onButtonTap(SymbolAction('C'));
      expect(calculatorController.display, '0');
    });

    test('on tapping C should clear the result', () {
      calculatorController.result = 9;
      calculatorController.onButtonTap(SymbolAction('C'));
      expect(calculatorController.result, 0);

      calculatorController.result = 0;
      calculatorController.onButtonTap(SymbolAction('C'));
      expect(calculatorController.result, 0);
    });

    // MARK: -- "+" symbol
    test('on display a number and tap + should double the display', () {
      calculatorController.onButtonTap(NumberAction('5'));
      calculatorController.onButtonTap(SymbolAction('+'));
      calculatorController.onButtonTap(SymbolAction('='));
      if (timelapse.length == 3) {
        print("Timelapse 3");
        expect(timelapse[2]["display"], '10');
      } else {
        print("Timelapse NOT 3");
      }
    });

    test('on tapping + should execute add operation for two int', () {
      // Start a new operation
      calculatorController.onButtonTap(NumberAction('6'));
      // expect(calculatorController.display, '6');

      calculatorController.onButtonTap(SymbolAction('+'));
      expect(calculatorController.currentSymbolAction!.value, SymbolAction('+').value);
      // expect(calculatorController.display, '6');

      calculatorController.onButtonTap(NumberAction('5'));
      calculatorController.onButtonTap(SymbolAction('='));
      expect(calculatorController.display, '11');
      // calculatorController.addListener(() {
      //   expect(calculatorController.display, '11');
      // });
    });

    test('on tapping + should execute add operation for int + double', () {
      calculatorController.onButtonTap(NumberAction('5'));
      calculatorController.onButtonTap(SymbolAction('+'));
      calculatorController.addListener(() {
        expect(calculatorController.display, '5');
      });

      calculatorController.onButtonTap(NumberAction('.'));
      calculatorController.addListener(() {
        expect(calculatorController.display, '0.');
        expect(calculatorController.result, 5);
      });
    
      calculatorController.onButtonTap(NumberAction('6'));
      calculatorController.addListener(() {
        expect(calculatorController.display, '0.6');
        expect(calculatorController.result, 5);
      });

      calculatorController.onButtonTap(SymbolAction('='));
      calculatorController.addListener(() {
        expect(calculatorController.display, '5.6');
        expect(calculatorController.result, 5.6);
      });
    });

    test('on tapping + should execute add operation for double + double', () {
        var step = 0;

        calculatorController.addListener(() {
          print("Add listener: ${calculatorController.toString()}");
          switch (step) {
            case 0:
              expect(calculatorController.display, '1.8');
              expect(calculatorController.result, 1.8);
              print("Step 0: "+calculatorController.toString());
              step++;
            case 1:
              expect(calculatorController.display, '999.3');
              expect(calculatorController.result, 1.8);
              print("Step 1: "+calculatorController.toString());
              step++;
            case 2:
              expect(calculatorController.display, '1001.1');
              expect(calculatorController.result, 1001.0);
              print("Step 2: "+calculatorController.toString());
          }
        });  
        // Step 0
        calculatorController.display = "1.8";
        calculatorController.onButtonTap(SymbolAction('+'));

        calculatorController.display = "999.3";
        calculatorController.onButtonTap(SymbolAction('='));
    });
  });   
}