import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import para SystemUiOverlayStyle

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light, ), 
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); 
          },
           icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black,)
           ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      Text("Login", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold, 
                      ),),
                      SizedBox(height: 20,),
                      Text("Login to your account ", style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),),
                    ],
                  ),
                    Padding(
                      padding: EdgeInsets.symmetric (horizontal: 40), 
                      child: Column(
                        children: <Widget>[
                          makeInput(label: "Email"), 
                          makeInput(label: "Password", obscureText: true), 
                          //makeInput(label: "Confirm Password", obscureText: true), 
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40), 
                      child: Container(
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
                          onPressed: (){}, 
                          color: Colors.redAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
              
                          ),
                          child: Text("Login ", style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18,
                          ),),
                      )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account "), 
                        Text("Sing Up", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18, 
                        ),), 
                      ],
                    ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/2.png'),
                  fit: BoxFit.cover, 
                  ),
              ),
            ),
          ],

        ),
      ),
    );
  }
  Widget makeInput({label, obscureText = false}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15, 
          fontWeight: FontWeight.w400, 
          color: Colors.black87, 
        ),),
        SizedBox(height: 5,), 
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
          ),
        ),
        SizedBox(height: 30,), 
      ],
    );
  }
}
