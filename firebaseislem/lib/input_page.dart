import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme2/show_login_page.dart';
import 'package:deneme2/show_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final String? ad, yas, kilo;
  const InputPage(
      {super.key, required this.ad, required this.yas, required this.kilo});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String? ad, kilo, yas, boy;

  @override
  void initState() {
    ad = widget.ad;
    kilo = widget.kilo;
    yas = widget.yas;
    super.initState();
  }

  final _boyController = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    final firebaseUser = FirebaseAuth.instance.currentUser;
    boy = _boyController.text.trim();

    FirebaseFirestore.instance.collection("users").doc(firebaseUser!.uid).set({
      'id': firebaseUser.uid,
      'ad': ad,
      'yas': yas,
      'kilo': kilo,
      'boy': boy
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ShowLoginPage(),
      ),
    );
  }

  @override
  void dispose() {
    _boyController.dispose();
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
                      controller: _boyController,
                      cursorColor: Colors.blueAccent.withOpacity(0.5),
                      decoration: const InputDecoration(
                          hintText: "Boy Giriniz", border: InputBorder.none),
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
