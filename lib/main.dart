import 'package:flutter/material.dart';
import 'package:nike_responsive/data.dart';
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
            "Nike Air Max 90 SP",
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
            children: <Widget>[
              ProductScreenTopPart(),
              ProductScreenBottomPart(),
            ],
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
      height: screenAwareSize(250, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: 500,
                child: Image.asset(
                  'assets/AIR_MAX_90_SP_bg_remove.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 250, right: 35),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(35, context),
                    height: screenAwareSize(35, context),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/360.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(30.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rating",
                  style: TextStyle(
                      color: Color(0xff949598), fontFamily: "Montserrat-Bold"),
                ),
                SizedBox(
                  height: screenAwareSize(8.0, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffffe600),
                    ),
                    SizedBox(
                      height: screenAwareSize(5.0, context),
                    ),
                    Text(
                      "4.2",
                      style: TextStyle(color: Color(0xffffe600)),
                    ),
                    SizedBox(
                      height: screenAwareSize(5.0, context),
                    ),
                    Text(
                      "(3078 people)",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  const ProductScreenBottomPart({super.key});

  @override
  State<ProductScreenBottomPart> createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpended = false;

  void _expend() {
    setState(() {
      isExpended = !isExpended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18, context),
            ),
            child: Text(
              "Product Description",
              style: TextStyle(
                  color: Color(0xff949598),
                  fontSize: screenAwareSize(10, context),
                  fontFamily: "Montserrat-SemiBold"),
            ),
          ),
          SizedBox(
            height: screenAwareSize(7.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26, context),
              right: screenAwareSize(18, context),
            ),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Mediul"),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Mediul"),
              ),
              crossFadeState: isExpended
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26, context),
              right: screenAwareSize(18, context),
            ),
            child: GestureDetector(
              onTap: _expend,
              child: Text(
                isExpended ? "Less" : "more..",
                style: TextStyle(
                    color: Color.fromARGB(255, 156, 251, 47),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(11, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(15, context),
                right: screenAwareSize(75, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size",
                  style: TextStyle(
                      color: Color(0xff949598),
                      fontSize: screenAwareSize(10, context),
                      fontFamily: "Montserrat-SemiBold"),
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                      color: Color(0xff949598),
                      fontSize: screenAwareSize(10, context),
                      fontFamily: "Montserrat-SemiBold"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
