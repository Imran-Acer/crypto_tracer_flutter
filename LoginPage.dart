import 'package:crypto_trackers/pages/homePage.dart';
import 'package:flutter/material.dart';

class LoginP extends StatelessWidget{
  var mobile=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        height: double.infinity,
        width:double.infinity,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(21),
            height: 450,
            width:300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrange,width:2),
              borderRadius: BorderRadius.circular(11),
              color: Colors.black,
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height:45),
                Text('Log In',style:TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w600)),
                SizedBox(height:18),
                TextField(
                  controller: mobile,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.deepOrange,width: 2),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    labelText: 'Mobile',
                    labelStyle: TextStyle(color:Colors.white,fontSize:12,fontWeight: FontWeight.w600),
                    hintStyle: TextStyle(color:Colors.grey,fontSize:12,fontWeight: FontWeight.w600),
                    hintText: '9987654321',
                  ),
                ),SizedBox(height:18),
                TextField(
                  controller: password,
                  obscuringCharacter: '*',
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.deepOrange,width: 2),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color:Colors.white,fontSize:12,fontWeight: FontWeight.w600),
                    hintStyle: TextStyle(color:Colors.grey,fontSize:12,fontWeight: FontWeight.w600),
                    hintText: 'Pa1#Wo2#',
                  ),
                ),
                SizedBox(height:25),
                ElevatedButton(onPressed: (){
                  if(mobile.text.isNotEmpty && password.text.isNotEmpty){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  }
                },
                  style:ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)) ,
                    child:Text('Login',style:TextStyle(color:Colors.white,fontSize:12,fontWeight: FontWeight.w600),),)
              ]
            )
          ),
        ),
      )
    );
  }
}