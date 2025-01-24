import 'dart:io';

void main() async {
  final directoryPath = 'lib/Medication';

  final directory = Directory(directoryPath);

  if (!await directory.exists()) {
    print('Directory not found!');
    return;
  }

  final dartFiles = directory
      .listSync()
      .where((entity) => entity is File && entity.path.endsWith('.dart'))
      .cast<File>();

  if (dartFiles.isEmpty) {
    print('No Dart files found in the directory!');
    return;
  }

  for (var file in dartFiles) {
    await processFile(file);
  }

  print('All files processed successfully!');
}

Future<void> processFile(File file) async {
  final fileName = file.uri.pathSegments.last.split('.').first;

  String content = await file.readAsString();

  final classRegex = RegExp(r'class\s+(\w+)');
  final matches = classRegex.allMatches(content).toList();

  if (matches.length < 2) {
    print('Less than two classes found in ${file.path}!');
    return;
  }

  final firstClass = matches[0].group(1)!;
  final secondClass = matches[1].group(1)!;

  content = content.replaceAll(firstClass, fileName);
  content = content.replaceAll(secondClass, '${fileName}State');

  await file.writeAsString(content);
  print('Processed: ${file.path}');
}
