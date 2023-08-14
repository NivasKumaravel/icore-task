import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utilits/colors & textstyle.dart';
import 'Detail_Screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> posts = [];
  bool isLoading = false;

  // FETCH API LIST
  Future<void> fetchPosts() async {
    setState(() {
      isLoading = true;
    });

    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load posts');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Center(child: Text('Home Screen',style: TabT,))),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: fetchPosts,
        child: _mainBody(),
      ),
    );
  }

  //MAIN BODY
  Widget _mainBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: ListTile(
                title: _titleText(posts[index]["title"]),
                subtitle: _BodyText(posts[index]['body']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PostDetailsScreen(post: posts[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  //TITLE TEXT
  Widget _titleText(String text) {
    return Text(
      text,
      style: TitleT,
    );
  }

  //BODY TEXT
  Widget _BodyText(String BodyText) {
    return Text(BodyText,
        style: BodyT);
  }
}

