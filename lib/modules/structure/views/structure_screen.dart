import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/modules/home/views/home_screen.dart';
import 'package:test/modules/order/views/order_screen.dart';
import 'package:test/modules/profile/views/profile_screen.dart';
import 'package:test/modules/search/views/search_screen.dart';

class StructureScreen extends StatefulWidget {
  const StructureScreen({Key? key}) : super(key: key);

  @override
  State<StructureScreen> createState() => _StructureScreenState();
}

class _StructureScreenState extends State<StructureScreen> {
  int activeIndexScreen = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(),
      bottomNavigationBar: buildBottomNavigatorBar(),
      body: buildContent(),
    );
  }

  PreferredSizeWidget buildHeader() {
    return AppBar(
      toolbarHeight: 92,
      backgroundColor: const Color(0xFF642CA9),
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: const Color(0xFF935DD6),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'images/avatar.png',
                  width: 36,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Olá, Danilo',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset('icons/location.svg'),
                    const SizedBox(width: 5),
                    const Text(
                      'Rua Patrícia, 787 A',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: SvgPicture.asset('icons/menu.svg'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavigatorBar() {
    Color colorSelected = const Color(0xFF642CA9);
    Color colorUnselected = const Color(0xFF848599);

    return Material(
      elevation: 20,
      shadowColor: Colors.black,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: 64,
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'icons/home.svg',
                width: 24,
                color:
                    (activeIndexScreen == 0) ? colorSelected : colorUnselected,
              ),
              onPressed: () {
                setState(() {
                  activeIndexScreen = 0;
                });
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'icons/search.svg',
                width: 24,
                color:
                    (activeIndexScreen == 1) ? colorSelected : colorUnselected,
              ),
              onPressed: () {
                setState(() {
                  activeIndexScreen = 1;
                });
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'icons/order.svg',
                width: 24,
                color:
                    (activeIndexScreen == 2) ? colorSelected : colorUnselected,
              ),
              onPressed: () {
                setState(() {
                  activeIndexScreen = 2;
                });
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'icons/profile.svg',
                width: 24,
                color:
                    (activeIndexScreen == 3) ? colorSelected : colorUnselected,
              ),
              onPressed: () {
                setState(() {
                  activeIndexScreen = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    Widget? content;

    if (activeIndexScreen == 0) {
      content = const HomeScreen();
    } else if (activeIndexScreen == 1) {
      content = const SearchScreen();
    } else if (activeIndexScreen == 2) {
      content = const OrderScreen();
    } else if (activeIndexScreen == 3) {
      content = const ProfileScreen();
    }

    return content!;
  }
}
