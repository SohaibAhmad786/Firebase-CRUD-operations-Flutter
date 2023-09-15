import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_operations/views/home/user_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        centerTitle: true,
        title: const Text(
          "Firebase CRUD",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        elevation: 10,
      ),
      backgroundColor: Colors.deepPurple.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // lets create a database in firestore
                // name of database is users
                var firestore = FirebaseFirestore.instance.collection('users');
                //it will create a collection in firestore named users

                //lets add a document in firestore named my_doc
                var store = firestore.doc('my_doc');
                //it will create a document in firestore named my_doc

                //lets add users details in documents
                store.set({
                  'name': 'Muhammad Sohaib',
                  'email': 'muhammadsohaib030@gmail.com',
                  'age': 23,
                  'contact': '+923060088896',
                  'job_title': 'Flutter Developer'
                });
                //it will add user data in my_doc

                //record save successfully
              },
              child: const Text("Create"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async{
                //its to read data from users collection and document is my_doc
                var firestore =  FirebaseFirestore.instance
                    .collection('users')
                    .doc('my_doc');
                await firestore.get().then((value) {
                  final mp = value.data()!;
                  userModel = UserModel.fromJson(mp);
                });
                print(userModel.name);
                print(userModel.email);
                print(userModel.age);
                print(userModel.jobTitle);
                print(userModel.contact);
              },
              child: const Text(" Read "),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                //lets update the record in firestore now
                var firestore= FirebaseFirestore.instance.collection('users').doc('my_doc');
                firestore.update({
                  "name": "Sohiab Ahmad",
                });
                //it will update my name Muhammad Sohaib to Sohaib Ahmad 
              },
              child: const Text("Update"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                //delete a document in the firestore
                var firestore=FirebaseFirestore.instance.collection('users').doc('my_doc');
                firestore.delete();
                //it will delete the whole documents
                //now its deleted
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
