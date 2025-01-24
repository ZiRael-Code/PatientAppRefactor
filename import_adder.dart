import 'dart:io';

void main() {
  final directory = Directory('lib/Account/Referral');
  const importStatement = "import '../../Main/Dashboard.dart';";
  if (directory.existsSync()) {
    directory.listSync(recursive: true).forEach((fileEntity) {
      if (fileEntity is File && fileEntity.path.endsWith('.dart')) {
        final lines = fileEntity.readAsLinesSync();
        if (!lines.contains(importStatement)) {
          final updatedContent = [importStatement, ...lines].join('\n');
          fileEntity . writeAsStringSync(updatedContent);
          print('Added import to ${fileEntity.path}');
        } else {
          print('Import already exists in ${fileEntity.path}');
        }
      }
    });
  } else {
    print('The directory "lib" does not exist.');
  }
}
