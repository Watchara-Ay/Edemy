import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "What is the answer of 4 / 4 ?",
    {
      "8": false,
      "12": false,
      "0": false,
      "1": true,
    },
  ),
  QuestionModel("What is the answer of 68 / 2 ?", {
    "66": false,
    "70": false,
    "34": true,
    "136": false,
  }),
  QuestionModel("What is the answer of 100 / 20 ?", {
    "80": false,
    "2000": false,
    "5": true,
    "120": false,
  }),
  QuestionModel("What is the answer of 6420 / 3 ?", {
    "19,260": false,
    "6,417": false,
    "6,423": false,
    "2,140": true,
  }),
];
