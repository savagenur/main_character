import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:main_character/app/dimension/design_dimension.dart';
import 'package:main_character/core/extension/build_context_extension.dart';
import 'package:main_character/core/widgets/adaptive_cached_network_img.dart';
import 'package:main_character/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );
  late int _second;
  bool _isStart = false;
  
  @override
  void initState() {
    _second = 20;
    _stopWatchTimer.setPresetSecondTime(_second);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(text: "Home"),
      body: _isStart
          ? buildTimer()
          : Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () async {
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                            height: 200,
                            width: MediaQuery.sizeOf(context).width * .9,
                            child: PrimaryAnimatedText()),
                      );
                    },
                  );
                  setState(() {
                    _isStart = true;
                  });
                  Future.delayed(
                    Duration(
                      seconds: 1,
                    ),
                    () {
                      _stopWatchTimer.onStartTimer();
                    },
                  );
                },
                child: Lottie.asset("assets/lottie/go.json",
                    width: MediaQuery.sizeOf(context).width * .7),
              ),
            ),
    );
  }

  StreamBuilder<int> buildTimer() {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.secondTime,
      initialData: _second,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final int value = snapshot.data ?? 0;
        print(value);
        if (value == 0) {
          // Show "0" first, then reset the timer
          Future.delayed(Duration(seconds: 1), () {
            _stopWatchTimer
                .onResetTimer(); // Reset the timer after displaying 0
            setState(() {
              _isStart = false;
            });
          });
        }
        return Center(
          child: GestureDetector(
            onTap: () {
              _stopWatchTimer.onStartTimer();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    width: 300,
                    child: Lottie.asset("assets/lottie/circle.json",
                        fit: BoxFit.contain)),
                Text(
                  "$value",
                  style: context.textTheme.displayLarge!.copyWith(
                    color: context.colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTimerText(int value, BuildContext context) {
    print(value);

    return AnimatedTextKit(
        isRepeatingAnimation: false,
        repeatForever: false,
        totalRepeatCount: value,
        animatedTexts: [
          FadeAnimatedText(value.toString(),
              textStyle: context.textTheme.displayLarge,
              duration: Duration(seconds: 1)
              // fadeInEnd: 0,
              // fadeOutBegin: 4,
              ),
        ]);
  }
}

class PrimaryAnimatedText extends StatefulWidget {
  const PrimaryAnimatedText({
    super.key,
  });

  @override
  State<PrimaryAnimatedText> createState() => _PrimaryAnimatedTextState();
}

class _PrimaryAnimatedTextState extends State<PrimaryAnimatedText> {
  bool isImage = true;
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              if (mounted) {
                setState(() {
                  isImage = false;
                });
              }
            },
          );
        }
      },
    );
    return Center(
      child: isImage
          ? Lottie.asset("assets/lottie/rocket.json")
          : AnimatedTextKit(
              onFinished: () => Navigator.pop(context),
              pause: Duration(milliseconds: 300),
              isRepeatingAnimation: false,
              animatedTexts: [
                ScaleAnimatedText(
                  "Are you ready\nto SMASH IT?",
                  duration: Duration(seconds: 1, milliseconds: 500),
                  textAlign: TextAlign.center,
                  scalingFactor: .7,
                  textStyle: context.textTheme.displaySmall,
                ),
                ScaleAnimatedText(
                  "then LET'S GO!!!",
                  duration: Duration(seconds: 1, milliseconds: 500),
                  textAlign: TextAlign.center,
                  scalingFactor: .7,
                  textStyle: context.textTheme.displayMedium,
                ),
              ],
            ),
    );
  }
}
