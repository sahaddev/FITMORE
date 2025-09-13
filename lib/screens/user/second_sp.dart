import 'package:e_commerce/Widgets/bottom_navigator.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/splash_content.dart';
import 'package:e_commerce/application/core/const/const_values.dart';
import 'package:e_commerce/application/features/auth/getx/auth_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondSp extends StatefulWidget {
  const SecondSp({super.key});

  @override
  State<SecondSp> createState() => _SecondSpState();
}

class _SecondSpState extends State<SecondSp> {
  int crrentpage = 0;

  @override
  Widget build(BuildContext context) {
    final authGet = Get.put(AuthGet());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        crrentpage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => Splashcontent(
                        text: splashData[index]['text'],
                        image: splashData[index]["image"]),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) =>
                             authGet.buildDot(index: index, crrentpage: crrentpage),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Button(
                text: 'Continue',
                onPressedCallback: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => const BottomNavigator(),
                  ));
                },
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}
