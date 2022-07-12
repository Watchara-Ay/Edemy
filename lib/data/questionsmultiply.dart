import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "What is the answer of 4 * 3 ?",
    {
      "4": false,
      "12": true,
      "3": false,
      "1": false,
    },
  ),
  QuestionModel("What is the answer of 21 * 12 ?", {
    "21": false,
    "12": false,
    "31": false,
    "252": true,
  }),
  QuestionModel("What is the answer of 100 * 59 ?", {
    "111": false,
    "41": false,
    "590": true,
    "159": false,
  }),
  QuestionModel("What is the answer of 6434 * 2111 ?", {
    "13,582,174": true,
    "43,231,414": false,
    "14,256,192": false,
    "26,452": false,
  }),
];
