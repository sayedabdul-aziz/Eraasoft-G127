import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<String?> uploadToCloudinaryAPI(XFile file) async {
  const cloudName = 'your_cloud_name';
  const apiKey = 'your_api_key';
  const apiSecret = 'your_api_secret';

  try {
    // For signed upload (recommended for server-side)
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final params = {
      'timestamp': timestamp,
      'folder': 'your_folder', // optional
      'public_id': 'custom_id_${Random().nextInt(10000)}', // optional
    };

    // Generate signature
    final paramsString = params.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    final stringToSign = '$paramsString$apiSecret';
    final signature = sha256.convert(utf8.encode(stringToSign)).toString();

    // Create multipart request
    final uri = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );
    final request = http.MultipartRequest('POST', uri)
      ..fields.addAll({...params, 'api_key': apiKey, 'signature': signature})
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    // For unsigned upload (simpler but requires upload preset)
    /*
    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', file.path));
    */

    final response = await request.send();
    final responseData = await response.stream.bytesToString();
    final jsonResponse = jsonDecode(responseData);

    if (response.statusCode == 200) {
      return jsonResponse['secure_url'];
    } else {
      print('Upload failed: ${jsonResponse['error']['message']}');
      return null;
    }
  } catch (e) {
    print('Error uploading to Cloudinary: $e');
    return null;
  }
}
