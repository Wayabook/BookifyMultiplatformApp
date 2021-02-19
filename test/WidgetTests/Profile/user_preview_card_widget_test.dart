import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/user_preview_card.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import '../../Mocks/mock_user.dart';
import '../../widget_test_functions.dart';

class MockUserProvider extends Mock implements User {}

void main() {
  MockUser user = new MockUser();

  setUp(() {
    SizeConfig().initDefault();
  });

  /***
   *  GenreCard(this.genre,
      {this.addGenreCard = false, this.index = 0, this.onAddGenrePressed});
   * */

  group('User Preview Card Widget Tests', () {
    testWidgets('Normal User Preview Card Widget Test',
        (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        final widget = UserPreviewCard(user);
        await WidgetTestFunctions.pumpWidgetTest(
            tester, widget, UserPreviewCard);

        expect(find.byType(Card), findsOneWidget);
        await tester.ensureVisible(find.byType(Card));

        expect(find.byType(ProfilePicture), findsOneWidget);
        await tester.ensureVisible(find.byType(ProfilePicture));

        expect(find.byType(AutoSizeText), findsOneWidget);
        await tester.ensureVisible(find.byType(AutoSizeText));

        expect(find.byType(SmallButtonUnderlined), findsOneWidget);
        await tester.ensureVisible(find.byType(SmallButtonUnderlined));

        AutoSizeText autoSizeText =
            tester.firstWidget(find.byType(AutoSizeText));
        TextStyle textStyle = autoSizeText.style;

        expect(autoSizeText.data, user.name);
        expect(textStyle.fontWeight, FontWeight.bold);
        expect(textStyle.color, kThirdDarkColor);
        expect(textStyle.fontSize,
            (PADDING_FACTOR_30 * SizeConfig.heightMultiplier));
        expect(autoSizeText.maxLines, UserPreviewCard.DEFAULT_MAX_LINES);
      });
    });

    testWidgets('User Preview Card In Comment Widget Test',
        (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        final widget = UserPreviewCard(
          user,
          card: false,
        );
        await WidgetTestFunctions.pumpWidgetTest(
            tester, widget, UserPreviewCard);

        expect(find.byType(Card), findsNothing);
      });
    });
  });
}

/*Widget userPreviewCardWithProvider(userPreviewCard) {
  return MaterialApp(
    home: ChangeNotifierProvider<User>(
        create: (_) => MockUserProvider(),
        child: Scaffold(
          body: userPreviewCard,
        )),
  );
}*/
