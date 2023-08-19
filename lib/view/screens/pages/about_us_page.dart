import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //TODO
        body: Container(
            child: Center(child: Text("AboutUs"))
        ),
      ),
    );
  }
}

