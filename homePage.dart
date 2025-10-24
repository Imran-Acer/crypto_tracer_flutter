import 'package:crypto_trackers/model/cryptoModel.dart';
import 'package:crypto_trackers/providers/coinProvider.dart';
import 'package:crypto_trackers/pages/detailedPage.dart';
import 'package:crypto_trackers/pages/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Crypto')),
      body:SafeArea(
        child:Consumer<CoinProvider>(builder:(context,coinProvider,child){
          if(coinProvider.isLoading==true){
            return Center(child:CircularProgressIndicator());
          }
          else{
            return ListView.builder(itemCount:coinProvider.coins.length,itemBuilder:(context,index){
              CryptoModel newCoin=coinProvider.coins[index];
              return Card(
                elevation: 5,
                shadowColor: Colors.green,
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.black,backgroundImage: NetworkImage('${newCoin.image}'),),
                  title:Text(newCoin.name!),
                  subtitle: Text(newCoin.symbol!.toUpperCase()),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Text('${newCoin.current_price}',style:TextStyle(color:Colors.blue,fontSize:18,fontWeight: FontWeight.w500)),
                    Text(newCoin.price_change_24h!.toStringAsFixed(3),style:TextStyle(color:newCoin.price_change_24h!>0?Colors.green:Colors.red)),

                  ],),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>DetailedPage(index)));
                  },
                  onLongPress: (){
                    if(Favorite.favoriteList.contains(coinProvider.coins[index]) ){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating, // popup style
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          content: Center(
                            child: Text('Already in Favorites!',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                    else {
                      Favorite.favoriteList.add(coinProvider.coins[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating, // popup style
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          content: Center(
                                child: Text(
                                  'Crypto Added to Favorites!',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                          duration: Duration(seconds: 2),
                        ),
                      );;
                    }
                  },
                ),
              );

            });
          }
        })
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
       Navigator.push(context,MaterialPageRoute(builder:(context)=>Favorite()));
      }, child:Column(mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Icon(Icons.arrow_forward),
        Text('Goto Favorites',style:TextStyle(fontSize: 8))
      ],) ,),
    );
  }
}