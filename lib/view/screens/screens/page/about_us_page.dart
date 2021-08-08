import 'package:flutter/material.dart';


class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "ニュースふぃーど",style: textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
