import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final appDocumentsDir = await getApplicationDocumentsDirectory();
  final file = File('${appDocumentsDir.path}/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  await OpenFile.open(file.path);
}
Future<Uint8List> readImage(String name)async
{
  final data=await rootBundle.load('assets/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
  
}
