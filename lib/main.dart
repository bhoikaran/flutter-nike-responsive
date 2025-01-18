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
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 500,
                child: Image.asset(
                  'assets/AIR_MAX_90_SP_bg_remove_3.png',
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
  int currentSizeIndex = 0;
  int currentColorIndex = 0;
  int _counter = 0;

  void _decrease() {
    setState(() {
      if (_counter >0) {
         _counter--;
      }
     
    });
  }

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _expend() {
    setState(() {
      isExpended = !isExpended;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = [];

    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }
    return colorItemList;
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
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(20.0, context),
              right: screenAwareSize(20.0, context),
            ),
            child: Row(children: <Widget>[
              SizedBox(
                  height: screenAwareSize(35, context),
                  child: Row(
                      children: sizeNumList.map((item) {
                    var index = sizeNumList.indexOf(item);
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            currentSizeIndex = index;
                          },
                        );
                      },
                      child: sizeItem(item, index == currentSizeIndex, context),
                    );
                  }).toList())),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  width: screenAwareSize(96, context),
                  height: screenAwareSize(30, context),
                  decoration: BoxDecoration(
                    color: Color(0xff525663),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: SizedBox(
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Montserrat-Bold"),
                                ),
                              ),
                            ),
                          )),
                      devider(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              _counter.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Montserrat-Bold"),
                            ),
                          ),
                        ),
                      ),
                      devider(),
                      Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: SizedBox(
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Montserrat-Bold"),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18, context),
            ),
            child: Text(
              "Select Color",
              style: TextStyle(
                  color: Color(0xff949598),
                  fontSize: screenAwareSize(10, context),
                  fontFamily: "Montserrat-SemiBold"),
            ),
          ),
          SizedBox(
            height: screenAwareSize(7, context),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              left: screenAwareSize(20, context),
            ),
            height: screenAwareSize(34, context),
            child: Row(
              children: colorSelector(),
            ),
          ),
          SizedBox(
            height: screenAwareSize(7, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18, context),
            ),
            child: Text(
              "Price",
              style: TextStyle(
                  color: Color(0xff949598), fontFamily: "Montserrat-SemiBold"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: screenAwareSize(100, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenAwareSize(18, context)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "₹",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(26, context),
                                  fontFamily: "Montserrat-Medium"),
                            ),
                            SizedBox(
                              width: screenAwareSize(2.0, context),
                            ),
                            Text(
                              "15450",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(30, context),
                                  fontFamily: "Montserrat-Medium"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(8, context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: screenAwareSize(18, context)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color.fromARGB(255, 251, 251, 47),
                            padding: EdgeInsets.symmetric(
                              vertical: screenAwareSize(12, context),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Add To Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenAwareSize(12.0, context),
                                    fontFamily: "Montserrat-Bold"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 12.0),
    child: Container(
      width: screenAwareSize(30, context),
      height: screenAwareSize(30, context),
      decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 48, 251, 136)
              : Color(0xff525663),
          borderRadius: BorderRadius.circular(5.2),
          boxShadow: [
            BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(0.5) : Colors.black12,
                offset: Offset(0, 10),
                blurRadius: 10.0),
          ]),
      child: Center(
        child: Text(
          size,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}

Widget colorItem(
    Color color, bool isSelect, BuildContext context, VoidCallback _onTab) {
  return GestureDetector(
    onTap: _onTab,
    child: Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(10, context),
      ),
      child: Container(
        width: screenAwareSize(30, context),
        height: screenAwareSize(30, context),
        decoration: BoxDecoration(
            color: Color.fromARGB(201, 241, 15, 19),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelect
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        blurRadius: 10.0,
                        offset: Offset(0, 10))
                  ]
                : []),
        child: ClipPath(
          clipper: Clipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget devider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
