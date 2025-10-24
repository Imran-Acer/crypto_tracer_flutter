class CryptoModel{
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? current_price;
  int? market_cap_rank;
  double? high_24h;
  double? low_24h;
  double? price_change_24h;
  double? price_change_percentage_24h;
  double? ath;
  double? atl;

  CryptoModel({this.id,this.symbol,this.name,this.image,this.current_price,
    this.market_cap_rank,this.high_24h,this.low_24h,this.price_change_24h,
    this.price_change_percentage_24h,this.ath,this.atl});

  factory CryptoModel.fromJson(Map<String,dynamic>coins){
    return CryptoModel(
      id:coins['id'],
      symbol:coins['symbol'],
      name:coins['name'],
      image:coins['image'],
      current_price:double.parse(coins['current_price'].toString()),
      market_cap_rank:coins['market_cap_rank'],
      high_24h:double.parse(coins['high_24h'].toString()),
      low_24h:double.parse(coins['low_24h'].toString()),
      price_change_24h: double.parse(coins['price_change_24h'].toString()),
      price_change_percentage_24h: double.parse(coins['price_change_percentage_24h'].toString()),
      ath:double.parse(coins['ath'].toString()),
      atl: double.parse(coins['atl'].toString()));
  }
}

