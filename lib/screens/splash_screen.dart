import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>HomePage(),
      ));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets\\images\\logo.png",width: MediaQuery.of(context).size.width/1.5,),
            Text("Property Turkey",style: TextStyle(color: Color.fromARGB(255, 185, 48, 6),fontWeight: FontWeight.bold,fontSize: 42),)
          ],
        ),
      ),
    );
  }
}
