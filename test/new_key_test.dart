import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:json_to_model/core/json_model.dart';
import 'package:json_to_model/core/model_template.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('All supported types', () {
    final file = File('D:\\dev\\dart\\json_to_model\\test\\test.json');
    final json = file.readAsStringSync();
    final content = jsonDecode(json) as Map<String, dynamic>;
    final jsonModel = JsonModel.fromMap(
      'types',
      content,
      relativePath: './',
      packageName: 'core',
      indexPath: 'index.dart',
    );

    final output = modelFromJsonModel(jsonModel);
    log('\n$output\n');
    expect(output, contains('final String name;'));
    expect(output, contains('final int? age;'));
    expect(output, contains('final String? city;'));
    expect(output, contains('final DateTime birthdate;'));
    expect(output, contains('final DateTime timeStamp;'));
  });
}
