import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopBannerPaymentSecScr extends StatelessWidget {
  const TopBannerPaymentSecScr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(255, 3, 50, 204)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35))),
                          child: const Icon(
                            Icons.done,
                            size: 18,
                            color: Color.fromARGB(255, 3, 43, 204),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12),
                        height: 2,
                        color: const Color.fromARGB(255, 33, 82, 243),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(255, 3, 50, 204)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35))),
                          child: const Icon(
                            Icons.done,
                            size: 18,
                            color: Color.fromARGB(255, 3, 43, 204),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12),
                        height: 2,
                        color: const Color.fromARGB(255, 33, 82, 243),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 3, 50, 204),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(35))),
                            child: const Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 140, 140, 140),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Order Summary",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 140, 140, 140),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Payment",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
