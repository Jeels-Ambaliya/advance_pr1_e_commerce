import 'package:advance_pr1_e_commerce/views/screens/laptopList.dart';
import 'package:advance_pr1_e_commerce/views/screens/phoneList.dart';
import 'package:flutter/material.dart';

class Collection_Page extends StatefulWidget {
  const Collection_Page({Key? key}) : super(key: key);

  @override
  State<Collection_Page> createState() => _Collection_PageState();
}

class _Collection_PageState extends State<Collection_Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Phone_Page(),
                ),
              );
            },
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Phone",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 150,
                    width: 100,
                    child: Image.network(
                        "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61IhQqu+M2L._SL1080_.jpg"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Laptops_Page(),
                ),
              );
            },
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Laptop",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 150,
                    width: 100,
                    child: Image.network(
                        "https://images.prismic.io/frameworkmarketplace/46cbf974-cdff-4cd8-b761-8b4a3343f6c4_FW-chromebook-homepage-carousel.png?auto=compress,format"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
