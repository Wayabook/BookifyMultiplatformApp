import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter/material.dart';

class User {
  String _uid;
  String _name;
  String _description_sentence;
  List<Genre> _interested_genres;
  Map<String, List<Book>> _book_lists;

  Map<String, List<Book>> get bookLists => _book_lists;

  set author(Map<String, List<Book>> book_lists) {
    _book_lists = book_lists;
  }

  User(this._uid, this._name, this._description_sentence, this._interested_genres, this._book_lists);
  User.withBookLists(this._book_lists);


}