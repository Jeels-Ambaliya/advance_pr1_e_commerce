import 'package:advance_pr1_e_commerce/views/screens/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/helpers/api_helper.dart';

class Laptops_Page extends StatefulWidget {
  const Laptops_Page({Key? key}) : super(key: key);

  @override
  State<Laptops_Page> createState() => _Laptops_PageState();
}

class _Laptops_PageState extends State<Laptops_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "LAPTOP",
          style: GoogleFonts.signika(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: ApiHelper.apiHelper.getProduct(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text("${snapShot.error}");
            } else if (snapShot.hasData) {
              Map? P = snapShot.data;
              return ListView.builder(
                itemCount: 30,
                itemBuilder: (context, i) {
                  return (P!['products'][i]['category'] == 'laptops')
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 5,
                            right: 5,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Info(
                                    Pic1: P['products'][i]['images'][0],
                                    Pic2: P['products'][i]['images'][1],
                                    Pic3: P['products'][i]['images'][2],
                                    Company: P['products'][i]['brand'],
                                    Price: P['products'][i]['price'],
                                    Rate: P['products'][i]['rating'],
                                    TitleP: P['products'][i]['title'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${P!['products'][i]["images"][0]}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${P['products'][i]['title']}",
                                          style: GoogleFonts.oswald(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${P['products'][i]['category']}",
                                          style: GoogleFonts.cormorant(
                                            textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "     ${P['products'][i]['price']} ₹",
                                      style: GoogleFonts.oswald(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container();
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
