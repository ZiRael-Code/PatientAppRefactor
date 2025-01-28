import 'dart:io';

void main() {
  final directory = Directory('./');
  final sizeParameters = ['width', 'height', 'size', 'fontSize', 'top', 'bottom', 'left', 'right'];

  reverseProcessDirectory(directory, sizeParameters);
}

void reverseProcessDirectory(Directory dir, List<String> sizeParams) async {
  await for (var entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      print('Processing: ${entity.path}');
      reverseProcessFile(entity, sizeParams);
    }
  }
}

void reverseProcessFile(File file, List<String> sizeParams) {
  final content = file.readAsStringSync();
  final updatedContent = reverseReplaceSizes(content, sizeParams);

  if (content != updatedContent) {
    file.writeAsStringSync(updatedContent);
    print('Reversed: ${file.path}');
  }
}

String reverseReplaceSizes(String content, List<String> sizeParams) {
  final regex = RegExp(
    r'(' + sizeParams.join('|') + r')\s*:\s*getFontSize\((\d+(\.\d+)?),\s*context\)',
    multiLine: true,
  );

  return content.replaceAllMapped(regex, (match) {
    final param = match.group(1); // The parameter (e.g., fontSize)
    final sizeValue = match.group(2); // The numeric value
    return '$param: $sizeValue';
  });
}
