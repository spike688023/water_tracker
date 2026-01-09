import 'dart:math';

class GemmaService {
  // Simulates the on-device AI model response time
  static Future<String> generateReminder(int current, int goal) async {
    // Simulate processing delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Calculate context
    final double percentage = (current / goal) * 100;
    
    // Select a response based on "Context" - mimicking AI logic
    if (percentage < 20) {
      return _getRandom([
        "Hey! 🌵 Just starting? Let's hydrate before you dry out!",
        "Morning starter! A glass of water now sets the mood for the day. 💧",
        "Your body needs fuel! Grab a glass and let's get moving."
      ]);
    } else if (percentage < 50) {
      return _getRandom([
        "Keep it going! You're almost halfway there. 🌊",
        "Don't lose momentum! A quick sip now keeps the headache away.",
        "Hydration check! 💧 You've had ${current}ml, let's aim for more!"
      ]);
    } else if (percentage < 80) {
      return _getRandom([
        "You're doing great! Just a bit more to hit your goal. 🚀",
        "Fantastic progress! Keep sipping to stay sharp.",
        "Almost there! Your body thanks you for the ${current}ml so far!"
      ]);
    } else {
      return _getRandom([
        "So close to the finish line! One last glass? 🏆",
        "You're a hydration hero today! 🎉 Finish strong!",
        "Just a few drops left to hit your goal. You got this!"
      ]);
    }
  }

  static String _getRandom(List<String> options) {
    return options[Random().nextInt(options.length)];
  }
}
