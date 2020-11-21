import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Reaction Tests', () {
    final reaction = Reaction("Reaction", "ReactionIcon", 60);
    test('Get Reaction Name', (){
      expect(reaction.name, "Reaction");
    });

    test('Get Reaction Url', (){
      expect(reaction.reactionIcon, "ReactionIcon");
    });

    test('Get Reaction Percentage', (){
      expect(reaction.percentage, 60);
    });
  });
}