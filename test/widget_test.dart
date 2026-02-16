import 'package:flutter_test/flutter_test.dart';
import 'package:smd_labs/main.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SMDLabsApp());
    expect(find.text('SMD 2026 - Lab 2'), findsOneWidget);
    expect(find.text('ToDo List App'), findsOneWidget);
    expect(find.text('Gmail Replica'), findsOneWidget);
    expect(find.text('WhatsApp Replica'), findsOneWidget);
    expect(find.text('Adaptive Layout'), findsOneWidget);
  });
}
