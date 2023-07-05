import 'package:flutter/material.dart';

import 'package:food_app/models/model_class.dart';
import 'package:food_app/models/db_connection.dart';
import 'package:food_app/widgets/account_screens/account.dart';
import 'package:food_app/widgets/dashboard_screens/appbars.dart';
import 'package:food_app/widgets/booking_screens/booking_history.dart';
import 'package:food_app/widgets/dashboard_screens/main_menu_body.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int pageIndex = 0;
  final pages = [
    const MainMenuBody(),
    const BookingHistory(),
    const Account(),
  ];

  final appBar = [
    Appbars.mainAppBar(),
    Appbars.bookingAppbar(),
    Appbars.accountAppBar(),
  ];

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff32B768),
                ),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff32B768),
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    if (createAccount == false || name == "") {
      DbConnection.checkName();
    }
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        appBar: appBar[pageIndex],
        body: pages[pageIndex],
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Material buildMyNavBar(BuildContext context) {
    return Material(
      elevation: 20.0,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_rounded,
                      color: Color(0xff32B768),
                      size: 34,
                    )
                  : const Icon(
                      Icons.home_rounded,
                      color: Color(0xff4B5563),
                      size: 30,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.list_alt,
                      color: Color(0xff32B768),
                      size: 34,
                    )
                  : const Icon(
                      Icons.list_alt_rounded,
                      color: Color(0xff4B5563),
                      size: 30,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.person,
                      color: Color(0xff32B768),
                      size: 34,
                    )
                  : const Icon(
                      Icons.person,
                      color: Color(0xff4B5563),
                      size: 30,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
