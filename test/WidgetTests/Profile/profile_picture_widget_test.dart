import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import '../../Mocks/mock_user.dart';

void main() {
  MockUser user = new MockUser();

  setUp(() {
    SizeConfig().initDefault();
  });

  group('Profile Picture Widget Tests', () {
    testWidgets('Null Profile Picture Widget Test',
        (WidgetTester tester) async {
      /**ProfilePicture(this.image_url,
                  {this.circleRadius = DEFAULT_RADIUS,
                    this.circleBorderWidth = DEFAULT_BORDER_WIDTH})*/
      final widget = ProfilePicture(null);
      await tester.pumpWidget(widget);
      expect(find.byType(ProfilePicture), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      // Check widget image and visibility
      await tester.pump(const Duration(milliseconds: 3000));
      expect(find.byType(Container), findsOneWidget);
      await tester.ensureVisible(find.byType(Container));

      DecoratedBox decoratedBox = tester.firstWidget(find.byType(DecoratedBox));
      Padding padding = decoratedBox.child;
      DecoratedBox db = padding.child;
      ShapeDecoration shapeDecoration = db.decoration;
      DecorationImage decorationImage = shapeDecoration.image;
      AssetImage assetImage = decorationImage.image;
      expect(assetImage.assetName, ProfilePicture.DEFAULT_ASSET_IMAGE);
    });

    testWidgets('Network Profile Picture Widget Test',
        (WidgetTester tester) async {
      /**ProfilePicture(this.image_url,
              {this.circleRadius = DEFAULT_RADIUS,
              this.circleBorderWidth = DEFAULT_BORDER_WIDTH})*/

      provideMockedNetworkImages(() async {
        /// Now we can pump NetworkImages without crashing our tests. Yay!
        final widget = ProfilePicture(
            "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg");
        await tester.pumpWidget(widget);
        expect(find.byType(ProfilePicture), findsOneWidget);
        await tester.ensureVisible(find.byWidget(widget));

        // Check widget image and visibility
        await tester.pump(const Duration(milliseconds: 3000));
        expect(find.byType(Container), findsOneWidget);
        await tester.ensureVisible(find.byType(Container));

        DecoratedBox decoratedBox =
            tester.firstWidget(find.byType(DecoratedBox));
        Padding padding = decoratedBox.child;
        DecoratedBox db = padding.child;
        ShapeDecoration shapeDecoration = db.decoration;
        DecorationImage decorationImage = shapeDecoration.image;
        NetworkImage assetImage = decorationImage.image;
        expect(assetImage.url, user.profilePictureUrl);

        /// No crashes.
      });
    });
  });
}
