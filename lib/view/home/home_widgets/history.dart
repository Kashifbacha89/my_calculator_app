import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/calculator_model.dart';
import 'confirm_dialog.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
//Delete Single Card Confirmation
  deleteConfirmation() {
    showDialog(
        context: context,
        builder: (ctx) {
          return ConfirmDialog(onYes: () {
            context.read<CalProvider>().clearHistory();
            Navigator.of(context).pop();
          }, onNo: () {
            Navigator.of(context).pop();
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalProvider>(
      builder: (context, value, child) {
        return SafeArea(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'History',
                      style: GoogleFonts.merriweather(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff306688)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      value.ansList.isEmpty
                          ? const Text('')
                          : ElevatedButton(
                          onPressed: () {
                            deleteConfirmation();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.withOpacity(0.9),
                            //     backgroundColor:
                            //         MaterialStatePropertyAll(Colors.blue[300])),
                          ),
                          child: const Text(
                            'Clear History',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
                value.ansList.isEmpty
                    ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Calculations Yet',
                      style:
                      TextStyle(color: Color(0xff306688), fontSize: 21),
                    ),
                  ],
                )
                    : Expanded(
                  child: ListView.builder(
                      itemCount: value.queList.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff306688)
                                    .withOpacity(0.9),
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              trailing: const Icon(
                                Icons.copy,
                                color: Colors.white,
                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  value.queList[index],
                                  style: GoogleFonts.sansita(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  value.ansList[index],
                                  style: GoogleFonts.sansita(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ));
      },
    );
  }
}
