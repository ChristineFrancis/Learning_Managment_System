import 'package:get/get.dart';

abstract class QuizController extends GetxController {
  void onValChanged(int questionIndex, String? val);
  String? getSelectedValue(int questionIndex);
}

class QuizControllerImp extends QuizController {
  final RxList<String?> selectedAnswers = <String?>[].obs;

  @override
  void onInit() {
    // Initialize the list with the number of questions.
    // Assuming you know the number of questions at the start.
    // Adjust the length based on your requirement or initialization logic.
    selectedAnswers.addAll(List<String?>.filled(10, null)); // For 10 questions example.
    super.onInit();
  }

  @override
  void onValChanged(int questionIndex, String? val) {
    selectedAnswers[questionIndex] = val;
    for(int i=0 ; i<2 ; i++){ print(selectedAnswers[i]);}
    update();
  }

  @override
  String? getSelectedValue(int questionIndex) {
    
    return selectedAnswers[questionIndex];
  }
}