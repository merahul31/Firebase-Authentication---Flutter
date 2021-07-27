import 'dart:convert';
import 'package:http/http.dart' as http;

const urlProduct = 'https://fakestoreapi.com/products';
const urlCategory = 'https://fakestoreapi.com/products/categories';

var decodedData;

List<String> name = [];
List<String> priceData = [];
List<String> imageUrl = [];
List<String> categoryData = [];

class GetData {
  Future getData() async {
    http.Response responsePro = await http.get(urlProduct);
    if (responsePro.statusCode == 200) {
      String data = responsePro.body;
      var decodedData = jsonDecode(data);
      for (int i = 0; i < 20; i++) {
        name.add(decodedData[i]['title']);
        priceData.add(decodedData[i]['price'].toString());
        imageUrl.add(decodedData[i]['image']);
      }
    } else {
      print(responsePro.statusCode);
    }
    http.Response responseCat = await http.get(urlCategory);
    if (responseCat.statusCode == 200) {
      String data = responseCat.body;
      var decodedCatData = jsonDecode(data);
      for (int i = 0; i < 20; i++) {
        categoryData.add(decodedCatData[i]);
      }
    } else {
      print(responseCat.statusCode);
    }
  }
}
