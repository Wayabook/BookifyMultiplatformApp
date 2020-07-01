import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter/material.dart';

class User {

  String _uid;
  String _name;
  String _description_sentence;
  List<Genre> _interested_genres;
  String _profile_picture_url;
  Map<String, List<Book>> _book_lists;
  int _books_read;
  int _chapters_read;
  int _pages_read;
  List<User> _friends;
  /*List<User> _followers;
  List<User> _following;*/

  List<Book> get bookshelf {
    List<Book> books = new List();
    for(String key in _book_lists.keys){
      for(Book book in _book_lists[key]){
        if(!books.contains(book)){
          books.add(book);
        }
      }
    }
    return books;
  }

  List<User> get friends => this._friends;
  set friends(List<User> friends) {
    _friends = friends;
  }

  /*List<User> get following => this._following;
  set following(List<User> followers) {
    _following = followers;
  }*/

  int get pagesRead => _pages_read;

  set pagesRead(int pagesRead) {
    _pages_read = pagesRead;
  }

  int get chaptersRead => _chapters_read;

  set chaptersRead(int chaptersRead) {
    _chapters_read = chaptersRead;
  }

  int get booksRead => _books_read;

  set booksRead(int booksRead) {
    _books_read = booksRead;
  }

  List<Genre> get interestedGenres => _interested_genres;

  set interestedGenres(List<Genre> interestedGenres) {
    _interested_genres = interestedGenres;
  }

  String get descriptionSentence => _description_sentence;

  set descriptionSentence(String descriptionSentence) {
    _description_sentence = descriptionSentence;
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get profilePictureUrl => _profile_picture_url;

  set profilePictureUrl(String profile_picture_url) {
    _profile_picture_url = profile_picture_url;
  }

  Map<String, List<Book>> get bookLists => _book_lists;

  set bookLists(Map<String, List<Book>> book_lists) {
    _book_lists = book_lists;
  }

  User(
      this._uid,
      this._name,
      this._description_sentence,
      this._interested_genres,
      this._book_lists,
      this._books_read,
      this._chapters_read,
      this._pages_read,
      this._profile_picture_url
      );

  User.withBookLists(this._book_lists);
  User.withProfilePicture(this._profile_picture_url);
  User.withNameAndProfilePicture(this._name, this._profile_picture_url);


}