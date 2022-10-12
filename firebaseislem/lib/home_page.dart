import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme2/input_page.dart';
import 'package:deneme2/show_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String ad, yas, kilo;
  final _adController = TextEditingController();
  final _yasController = TextEditingController();
  final _kiloController = TextEditingController();

  Future signIn() async {
    ad = _adController.text.trim();
    yas = _yasController.text.trim();
    kilo = _kiloController.text.trim();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputPage(
          ad: ad,
          yas: yas,
          kilo: kilo,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _adController.dispose();
    _yasController.dispose();
    _kiloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deneme"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Email TextField
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _adController,
                      cursorColor: Colors.blueAccent.withOpacity(0.5),
                      decoration: const InputDecoration(
                          hintText: "Ad Girin", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _yasController,
                      cursorColor: Colors.blueAccent.withOpacity(0.5),
                      decoration: const InputDecoration(
                          hintText: "Yas Girin", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _kiloController,
                      cursorColor: Colors.blueAccent.withOpacity(0.5),
                      decoration: const InputDecoration(
                          hintText: "Kilo Girin", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 80,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.black]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Başla",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
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
