import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/search_book_or_person.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Genre.dart';


class SearchPage extends StatelessWidget {

  SearchPage();

  @override
  Widget build(BuildContext context) {
    return SearchBookOrPerson(Book.getUserMockBooks(), User.getMockAlterantiveUsers());
  }
}