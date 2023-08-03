import 'package:http/http.dart' as http;

Future<void> callAPI ()async{
var response = await http.get("https://api.coingecko.com/api/v3/coins/bitcoin");
}