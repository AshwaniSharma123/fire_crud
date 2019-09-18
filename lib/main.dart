import 'loginsucces.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _passwordController = TextEditingController();
  final _emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fire Auth',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Builder(
         builder: (context) =>Scaffold(
          appBar: AppBar(
            title: Text('Fire Authentication'),
           ),
           body: SingleChildScrollView(
               child: Container(
                  child: Column(
                   children: <Widget>[
                       SizedBox(height: 40,),
                       Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                        TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius
                          .circular(20.0),
                      ),
                      hintText: 'User Name',
                      labelText: "USER",
                         prefixIcon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                    Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                     controller: _passwordController,
                    cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius
                          .circular(20.0),
                      ),
                      hintText: 'Password',
                      labelText: "PASSWORD",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black87,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                      SizedBox(height: 40.0,),
                      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                        RaisedButton(
                        elevation: 4.0,
                         child: Text('Sign in',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20.0,
                        ),
                      ),
                      splashColor: Colors.pinkAccent,
                      onPressed: () async{
                        try{
                          final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                        )).user;
                        var user1 = _auth.currentUser();
                        user1.then((data){
                          // print("$data");
                          if( data != null && data.uid != null){

                            print(" Email details -----------------  $data");

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Success()),
                            );
                          }
                          else{
                            print('invalid user -----------------  $e');
                          }
                        });
                          // debugPrint("login successfully firebase  ");
                        }
                        catch(e){
                          debugPrint("login failed firebase --------------------  $e");
                        }
                      },
                    ),
                        SizedBox(height: 40,),
                         RaisedButton(
                      elevation: 4.0,
                          child: Text('Register',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                        ),),
                      splashColor: Colors.green,
                      onPressed: () async {

                        debugPrint("email  ${_emailController.text}");
                        debugPrint("password  ${_passwordController.text}");

                        final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                        )).user;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
       ),
      ),
    );
  }
}

