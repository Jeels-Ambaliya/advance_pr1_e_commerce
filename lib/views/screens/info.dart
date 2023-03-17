import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/globals/favourite.dart';
import '../../models/globals/globals.dart';

class Info extends StatefulWidget {
  String? pic1;
  String? pic2;
  String? pic3;
  int? price;
  String? company;
  String? title;
  double? rate;

  Info({
    required String Pic1,
    required String Pic2,
    required String Pic3,
    required String Company,
    required int Price,
    required double Rate,
    required String TitleP,
  }) {
    pic1 = Pic1;
    pic2 = Pic2;
    pic3 = Pic3;
    price = Price;
    rate = Rate;
    company = Company;
    title = TitleP;
  }

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double item = 01;
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isTapped = !isTapped;

                  if (isTapped) {
                    double queprice = widget.price! * item;
                    Fav fav = Fav(
                      pic1: widget.pic1,
                      title: widget.title,
                      company: widget.company,
                      price: widget.price,
                    );
                    setState(() {
                      Globals.myFav.add(fav);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Item Favourite"),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    print(
                        "====================================================");
                    print("$fav");
                    print(
                        "====================================================");
                  } else {
                    // Globals.myFav.remove();
                  }
                });
              },
              child: Icon(
                (isTapped) ? Icons.favorite : Icons.favorite_border,
                color: (isTapped) ? Colors.pink : Colors.white,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'cart');
              },
              child: const Icon(
                Icons.shopping_bag,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
                width: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 480,
                          width: 380,
                          child: Image.network(
                            "${widget.pic1}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 480,
                          width: 400,
                          child: Image.network(
                            "${widget.pic2}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 480,
                          width: 400,
                          child: Image.network(
                            "${widget.pic3}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " ${widget.company}",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.price} ₹",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " ${widget.rate} ⭐",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        (item <= 1) ? item == 1 : item--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      item.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        item++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "MATERIALS",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 30,
                      ),
                      child: Text(
                        "Nylon was first produced in 1935. Nylon is a thermoplastic silky material. It became famous when used in women's stockings nylons in 1940. It was intended to be a synthetic replacement for silk and substituted for it in many different products after silk became scarce during World War II.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Text(
                      "WASH INSTRUCTION",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 30,
                      ),
                      child: Text(
                        "Instead of buying new socks every time you run out of clean ones, you may want to learn how to wash your clothes. Knowing how to wash your clothes is an important life skill--particularly because otherwise your clothes might start to smell, or you could run up a real tab buying new socks each week. Follow these steps and you'll be washing (and drying) wiz in no time.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: GestureDetector(
      //   onTap: () {
      //     double queprice = widget.price! * item;
      //     Cart cart = Cart(
      //       pic1: widget.pic1,
      //       companyName: widget.company,
      //       price: widget.price,
      //       quePrice: queprice,
      //       quentity: item,
      //     );
      //     setState(() {
      //       Globals.addToCart.add(cart);
      //     });
      //
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text("Item Added"),
      //         backgroundColor: Colors.green,
      //         behavior: SnackBarBehavior.floating,
      //       ),
      //     );
      //   },
      //   child: Container(
      //     height: 60,
      //     width: 155,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: Colors.black,
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     child: const Text(
      //       "ADD TO BAG",
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontWeight: FontWeight.w700,
      //         fontSize: 18,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
  // void favouriteTapped
}
