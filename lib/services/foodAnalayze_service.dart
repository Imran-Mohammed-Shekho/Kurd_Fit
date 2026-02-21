import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gym/core/config/app_config.dart';
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
    // Null check for imagefile
    if (imagefile == null) {
      debugPrint("the uploaded image has no data ");
      return null;
    }

    final bytes = await imagefile.readAsBytes();

    final uri = Uri.parse("https://api.imgbb.com/1/upload").replace(
      queryParameters: {"key": imageBbkey, "expiration": 3600.toString()},
    );

    final http.MultipartRequest request = http.MultipartRequest(
      "POST",
      uri,
    ); // Fixed: uppercase POST

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

  Future<Map<String, dynamic>?> _analyzeViaProxy({
    required XFile imagefile,
    String lang = "en",
    int noqueue = 1,
  }) async {
    final uri = Uri.parse(AppConfig.foodAnalysisProxyUrl);
    final request = http.MultipartRequest("POST", uri)
      ..fields["lang"] = lang
      ..fields["noqueue"] = noqueue.toString()
      ..files.add(
        http.MultipartFile.fromBytes(
          "image",
          await imagefile.readAsBytes(),
          contentType: MediaType(
            "image",
            imagefile.mimeType?.split('/')[1] ?? 'jpeg',
          ),
          filename: imagefile.name,
        ),
      );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode != 200) {
      debugPrint(
        "Proxy request failed: ${response.statusCode} - ${response.body}",
      );
      return null;
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> _analyzeDirectly({
    required XFile imagefile,
    String lang = "en",
    int noqueue = 1,
  }) async {
    final imageUrl = await uploadImagetoImageBB(
      imageBbkey: AppConfig.imageBbApiKey,
      imagefile: imagefile,
    );

    if (imageUrl == null) {
      debugPrint("can't create image url");
      return null;
    }

    final Uri uri =
        Uri.parse(
          "https://ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com/analyzeFoodPlate",
        ).replace(
          queryParameters: {
            "imageUrl": imageUrl,
            "lang": lang,
            "noqueue": noqueue.toString(),
          },
        );

    final headers = {
      'X-RapidAPI-Key': AppConfig.rapidApiKey,
      'X-RapidAPI-Host':
          'ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final response = await http.post(uri, headers: headers);
    if (response.statusCode != 200) {
      debugPrint(
        "API request failed: ${response.statusCode} - ${response.body}",
      );
      return null;
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> analyzeFoodPlate({
    String lang = "en",
    int noqueue = 1,
  }) async {
    final imagefile = await pickImage();
    if (imagefile == null) {
      debugPrint("No image selected");
      return null;
    }

    changeloding(true);

    try {
      if (AppConfig.hasFoodAnalysisProxy) {
        final result = await _analyzeViaProxy(
          imagefile: imagefile,
          lang: lang,
          noqueue: noqueue,
        );
        if (kDebugMode && result != null) {
          debugPrint("Analysis result (proxy): $result");
        }
        return result;
      }

      if (AppConfig.allowDirectFoodAnalysis &&
          AppConfig.hasDirectFoodAnalysisKeys) {
        final result = await _analyzeDirectly(
          imagefile: imagefile,
          lang: lang,
          noqueue: noqueue,
        );
        if (kDebugMode && result != null) {
          debugPrint("Analysis result (direct): $result");
        }
        return result;
      }

      if (kDebugMode) {
        debugPrint(
          "Food analysis not configured. Set FOOD_ANALYSIS_PROXY_URL or enable "
          "ALLOW_DIRECT_FOOD_ANALYSIS with RAPID_API_KEY and IMGBB_API_KEY.",
        );
      }
      return null;
    } catch (e) {
      debugPrint("Analysis failed: $e");
      return null; // Fixed: added return
    } finally {
      changeloding(false);
    }
  }
}
