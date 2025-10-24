import 'package:crypto_trackers/pages/LoginPage.dart';
import 'package:crypto_trackers/providers/coinProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(CryptoTracker());
}

class CryptoTracker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<CoinProvider>(create:(context) => CoinProvider(),)
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Crypto Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:LoginP(),
    ),
    );
  }
}
