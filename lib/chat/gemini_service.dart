import 'package:google_generative_ai/google_generative_ai.dart';
import '../core/utils/constants.dart';

class GeminiService {
  late GenerativeModel _model;
  late ChatSession _chat;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: Constants.geminiApiKey,
    );
    _chat = _model.startChat();
  }

  /// Sends a message to the chat session and returns the response.
  Future<String> sendMessage(String message) async {
    try {
      final response = await _chat.sendMessage(Content.text(message));
      return response.text ?? "I couldn't process that response.";
    } catch (e) {
      return "Error: Unable to connect to AI service. Please check your internet.";
    }
  }

  /// Generates a specific financial plan based on inputs.
  Future<String> generateFinancialPlan(String goal, String amount, String date) async {
    final prompt = """
    Act as a financial advisor. Create a concise plan to save \$$amount for a '$goal' by $date.
    Provide 3 actionable steps.
    """;
    
    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? "Unable to generate plan.";
    } catch (e) {
      return "Error generating plan: $e";
    }
  }
}
