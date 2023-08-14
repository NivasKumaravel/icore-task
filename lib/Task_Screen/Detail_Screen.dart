import 'package:flutter/material.dart';

import '../utilits/colors & textstyle.dart';

class PostDetailsScreen extends StatelessWidget {
  final dynamic post;

  PostDetailsScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: AppBar(title: Center(child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Text("Detail Screen",style:TabT ,),
      )),backgroundColor: white2,),
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text(post['title'], style: TitleT),
            SizedBox(height: 15),
            Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                  child: Text(post['body'],style: BodyT,),
                )),
          ],
        ),
      ),
    );
  }
}
