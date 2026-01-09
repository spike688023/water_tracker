import 'package:flutter/material.dart';
import '../widgets/common/glass_container.dart';
import '../widgets/home/progress_ring.dart';
import '../../../core/theme/app_theme.dart';
import '../../../providers/water_provider.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/gemma_service.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    NotificationService.init();
    NotificationService.requestPermissions();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to progress to trigger confetti
    final progress = context.select<WaterProvider, double>((p) => p.progress);
    if (progress >= 1.0) {
      _confettiController.play();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppTheme.mainBackgroundGradient,
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Water Tracker",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showSettingsDialog(context),
                        child: const GlassContainer(
                          width: 44,
                          height: 44,
                          padding: EdgeInsets.all(8),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Icon(Icons.settings, color: Colors.white, size: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),
                const ProgressRing(),
                const Spacer(),
                
                GestureDetector(
                  onTap: () {
                    context.read<WaterProvider>().addWater(250);
                  },
                  child: const GlassContainer(
                    width: 70,
                    height: 70,
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    child: Icon(Icons.add, color: Colors.white, size: 32),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GlassContainer(
                    width: double.infinity,
                    child: Consumer<WaterProvider>(
                      builder: (context, provider, _) {
                        return Column(
                          children: [
                            Text(
                              "${provider.currentIntake} ml of ${provider.dailyGoal} ml",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                             Text(
                              "${(provider.currentIntake / 250).floor()} glasses",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          
          // Confetti Overlay
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false, 
            colors: const [Colors.blue, Colors.white, Colors.pink, Colors.orange],
            numberOfParticles: 30,
            gravity: 0.3,
          ),
        ],
      ),
    );
  }
  
  // _showSettingsDialog stays the same... //
  void _showSettingsDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: context.read<WaterProvider>().dailyGoal.toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GlassContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Daily Goal (ml)",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // AI Coach Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.psychology, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          const Text("AI Hydration Coach", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Switch(
                            value: true, 
                            onChanged: (val) {}, 
                            activeColor: Colors.blueAccent,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "✨ Powered by on-device Gemma. No data leaves your phone.",
                        style: TextStyle(color: Colors.white60, fontSize: 10),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () async {
                          final provider = context.read<WaterProvider>();
                          final message = await GemmaService.generateReminder(
                            provider.currentIntake, 
                            provider.dailyGoal
                          );
                          NotificationService.showNotification(
                            "Hydration Coach 💧", 
                            message
                          );
                          if (context.mounted) Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Simulate Reminder Now"),
                      )
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel", style: TextStyle(color: Colors.white70)),
                    ),
                    TextButton(
                      onPressed: () {
                        final newGoal = int.tryParse(controller.text);
                        if (newGoal != null && newGoal > 0) {
                          context.read<WaterProvider>().updateGoal(newGoal);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
