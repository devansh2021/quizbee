import 'question.dart';

class Questbrain {
  int _qno = 0;
  List<Question> _qnbank = [
    Question('One infected person infects about 2.5 other people.', true),
    Question(
        'Patients with COVID-19 can take anti-inflammatory medicine like ibuprofen, aspirin or naproxen.',
        true),
    Question(
        'During a shelter-in-place order, my kids can be with other kids in small groups.',
        false),
    Question(
        'Anyone with COVID-19 symptoms, regardless of their overall health, should seek testing.',
        false),
    Question('Healthy people should practice social distancing.', true),
    Question(
        'Once infected with the coronavirus, it can take 2 to 14 days to show symptoms.',
        true),
    Question(
        'Hand sanitizer doesn’t kill coronavirus because it’s antibacterial, not antiviral.',
        false),
    Question(
        'If you can hold your breath for 10 seconds, you don’t have COVID-19.',
        false),
  ];
  void nextquestion() {
    if (_qno < _qnbank.length - 1) _qno++;
  }

  int totalques() {
    return _qnbank.length;
  }

  bool isFinished() {
    if (_qno >= _qnbank.length - 1)
      return true;
    else
      return false;
  }

  void reset() {
    _qno = 0;
  }

  String getquestiontext() {
    return _qnbank[_qno].questext;
  }

  bool getquesans() {
    return _qnbank[_qno].quesans;
  }
}
