import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deneme"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          
          Expanded(
            
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              final users = snapshot.data?.docs;
              if (users == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (users.isEmpty) {
                return const Center(
                  child: Text("Kullanıcı Bulunamadı"),
                );
              }
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index].data();
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(user['ad']),
                            //Text(user['kilo']),
                            //Text(user['yas']),
                            //Text(user['boy']),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
