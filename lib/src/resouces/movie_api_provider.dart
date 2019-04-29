import '../models/item_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'dart:async';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '482e17010727d3d635d6c362000bf564';

  Future<ItemModel> fetchMovieList() async{
    print('enter');
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if(response.statusCode == 200){
      //If the call to the server is successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      //If that call was not successful, throw an error.
      throw Exception('Filed to load post');
    }
  }

}