import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practicas/login.dart';
import 'package:practicas/signup.dart';

void main () {
  runApp(
    MaterialApp(

    debugShowCheckedModeBanner: false, 
    home: HomePage(),
    )
  );
}

class HomePage extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                  children: <Widget>[
                    Text(
                      "Welcome ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                      ),
                      SizedBox(height: 20,), 
                      Text("Lorem ipsum dolor sit amet consectetur adipiscing elit sem dis, non nibh justo quisque egestas at morbi magnis litora", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700], 
                        fontSize: 15, 
                      ),
                      ),
                  ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/1.png')
                    ),
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }, 
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18,
                    ),),
                    
                    ),
                    SizedBox(height: 20,), 
                    Container(
                      padding: EdgeInsets.only(top: 1, left: 1, right: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black), 
                          top: BorderSide(color: Colors.black), 
                          left: BorderSide(color: Colors.black), 
                          right: BorderSide(color: Colors.black)
                        )
                      ),
                        child:   MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                        }, 
                        color:Colors.redAccent ,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),

                        ),
                        child: Text("Sing Up ", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18,
                        ),),
                    
                    )
                    ),
                ],
              )
            ],
          ),
          ),
        ),
      );
  }
}
