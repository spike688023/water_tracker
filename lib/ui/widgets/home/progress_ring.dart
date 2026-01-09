import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/water_provider.dart';
import '../common/glass_container.dart';

class ProgressRing extends StatelessWidget {
  final double size;

  const ProgressRing({super.key, this.size = 250});

  @override
  Widget build(BuildContext context) {
    return Selector<WaterProvider, double>(
      selector: (context, provider) => provider.progress,
      builder: (context, progress, child) {
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Glass Ring
              GlassContainer(
                width: size,
                height: size,
                borderRadius: BorderRadius.circular(size / 2),
                child: const SizedBox(),
              ),
              
              // Animated Fill
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progress),
                duration: const Duration(seconds: 1, milliseconds: 500),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return SizedBox(
                    width: size - 20,
                    height: size - 20,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 20,
                      backgroundColor: Colors.transparent,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent, // Use a nice blue color
                      ),
                      strokeCap: StrokeCap.round,
                    ),
                  );
                },
              ),

              // Central Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(progress * 100).toInt()}%",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                   Text(
                    "Hydrated",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
