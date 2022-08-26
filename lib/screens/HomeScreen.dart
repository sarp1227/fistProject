import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user.dart';
import 'screens.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Comments> comments = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/comments');
      setState(() {
        comments =
            response.data.map<Comments>((e) => Comments.fromMap(e)).toList();
      });

      print(comments);
    } catch (e) {
      print(String);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Scaffold(
          backgroundColor: const Color(0xff191720),
          appBar: AppBar(
            title: const Text('Ana Ekran'),
            backgroundColor: const Color(0xff191720),
          ),
          drawer: const NavigationDrawer(),
          body: Container(
            child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(comments[index].name!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      subtitle:Text(comments[index].email!),
                      leading: CircleAvatar(
                        child: Text(
                          comments[index].id.toString(),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      );
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.white54,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('assets/images/logo4.jpg'),
            ),
            SizedBox(height: 12),
            Text(
              'Abdulhamit',
              style: TextStyle(fontSize: 28, color: Colors.black),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Wrap(
        runSpacing: 0,
        children: [
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Hoşgeldiniz Sayfası'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()))),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ayarlar()))),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Çıkış Yap'),
            onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const GirisYap(),
              ),
              (Route<dynamic> route) => false,
            ),
          ),
        ],
      );
}
