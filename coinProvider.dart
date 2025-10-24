import 'package:crypto_trackers/model/cryptoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_trackers/services/api.dart';
class CoinProvider extends ChangeNotifier{
  CoinProvider(){
    getCoins();
  }
  bool isLoading=true;
  List<CryptoModel>coins=[];
  getCoins()async{
    List<dynamic>allCoins=await API.fetchCoins();
    List<CryptoModel> temp=[];
    for(var coin in allCoins){
      CryptoModel newCoin=CryptoModel.fromJson(coin);
      temp.add(newCoin);
    }

    coins=temp;
    isLoading=false;
    notifyListeners();
  }
}