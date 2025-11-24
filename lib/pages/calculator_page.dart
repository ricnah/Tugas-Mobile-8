import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../widgets/calc_button.dart';
import 'about_page.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 106, 72),
        elevation: 0,
        title: const Text(
          "Kalkulator Ric",
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.yellow),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
          )
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            // DISPLAY
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      calc.input,
                      style: const TextStyle(
                        fontSize: 38,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      calc.result,
                      style: const TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // BUTTONS
            _buttons(context),
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _row(['C', 'DEL', '÷', '×'], [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], [
            () => calc.clear(),
            () => calc.delete(),
            () => calc.append('÷'),
            () => calc.append('×'),
          ]),
          _row(['7', '8', '9', '-'], [Colors.white, Colors.white, Colors.white, Colors.yellow], [
            () => calc.append('7'),
            () => calc.append('8'),
            () => calc.append('9'),
            () => calc.append('-'),
          ]),
          _row(['4', '5', '6', '+'], [Colors.white, Colors.white, Colors.white, Colors.yellow], [
            () => calc.append('4'),
            () => calc.append('5'),
            () => calc.append('6'),
            () => calc.append('+'),
          ]),
          _row(['1', '2', '3', '='], [Colors.white, Colors.white, Colors.white, Colors.yellow], [
            () => calc.append('1'),
            () => calc.append('2'),
            () => calc.append('3'),
            () => calc.calculate(),
          ]),
          _row(['0', '.', '(', ')'], [Colors.white, Colors.white, Colors.white, Colors.white], [
            () => calc.append('0'),
            () => calc.append('.'),
            () => calc.append('('),
            () => calc.append(')'),
          ]),
        ],
      ),
    );
  }

  Widget _row(List<String> texts, List<Color> colors, List<VoidCallback> actions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        texts.length,
        (i) => CalcButton(
          text: texts[i],
          color: colors[i],
          onPressed: actions[i],
        ),
      ),
    );
  }
}
