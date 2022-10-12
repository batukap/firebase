import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowLoginPage extends StatefulWidget {
  const ShowLoginPage({super.key});

  @override
  _ShowLoginPageState createState() => _ShowLoginPageState();
}

class _ShowLoginPageState extends State<ShowLoginPage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final firebaseUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(firebaseUser!.uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text(firebaseUser.uid);
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Text("Adınız: ${data['ad']}");
            }

            return const Text("loading");
          },
        ),
      ),
    );
  }
}
