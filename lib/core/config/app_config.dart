class AppConfig {
  const AppConfig._();

  // Preferred: call your own backend endpoint and keep provider keys server-side.
  static const String foodAnalysisProxyUrl = String.fromEnvironment(
    'FOOD_ANALYSIS_PROXY_URL',
  );

  // Temporary fallback only for local development.
  static const bool allowDirectFoodAnalysis = bool.fromEnvironment(
    'ALLOW_DIRECT_FOOD_ANALYSIS',
    defaultValue: false,
  );
  static const String rapidApiKey = String.fromEnvironment('RAPID_API_KEY');
  static const String imageBbApiKey = String.fromEnvironment('IMGBB_API_KEY');

  static bool get hasFoodAnalysisProxy => foodAnalysisProxyUrl.isNotEmpty;
  static bool get hasDirectFoodAnalysisKeys =>
      rapidApiKey.isNotEmpty && imageBbApiKey.isNotEmpty;
  static bool get canAnalyzeFood =>
      hasFoodAnalysisProxy ||
      (allowDirectFoodAnalysis && hasDirectFoodAnalysisKeys);
}
