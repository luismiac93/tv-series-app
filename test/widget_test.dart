import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series_app/Auth/ui/widgets/welcome_title.dart';

void main() {
  Widget TestWidget = MediaQuery(
      data: const MediaQueryData(),
      child:  MaterialApp(
          home:  Stack(
        children: const [WelcomeTitle("Welcome")],
      )));
  testWidgets('WelcomeTitle has a title Welcome and a Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(TestWidget);
    expect(find.text('Welcome'), findsOneWidget);
    var text = find.byType(Text);
    expect(text, findsOneWidget);
  });
}
