import 'dart:io';

void main() {
  final directory = Directory('./lib');
  processDirectory(directory);
}

void processDirectory(Directory dir) async {
  await for (var entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      print('Processing: ${entity.path}');
      processFile(entity);
    }
  }
}

void processFile(File file) {
  final content = file.readAsStringSync();
  final updatedContent = replaceColor(content);

  if (content != updatedContent) {
    file.writeAsStringSync(updatedContent);
    print('Updated: ${file.path}');
  }
}

String replaceColor(String content) {
  // Regex to match Color(0xff3C8AFF)
  // final regex = RegExp(r'Color\(0xFFE2EDFF\)', multiLine: true);
  final regex = RegExp(r'AppColors\.pink\[600\]', multiLine: true);

  return content.replaceAll(regex, 'AppColors.blue[600]');
}
