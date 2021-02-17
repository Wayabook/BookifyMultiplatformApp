import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import '../../Mocks/mock_user.dart';
import '../../widget_test_functions.dart';

void main() {
  MockUser user = new MockUser();

  setUp(() {
    SizeConfig().initDefault();
  });

  group('Profile Picture Widget Tests', () {
    testWidgets('Null Profile Picture Widget Test',
        (WidgetTester tester) async {
      final widget = ProfilePicture(null);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, ProfilePicture);

      // Check widget image and visibility
      await WidgetTestFunctions.checkImageAndVisibilityTest(tester, Container);

      AssetImage assetImage = _checkStructureAndGetImage(tester);
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
        await WidgetTestFunctions.pumpWidgetTest(
            tester, widget, ProfilePicture);

        // Check widget image and visibility
        await WidgetTestFunctions.checkImageAndVisibilityTest(
            tester, Container);

        NetworkImage assetImage = _checkStructureAndGetImage(tester);
        expect(assetImage.url, user.profilePictureUrl);

        /// No crashes.
      });
    });
  });
}

_checkStructureAndGetImage(tester) {
  DecoratedBox decoratedBox = tester.firstWidget(find.byType(DecoratedBox));
  Padding padding = decoratedBox.child;
  DecoratedBox db = padding.child;
  ShapeDecoration shapeDecoration = db.decoration;
  DecorationImage decorationImage = shapeDecoration.image;
  return decorationImage.image;
}
