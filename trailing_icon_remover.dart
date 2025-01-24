import 'dart:io';

void main() async {
  final libDirectory = Directory('lib');

  if (!libDirectory.existsSync()) {
    print("The 'lib' directory does not exist.");
    return;
  }

  final dartFiles = libDirectory
      .listSync(recursive: true)
      .where((file) => file is File && file.path.endsWith('.dart'))
      .cast<File>();

  for (var file in dartFiles) {
    final content = await file.readAsString();

    if (content.contains('appBar: AppBar(')) {
      final updatedContent = content.replaceAll(
        RegExp(r'appBar: AppBar\('),
        'appBar: AppBar(\n          automaticallyImplyLeading: false,',
      );

      await file.writeAsString(updatedContent);
      print("Updated: ${file.path}");
    } else {
      print("Skipped: ${file.path}");
    }
  }
}
