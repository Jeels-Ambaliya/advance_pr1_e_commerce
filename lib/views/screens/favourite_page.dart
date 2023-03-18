import 'package:advance_pr1_e_commerce/models/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/helpers/api_helper.dart';
import 'info.dart';

class Favourite_Page extends StatefulWidget {
  const Favourite_Page({Key? key}) : super(key: key);

  @override
  State<Favourite_Page> createState() => _Favourite_PageState();
}

class _Favourite_PageState extends State<Favourite_Page> {
  Future<List<String>?> getList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("sf_fav");
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("FAVOURITE"),
          centerTitle: true,
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
        body: (FavouriteHandler.myFav.isEmpty)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.grey.shade500,
                      size: 250,
                    ),
                    const Text(
                      "You have no Item yet.",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    )
                  ],
                ),
              )
            : FutureBuilder(
                future: ApiHelper.apiHelper.getProduct(),
                builder: (context, snapShot) {
                  if (snapShot.hasError) {
                    return Text("${snapShot.error}");
                  } else if (snapShot.hasData) {
                    Map? P = snapShot.data;
                    return ListView.builder(
                      itemCount: FavouriteHandler.myFav.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 16,
                            right: 16,
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
                                    Id: P['products'][i]['id'],
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
                                    flex: 3,
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
                                    flex: 5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${FavouriteHandler.myFav[i].title}",
                                          style: GoogleFonts.oswald(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${FavouriteHandler.myFav[i].company}",
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
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "${FavouriteHandler.myFav[i].price} ₹",
                                              style: GoogleFonts.oswald(
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  FavouriteHandler.myFav
                                                      .removeAt(i);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                          Text("Item Deleted"),
                                                      backgroundColor:
                                                          Colors.red,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                    ),
                                                  );
                                                });
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: Icon(Icons.delete),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
      );
    });
  }
}
