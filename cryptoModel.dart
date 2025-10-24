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
    return CryptoModel(id:coins['id'],symbol:coins['symbol'],name:coins['name'],image:coins['image'],
    current_price:coins['current_price'],market_cap_rank:coins['market_cap_rank'],
    high_24h:coins['high_24h'],low_24h:coins['low_24h'],price_change_24h: coins['price_change_24h'],
    price_change_percentage_24h: coins['price_change_percentage_24h'],ath:coins['ath'],atl: coins['atl']);
  }
}
