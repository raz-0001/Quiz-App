class QuizQuestion{
  const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffled(){
    final sList=List.of(answers);
    sList.shuffle();
    return sList;
  }
}