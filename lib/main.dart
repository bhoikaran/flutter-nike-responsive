import 'package:flutter/material.dart';
import 'package:nike_responsive/utils.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 120, 115),
              Color.fromARGB(255, 53, 76, 84)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                size: screenAwareSize(20.0, context), color: Colors.white),
            onPressed: () {},
          ),
          title: Text(
            "Air Max 2025",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(18.0, context),
                fontFamily: "Montserrat-Bold"),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20.0, context),
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[ProductScreenTopPart()],
          ),
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  const ProductScreenTopPart({super.key});

  @override
  State<ProductScreenTopPart> createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: 400,
                child: Image.asset(
                  'assets/nike_air_max_90.png',
                  fit: BoxFit.contain,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
