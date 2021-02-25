import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:mockito/mockito.dart';

import 'mock_lecture.dart';

class MockUser extends Mock implements User {
  String name = "user";
  String profilePictureUrl =
      "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg";

  Map<String, List<Lecture>> _lectureLists;

  MockUser() {
    this._lectureLists = {
      'Reading': new List<MockLecture>(),
      'Pending': new List<MockLecture>(),
      'Read': new List<MockLecture>(),
      'Recommended': new List<MockLecture>(),
      'Custom List 1': new List<MockLecture>(),
    };
  }

  addLecture(String list, Lecture lecture) {
    this._lectureLists[list].add(lecture);
  }

  MockUser.withListsContent() {
    this._lectureLists = {
      'Reading': MockLecture.lecturesList,
      'Pending': MockLecture.lecturesList,
      'Read': MockLecture.lecturesList,
      'Recommended': MockLecture.lecturesList,
      'Custom List 1': MockLecture.lecturesList,
    };
  }

  Map<String, List<Lecture>> get lectures => this._lectureLists;

  List<Lecture> getLectureListByName(String listName) {
    if (this._lectureLists.containsKey(listName))
      return this._lectureLists[listName];
    return new List();
  }

  bool isInReadingList(Lecture lecture) {
    return this._lectureLists["Reading"].contains(lecture);
  }

  bool isInPendingList(Lecture lecture) {
    return this._lectureLists["Pending"].contains(lecture);
  }

  /*void increaseChapter(Lecture lecture) {
    //lecture.increaseChapter();
  }*/
}
