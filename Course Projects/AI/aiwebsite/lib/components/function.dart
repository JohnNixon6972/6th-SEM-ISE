import 'package:http/http.dart' as http;

Future<String?> sendImage(filepath, url) async {
  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.files
      .add(await http.MultipartFile.fromPath('image', filepath));
  var res = await request.send();
  return res.reasonPhrase;
}
