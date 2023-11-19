import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/widget/contetModel.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class onBoard extends StatefulWidget {
  const onBoard({super.key});

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: MediaQuery.of(context).size.height / 1.7,
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.fill,
                      ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      Text(
                        contents[i].title,
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        contents[i].description,
                        style: AppWidget.LightTextFieldStyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            // color: Colors.red,
            margin: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          buildNextButton(context), // Include the next button here
          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }

  SizedBox buildNextButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
       height: MediaQuery.of(context).size.height/17,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red

        ),
        onPressed: () {
          if (currentIndex==contents.length-1) {


            Navigator.push(context, MaterialPageRoute(builder: (context) => const login(),));
            
          }
          _controller.nextPage(duration: const Duration(milliseconds: 100),
           curve: Curves.bounceIn);
        },
        child: Text(
         currentIndex==contents.length-1?  "Start":"Next",
          style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,
          
          ),
        ),
      ),
    );
  }
}
