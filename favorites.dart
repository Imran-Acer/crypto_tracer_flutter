import 'package:crypto_trackers/pages/detailedPage.dart';
import 'package:crypto_trackers/providers/coinProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget{

  static List<dynamic>favoriteList=[];

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Favorites'),),
      body:Favorite.favoriteList.isEmpty?Center(child: Text('No Crypto in Favorites')):
      Container(
        padding:EdgeInsets.all(10),
        child: Consumer<CoinProvider>(builder:(context,coinProvider,child){
          return ListView.builder(itemCount:Favorite.favoriteList.length,itemBuilder: (context,index){
          dynamic newFavorite=Favorite.favoriteList[index];
          return  ListTile(
              leading: CircleAvatar(backgroundColor: Colors.black,backgroundImage: NetworkImage('${newFavorite.image}'),),
              title:Text(newFavorite.name!),
              subtitle: Text(newFavorite.symbol!.toUpperCase()),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${newFavorite.current_price}',style:TextStyle(color:Colors.blue,fontSize:18,fontWeight: FontWeight.w500)),
                  Text(newFavorite.price_change_24h!.toStringAsFixed(3),style:TextStyle(color:newFavorite.price_change_24h!>0?Colors.green:Colors.red)),

                ],),
            onTap: (){

            },
            onLongPress: (){
                Favorite.favoriteList.removeAt(index);
                setState(() {

                });
            },
          );
        });
        }),
      )
    );
  }
}
