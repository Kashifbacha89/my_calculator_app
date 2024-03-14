
import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/view/home/home_widgets/history.dart';

import 'home_widgets/calculator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AnimateIconController c1;
  @override
  void initState() {
    c1 = AnimateIconController();
    super.initState();
  }

  int pageIndex = 0;
  Widget pageWidget() {
    if (pageIndex == 0) {
      return FadeInRight(
        duration: const Duration(milliseconds: 1500),
        animate: true,
        child: const Calculator(),
      );
    } else {
      return FadeInLeft(
        duration: const Duration(milliseconds: 600),
        animate: true,
        child: const HistoryView(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffCDE4F1),
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title:  Text(
            'My Calculator',
            style: GoogleFonts.poppins(
                color:const Color(0xff053B5D),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff306688),
            ),
            height: MediaQuery.sizeOf(context).height * 0.08,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimateIcons(
                    startIcon: Icons.calculate,
                    endIcon: Icons.calculate,
                    controller: c1,
                    size: pageIndex == 1 ? 25 : 35.0,
                    startIconColor: Colors.white,
                    endIconColor: Colors.white,
                    onEndIconPress: () {
                      setState(() {
                        pageIndex = 0;
                      });
                      return true;
                    },
                    onStartIconPress: () {
                      setState(() {
                        pageIndex = 0;
                      });
                      return true;
                    },
                  ),
                  // const Icon(
                  //     Icons.calculate_outlined,
                  //     color: Colors.white,
                  //     size: 35,
                  //   ),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                  ),
                  AnimateIcons(
                    startIcon: Icons.history,
                    endIcon: Icons.history,
                    controller: c1,
                    size: pageIndex == 0 ? 25 : 35.0,
                    startIconColor: Colors.white,
                    endIconColor: Colors.white,
                    onEndIconPress: () {
                      setState(() {
                        pageIndex = 1;
                      });
                      return true;
                    },
                    onStartIconPress: () {
                      setState(() {
                        pageIndex = 1;
                      });
                      return true;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: FadeInUp(
          duration: const Duration(milliseconds: 1200),
          animate: true,
          child: pageWidget(),
        ),
      ),
    );
  }
}
