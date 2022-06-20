import 'package:http/http.dart' as http;

Future<void> sendImage(filepath, url) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
    var res = await request.send();
    print(res);
  } catch (e) {
    print(e);
  }
  // return res.reasonPhrase;
}
