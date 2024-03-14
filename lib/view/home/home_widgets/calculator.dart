import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/view/home/home_widgets/calculator_buttons.dart';

import 'package:provider/provider.dart';

import '../../models/calculator_model.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  operatorColor1(String op) {
    if (op == 'e' || op == '%' || op == 'sin' || op == 'clx') {
      return true;
    }
    return false;
  }

  operatorRadius1(String op) {
    if (op == 'e' || op == '%' || op == 'sin' || op == 'clx') {
      return true;
    }
    return false;
  }

  operatorColor2(String op) {
    if (op == '/' || op == 'x' || op == '-' || op == '+') {
      return true;
    }
    return false;
  }

  Color buttonColor(int index) {
    if (operatorColor1(buttonText[index])) {
      return const Color(0xff306688);
    } else if (operatorColor2(buttonText[index])) {
      return const Color(0xffF0A632);
    } else if (index == buttonText.length - 1) {
      return const Color(0xff27CF55);
    } else if (index == 4) {
      return const Color(0xffF1686B);
    } else if (index == 22) {
      return Colors.brown;
    } else {
      return const Color(0xff4AA3F2);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var width = (size.width) / 4;
    var height = (size.height) / 9;
    return Consumer<CalProvider>(builder: (context, value, child) {
      return SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xff000000)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            value.userQ,
                            style: GoogleFonts.sansita(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff306688)),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            value.userA,
                            style: GoogleFonts.sansita(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff306688)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: GridView.count(
                    childAspectRatio: width / height,
                    crossAxisCount: 4,
                    children: List.generate(24, (index) {
                      if (index == 4) {
                        return CalculatorButtons(
                            onTapped: () {
                              value.clearPressed();
                            },
                            radius:
                            operatorRadius1(buttonText[index]) ? 30 : 16,
                            buttonText: buttonText[index],
                            buttonColor: buttonColor(index),
                            buttonTextColor: Colors.white);
                      } else if (index == 22) {
                        return CalculatorButtons(
                            onTapped: () {
                              value.delPressed();
                            },
                            radius:
                            operatorRadius1(buttonText[index]) ? 30 : 16,
                            buttonText: buttonText[index],
                            buttonColor: buttonColor(index),
                            buttonTextColor: Colors.white);
                      } else if (index == buttonText.length - 1) {
                        return CalculatorButtons(
                            onTapped: () {
                              value.equal();
                              value.addAnswer();
                              value.addQuestion();
                            },
                            radius:
                            operatorRadius1(buttonText[index]) ? 30 : 16,
                            buttonText: buttonText[index],
                            buttonColor: buttonColor(index),
                            buttonTextColor: Colors.white);
                      } else {
                        return CalculatorButtons(
                            onTapped: () {
                              value.userInput(index);
                            },
                            radius:
                            operatorRadius1(buttonText[index]) ? 30 : 16,
                            buttonText: buttonText[index],
                            buttonColor: buttonColor(index),
                            buttonTextColor: Colors.white);
                      }
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
