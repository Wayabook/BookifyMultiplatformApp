import 'package:bookifyapp/Models/Lecture.dart';
import 'package:mockito/mockito.dart';

class MockLecture extends Mock implements Lecture {
  static List<MockLecture> lecturesList = [
    new MockLecture(),
    new MockLecture()
  ];

  bool read;
  int currentChapter = 0;
  MockLecture({this.read = false});

  bool get finished => read;

  set finished(bool finished) => read;
}
