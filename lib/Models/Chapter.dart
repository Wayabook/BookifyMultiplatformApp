
import 'Reaction.dart';

class Chapter{

  int number;
  String name;
  List<Reaction> _reactions;

  List<Reaction> reactions() {
    if(this._reactions == null){
      this._reactions = new List();
      this._reactions.add(new Reaction("ANGRY", "images/angry.png", 60));
      this._reactions.add(new Reaction("SCARED", "images/scared.png", 60));
      this._reactions.add(new Reaction("SAD", "images/unhappy.png", 60));
      this._reactions.add(new Reaction("CONFUSED", "images/confused.png", 60));

      this._reactions.add(new Reaction("BORED", "images/bored.png", 60));
      this._reactions.add(new Reaction("SURPRISED", "images/surprised.png", 60));
      this._reactions.add(new Reaction("HAPPY", "images/happy.png", 60));
      this._reactions.add(new Reaction("EXCITED", "images/excited.png", 60));

    }
    return this._reactions;
  }
}