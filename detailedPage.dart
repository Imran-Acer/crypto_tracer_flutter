import 'package:crypto_trackers/providers/coinProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cryptoModel.dart';

class DetailedPage extends StatelessWidget{
  int? index;
  DetailedPage(int ref){
    index=ref;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoinProvider>(builder: (context,coinProvider,child){
      CryptoModel newCoin=coinProvider.coins[index!];
      return Scaffold(
        appBar: AppBar(
          title: Text(newCoin.name!),
        ),
        body:ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Card(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(11)),child: Image.network(newCoin.image!,height: 50,width: 50,),),
                      SizedBox(width: 15),
                      Text('# ${newCoin.market_cap_rank} Market Capture Position',style:TextStyle(fontSize:20,fontWeight:FontWeight.w600))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(newCoin.name!,style:TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height:2),
                  Text(newCoin.id!),
                  SizedBox(height: 5),
                  Text('₹ ${newCoin.current_price}'),
                  SizedBox(height: 2),
                  Text('${newCoin.price_change_24h!.toStringAsFixed(3)} '
                      '(${newCoin.price_change_percentage_24h!.toStringAsFixed(3)}%)',
                      style:TextStyle(color:newCoin.price_change_24h!>0?Colors.green:Colors.red))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(15),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Performance',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                SizedBox(height: 10,),
                ListTile(
                  title: Text("Today's Low",style: TextStyle(fontSize: 15),),
                  subtitle: Text('${newCoin.low_24h!}',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Text("Today's High",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                    Text('${newCoin.high_24h!}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  ],)
                ),
                SizedBox(height:10),
                ListTile(
                    title: Text("All Time Low",style: TextStyle(fontSize: 15),),
                      subtitle: Text('${newCoin.atl!}',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("All Time High",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                          Text('${newCoin.ath!}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                        ],)
                )
              ],),
            )
          ],
        )
      );
    },);
  }
}