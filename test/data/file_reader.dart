import 'dart:io';

String readFileToString(String name) => File(name).readAsStringSync();
