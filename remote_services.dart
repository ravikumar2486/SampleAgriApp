import 'package:myfirst/Jsonmodels/Post.dart';
import 'package:http/http.dart' as http;
import 'package:myfirst/Jsonmodels/posts_model.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var Client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await Client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
