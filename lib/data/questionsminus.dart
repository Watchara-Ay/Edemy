import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "What is the answer of 4 - 3 ?",
    {
      "10": false,
      "3": false,
      "7": false,
      "1": true,
    },
  ),
  QuestionModel("What is the answer of 21 - 12 ?", {
    "9": true,
    "12": false,
    "31": false,
    "33": false,
  }),
  QuestionModel("What is the answer of 100 - 59 ?", {
    "111": false,
    "41": true,
    "53": false,
    "159": false,
  }),
  QuestionModel("What is the answer of 6434 - 2111 ?", {
    "547": false,
    "4323": true,
    "5552": false,
    "1111": false,
  }),
];
