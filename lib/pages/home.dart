import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/widget/widget_support.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceCream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hello bibash", style: AppWidget.boldTextFieldStyle()),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Delicious Food",
                style: AppWidget.headerTextFieldStyle(),
              ),
              Text(
                "Discover your fevourite Food and enjoy",
                style: AppWidget.LightTextFieldStyle(),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  category(
                    img: "images/ice-cream.png",
                    ontap: () {
                      setState(() {
                        iceCream = true;
                        pizza = false;
                        salad = false;
                        burger = false;
                      });
                    },
                    color: iceCream ? Colors.black : Colors.white,
                    iconColor: iceCream ? Colors.white : Colors.black,
                  ),
                  category(
                      img: "images/pizza.png",
                      ontap: () {
                        setState(() {
                          iceCream = false;
                          pizza = true;
                          salad = false;
                          burger = false;
                        });
                      },
                      color: pizza ? Colors.black : Colors.white,
                      iconColor: pizza ? Colors.white : Colors.black),
                  category(
                      img: "images/burger.png",
                      ontap: () {
                        setState(() {
                          iceCream = false;
                          pizza = false;
                          salad = false;
                          burger = true;
                        });
                      },
                      color: burger ? Colors.black : Colors.white,
                      iconColor: burger ? Colors.white : Colors.black),
                  category(
                      img: "images/salad.png",
                      ontap: () {
                        setState(
                          () {
                            iceCream = false;
                            pizza = false;
                            salad = true;
                            burger = false;
                          },
                        );
                      },
                      color: salad ? Colors.black : Colors.white,
                      iconColor: salad ? Colors.white : Colors.black),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(children: [
                  foodieWidget(
                    size: size,
                    img: "images/salad2.png",
                    name: "Veggie Taco Hash",
                    price: 25,
                    shortDetail: "Fresh and healthy",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(),
                          ));
                    },
                  ),
                  foodieWidget(
                    size: size,
                    img: "images/salad4.png",
                    name: "Mix Veg Salad",
                    price: 35,
                    shortDetail: "Spicy with Onion",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(),
                          ));
                    },
                  ),
                  foodieWidget(
                    size: size,
                    img: "images/salad3.png",
                    name: "Veg Mix fruit",
                    price: 25,
                    shortDetail: "Strong and healthy",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(),
                          ));
                    },
                  ),
                  foodieWidget(
                    size: size,
                    img: "images/salad2.png",
                    name: "Taco VeggieHash",
                    price: 25,
                    shortDetail: "Fresh and healthy",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(),
                          ));
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Material(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust border radius for roundness
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        width: size.width * 0.30,
                        child: Image.asset(
                          "images/salad2.png",
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width / 2,
                          child: Text(
                            "Mediterranean Chicken",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                        //           SizedBox(
                        //   height: size.height * 0.00001,
                        // ),
                        SizedBox(
                          width: size.width / 2,
                          child: Text(
                            "Honey got cheese",
                            style: AppWidget.LightTextFieldStyle(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        SizedBox(
                          width: size.width / 2,
                          child: Text(
                            "\$25",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Material(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust border radius for roundness
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        width: size.width * 0.30,
                        child: Image.asset(
                          "images/salad4.png",
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width / 2,
                          child: Text(
                            "Mix Veg Salad and fruits",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                        //           SizedBox(
                        //   height: size.height * 0.00001,
                        // ),
                        SizedBox(
                          width: size.width / 2,
                          child: Text(
                            "Spicy got cheese",
                            style: AppWidget.LightTextFieldStyle(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        SizedBox(
                          width: size.width / 2,
                          child: Text(
                            "\$35",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class foodieWidget extends StatelessWidget {
  const foodieWidget({
    super.key,
    required this.size,
    required this.ontap,
    required this.img,
    required this.name,
    required this.shortDetail,
    required this.price,
  });

  final Size size;
  final Function() ontap;
  final String img;
  final String name;
  final String shortDetail;
  final int price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: size.height * 0.37,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  img,
                  // height: size.height * 0.30,
                  width: size.width * 0.30,
                  fit: BoxFit.fitWidth,
                ),
                // SizedBox(
                //   height: size.height * 0.001,
                // ),
                Text(
                  name,
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Text(
                  shortDetail,
                  style: AppWidget.LightTextFieldStyle(),
                ),
                Spacer(),
                Text(
                  '\$' + price.toString(),
                  style: AppWidget.boldTextFieldStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class category extends StatelessWidget {
  const category({
    super.key,
    required this.img,
    required this.ontap,
    required this.color,
    required this.iconColor,
  });
  final String img;
  final Function() ontap;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(8),
          child: Image.asset(
            img,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
