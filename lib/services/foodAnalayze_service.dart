import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class FoodAnalyzeService {
  final Function(bool) changeloding;

  FoodAnalyzeService({required this.changeloding});

  Future<XFile?> pickImage() async {
    final picker = ImagePicker(); // Fixed: added missing variable
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
    ); // Fixed: added await
    return picked;
  }

  Future<String?> uploadImagetoImageBB({
    required String imageBbkey,
    required XFile? imagefile,
  }) async {
    changeloding(true);
    // Null check for imagefile
    if (imagefile == null) {
      debugPrint("No image file provided");
      return null;
    }

    final bytes = await imagefile.readAsBytes();

    final uri = Uri.parse("https://api.imgbb.com/1/upload").replace(
      queryParameters: {"key": imageBbkey, "expiration": 3600.toString()},
    );

    final request = http.MultipartRequest("POST", uri); // Fixed: uppercase POST

    request.files.add(
      http.MultipartFile.fromBytes(
        "image",
        bytes,
        contentType: MediaType(
          "image",
          imagefile.mimeType?.split('/')[1] ?? 'jpeg',
        ),
        filename: imagefile.name,
      ),
    );

    try {
      final streamedResponse = await request.send(); // Fixed: spelling
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data != null && data['success'] == true) {
          // Fixed: added success check
          return data["data"]["url"];
        } else {
          debugPrint(
            "The request succeeded but response data is invalid: ${response.body}",
          );
          return null; // Fixed: added return
        }
      } else {
        debugPrint(
          "Failed to send request to ImageBB Server ${response.statusCode} - ${response.body}",
        );
        return null; // Fixed: added return
      }
    } catch (e) {
      debugPrint("Failed to upload image: $e");
      return null; // Fixed: added return
    }
  }

  Future<Map<String, dynamic>?> analyzeFoodPlate({
    // Fixed: added return type
    required String rapidApiKey,
    required String imageBapiKey,
    String lang = "en",
    int noqueue = 1,
  }) async {
    final imagefile = await pickImage();
    if (imagefile == null) {
      debugPrint("No image selected");
      return null;
    }

    final imageUrl = await uploadImagetoImageBB(
      imageBbkey: imageBapiKey,
      imagefile: imagefile,
    );

    if (imageUrl == null) {
      debugPrint("Image upload failed");
      return null; // Fixed: added return
    }

    final Uri uri =
        Uri.parse(
          "https://ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com/analyzeFoodPlate", // Fixed: corrected endpoint name
        ).replace(
          queryParameters: {
            "imageUrl": imageUrl,
            "lang": lang,
            "noqueue": noqueue.toString(),
          },
        );

    final headers = {
      'X-RapidAPI-Key': rapidApiKey, // Fixed: corrected header name
      'X-RapidAPI-Host':
          'ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      final response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (kDebugMode) {
          debugPrint("Analysis result: $result");
        }
        return result;
      } else {
        debugPrint(
          "API request failed: ${response.statusCode} - ${response.body}",
        );
        return null; // Fixed: added return
      }
    } catch (e) {
      debugPrint("Analysis failed: $e");
      return null; // Fixed: added return
    } finally {
      changeloding(false);
    }
  }
}
