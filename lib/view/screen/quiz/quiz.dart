import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_pro/core/constant/color.dart';
import 'package:uni_pro/view/widget/Quiz/question.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Quiz Time',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),),
                ), ),
              CustomQuestion(
                answer1: '2',
                answer2: '4',
                answer3: '5',
                question: 'Choose number',
                questionIndex: 0,
              ),
              CustomQuestion(
                answer1: '10',
                answer2: '8kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkvcxsdertyyyyyyyyyyyyyyyyyyyyyyywwwwwwwwwxcvvvvvvvvvv',
                answer3: '6',
                question: 'Choose number',
                questionIndex: 1,
              ),
              CustomQuestion(
                answer1: '2',
                answer2: '4',
                answer3: '5',
                question: 'Choose number',
                questionIndex: 0,
              ),
              CustomQuestion(
                answer1: '2',
                answer2: '4',
                answer3: '5',
                question: 'Choose number',
                questionIndex: 0,
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Container(
              width: Get.width / 3,
              height: Get.width / 3,
              child: CircularCountDownTimer(
                duration: 70,
                initialDuration: 1,
                controller: CountDownController(),
                width: Get.width / 3,
                height: Get.width / 3,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: AppColor.violetColor,
                fillGradient: null,
                backgroundColor: AppColor.primaryColor,
                backgroundGradient: null,
                strokeWidth: 7.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  
                  print('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  print('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inSeconds == 0) {
                    return "THE END";
                  } else {
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
