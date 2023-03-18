import 'package:advance_pr1_e_commerce/views/screens/cart.dart';
import 'package:advance_pr1_e_commerce/views/screens/collection.dart';
import 'package:advance_pr1_e_commerce/views/screens/favourite_page.dart';
import 'package:advance_pr1_e_commerce/views/screens/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const E_Commerce(),
  );
}

class E_Commerce extends StatefulWidget {
  const E_Commerce({Key? key}) : super(key: key);

  @override
  State<E_Commerce> createState() => _E_CommerceState();
}

class _E_CommerceState extends State<E_Commerce> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text(
                "E - COMMERCE",
                style: GoogleFonts.signika(),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Favourite_Page(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Cart_Page(),
                      ),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.cart_fill,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
              bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "HOME"),
                  Tab(icon: Icon(Icons.collections), text: "COLLECTION")
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Home_Page(),
                Collection_Page(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
