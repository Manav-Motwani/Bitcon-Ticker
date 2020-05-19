import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = '23465dab08a846c96e1feba09e4d0716';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
//Future<Dynamic>
  Future getData(String currency) async{

  String url = 'https://api.nomics.com/v1/currencies/ticker?key=$apiKey&ids=BTC,ETH,LTC&interval=1h&convert=$currency';
  http.Response response = await http.get(url);
  if(response.statusCode==200){
    String data = response.body;
    return jsonDecode(data);
    }
  else{
    print(response.statusCode);
    }
  }
}
