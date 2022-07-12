import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "What is the answer of 4 + 3 ?",
    {
      "10": false,
      "3": false,
      "7": true,
      "500": false,
    },
  ),
  QuestionModel("What is the answer of 21 + 12 ?", {
    "24": false,
    "12": false,
    "31": false,
    "33": true,
  }),
  QuestionModel("What is the answer of 100 + 59 ?", {
    "241": false,
    "159": true,
    "24": false,
    "59": false,
  }),
  QuestionModel("What is the answer of 6434 + 2111 ?", {
    "4215": false,
    "9453": false,
    "8545": true,
    "6372": false,
  }),
  // QuestionModel("What is Mars's nickname ?", {
  //   "The red planet": true,
  //   "The dusty planet": false,
  //   "The hot planet": false,
  //   "The smelly planet": false,
  // }),
  // QuestionModel("About How long would it take to travel to Mars ?", {
  //   "Three days": false,
  //   "A month": false,
  //   "Eight months": true,
  //   "Two years": false,
  // }),
  // QuestionModel(
  //     "Mars is Named after the Roman god Mars. What is he the god of ?", {
  //   "Fire": false,
  //   "Love": false,
  //   "Agriculture": false,
  //   "War": true,
  // }),
  // QuestionModel("Mars Is the ___ planet from the sun ?", {
  //   "Secon": false,
  //   "Third": false,
  //   "Fourth": true,
  //   "Sixth": false,
  // }),
  // QuestionModel(
  //     "Where did Orville and Wilbur Wright build their first flying airplane ?",
  //     {
  //       "Paris, France": false,
  //       "Boston, Massachusetts": false,
  //       "Kitty Hawk, North Carolina": true,
  //       "Tokyou, Japan": false,
  //     }),
  // QuestionModel(
  //     "The First astronuts to travel to space came from which country ?", {
  //   "United States": false,
  //   "Soviet Union (now Russia)": true,
  //   "China": false,
  //   "Rocketonia": false,
  // }),
];
