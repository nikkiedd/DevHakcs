import 'package:flutter/material.dart';

import 'FirstScreen.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}
class _OnboardingState extends State<OnboardingPage>{
  int currentPageValue = 0;
  int previousPageValue = 0;
  PageController controller;

  final List<Widget> introWidgetsList = <Widget>[
    FirstScreen(),
    SecondScreen(),
    ThirdScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Container(
        color: Color(0xFFE9423A),
        child: (
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Container(
                  height: 500,
                  decoration: BoxDecoration(color: Colors.white ),),
                PageView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: introWidgetsList.length,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  controller: controller,
                  itemBuilder: (context, index) {
                    return introWidgetsList[index];
                  },
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < introWidgetsList.length; i++)
                            if (i == currentPageValue) ...[circleBar(true)] else
                              circleBar(false),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: currentPageValue == introWidgetsList.length - 1
                      ? true
                      : false,
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      margin: EdgeInsets.only(right: 16, bottom: 40),
                      child: FloatingActionButton(
                        onPressed: () {
                        },
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(26))),
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                ),
                GestureDetector(child:Container(child:Text("Skip", style: TextStyle(color: Color(0xFF2699FB)), ) , padding: EdgeInsets.only(bottom: 20),) ,)
              ],
            )
        ),
      ),
    ) ,);
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Color(0xFFE9423A) : Color(0xFF6D6D6D),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

}