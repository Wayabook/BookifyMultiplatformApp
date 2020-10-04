class Reaction {
  String name;
  String image;
  int percentage;

  Reaction(this.name, this.image, this.percentage);

  static List<Reaction> getMockReactions(){
    List<Reaction> reactions = new List();

    reactions.add(new Reaction("ANGRY", "images/angry.png", 60));
    reactions.add(new Reaction("SCARED", "images/scared.png", 60));
    reactions.add(new Reaction("SAD", "images/unhappy.png", 60));
    reactions.add(new Reaction("CONFUSED", "images/confused.png", 60));

    reactions.add(new Reaction("BORED", "images/bored.png", 60));
    reactions.add(new Reaction("SURPRISED", "images/surprised.png", 60));
    reactions.add(new Reaction("HAPPY", "images/happy.png", 60));
    reactions.add(new Reaction("EXCITED", "images/excited.png", 60));

    return reactions;
  }
}