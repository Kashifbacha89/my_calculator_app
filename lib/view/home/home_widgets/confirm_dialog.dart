import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key, required this.onYes, required this.onNo});
  final VoidCallback onYes;
  final VoidCallback onNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(bottom: 7),
      iconPadding: const EdgeInsets.only(bottom: 7, top: 10),
      //alignment: Alignment.Center,
      icon: const Icon(
        Icons.info,
        size: 50,
      ),
      iconColor: const Color.fromRGBO(244, 67, 54, 1),
      title: Text(
        'Are You Sure',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: ElevatedButton(
                onPressed: onYes,
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xff306688))),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Align(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xff306688))),
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        )
      ],
      backgroundColor: Colors.blue[300],
    );
  }
}
