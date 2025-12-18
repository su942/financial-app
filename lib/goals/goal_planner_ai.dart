import '../chat/gemini_service.dart';

class GoalPlannerAI {
  final GeminiService _geminiService = GeminiService();

  Future<String> generatePlan(String amount, String date) async {
    return await _geminiService.generateFinancialPlan("Custom Goal", amount, date);
  }
}
