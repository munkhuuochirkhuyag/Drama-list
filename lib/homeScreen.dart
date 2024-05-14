import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 251, 209, 255),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40, right: 220),
            child: Container(
              height: 80,
              width: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/home7.png"))),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: ExactAssetImage("assets/images/home1.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 20),
                    //   child: SizedBox(
                    //     child: Container(
                    //       height: 100,
                    //       width: 300,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: Colors.blue),
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/home6.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/home5.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/home6.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/home4.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/home2.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage("assets/images/home3.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
