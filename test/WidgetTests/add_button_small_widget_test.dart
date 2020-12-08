import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSizeConfig extends Mock implements SizeConfig {}

//SizeConfig sizeConfig;

void main(){
  setUp(() {
    SizeConfig().initDefault();
  });


  group('Add Button Small Widget Tests', () {

    //final comment = Comment();

    testWidgets('Default Add Button Clicked Test', (WidgetTester tester) async{

      // Creates Add Button Small Widget
      final widget = AddButtonSmall(AddButtonSmall.iconAdded);
      await tester.pumpWidget(widget);
      expect(find.byType(AddButtonSmall), findsOneWidget);

      // Check widget icon and visibility
      expect(find.byIcon(AddButtonSmall.iconAdded), findsOneWidget);
      await tester.ensureVisible(find.byType(AddButtonSmall));

      // Taps widget and checks that icon has changed
      await tester.tap(find.byType(AddButtonSmall));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byIcon(AddButtonSmall.iconChecked), findsOneWidget);
      
    });

    testWidgets('Add Button Already Clicked Test', (WidgetTester tester) async{
      final widget = AddButtonSmall(AddButtonSmall.iconChecked);
      await tester.pumpWidget(widget);
      expect(find.byType(AddButtonSmall), findsOneWidget);

      expect(find.byIcon(AddButtonSmall.iconChecked), findsOneWidget);
      await tester.ensureVisible(find.byType(AddButtonSmall));

      await tester.tap(find.byType(AddButtonSmall));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byIcon(AddButtonSmall.iconChecked), findsOneWidget);

    });
  });
}