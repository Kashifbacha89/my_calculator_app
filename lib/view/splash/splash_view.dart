import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/view/home/home_view.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height*0.4,
                width: width*.75,
                child: Image.asset('assets/images/splash_image.png'),
              ),
              const SizedBox(height: 5,),
              Text('Need Assistance',style: GoogleFonts.lobster(
                fontWeight: FontWeight.w800,
                fontSize: 35,
                letterSpacing: 2.5,
                color: const Color(0xff306688),
              ),),
              const SizedBox(
                height: 20,
              ),
              Text('By Engr. Muhammad Kashif',
                style: GoogleFonts.ibmPlexMono(
                    color: const Color(0xff306688),
                    fontWeight: FontWeight.w400,
                    fontSize: 20),),
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Color(0xff306688))),
                  child: Text(
                    'Lets Calculate!',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )

            ],
          ),
        ),


      ),
    );
  }
}
