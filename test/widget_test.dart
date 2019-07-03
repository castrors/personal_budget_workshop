import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/screen/record_detail_screen.dart';

void main() {
  testWidgets('GIVEN RecordDetailScreen with empty record WHEN Receita is tapped THEN should find money_off icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RecordDetailScreen(
        record: Record(),
      ),
    ));

    expect(find.byIcon(Icons.attach_money), findsOneWidget);
    expect(find.byIcon(Icons.money_off), findsNothing);

    await tester.tap(find.text("Receita"));
    await tester.pump();

    expect(find.byIcon(Icons.attach_money), findsNothing);
    expect(find.byIcon(Icons.money_off), findsOneWidget);
  });
}
