import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(
                  "images/salad2.png",
                  height: size.height / 2,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Maditerrabeab",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        Text(
                          "Chickpea Salad",
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (num > 1) {
                            setState(() {
                              num = num - 1;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Text(
                      num.toString(),
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            num++;
                            // print("num is ${num}");
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "The Mediterranean Chicken Salad is a vibrant and enticing dish that harmoniously blends the robust flavors of the Mediterranean region with the succulence of chicken. This salad boasts a palate-pleasing combination of hues, textures, and fresh tastes. The recipe typically includes grilled or roasted chicken seasoned with a medley of Mediterranean spices such as oregano, thyme, and a touch of lemon. Complementing the chicken are an array of crisp greens like lettuce or spinach, accompanied by a mix of diced cucumbers, ripe cherry tomatoes, red onions, and colorful bell peppers, offering a refreshing crunch. The addition of Kalamata or black olives infuses a distinct Mediterranean essence while crumbled or cubed feta cheese contributes a creamy and tangy element. Fresh herbs like parsley or mint further brighten the dish. All these ingredients are brought together with a light vinaigrette dressing, featuring olive oil, lemon juice, garlic, and a bouquet of Mediterranean herbs.",
                  style: AppWidget.LightTextFieldStyle(),
                  maxLines: 4,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      "Delivery Time",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.alarm_outlined,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "30 min",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    )
                  ],
                ),
                 SizedBox(
                  height: size.height * 0.10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Total Price\n",
                          style: AppWidget.semiBoldTextFieldStyle()),
                      TextSpan(
                          text: "\$28",
                          style: AppWidget.headerTextFieldStyle()),
                    ])),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: size.width/2.5,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.black87,
                          borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins'),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(color: Colors.grey,
                                borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
           SizedBox(
                  height: size.height * 0.03,
                ),
        ],
      ),
    );
  }
}
