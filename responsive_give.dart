import 'dart:io';

void main() {
  final directory = Directory('./lib');
  final sizeParameters = ['width', 'height', 'size', 'fontSize', 'top', 'bottom', 'left', 'right',];

  processDirectory(directory, sizeParameters);
}

void processDirectory(Directory dir, List<String> sizeParams) async {
  await for (var entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      print('Processing: ${entity.path}');
      processFile(entity, sizeParams);
    }
  }
}

void processFile(File file, List<String> sizeParams) {
  final content = file.readAsStringSync();
  final updatedContent = replaceStaticSizes(content, sizeParams);

  if (content != updatedContent) {
    file.writeAsStringSync(updatedContent);
    print('Updated: ${file.path}');
  }
}

String replaceStaticSizes(String content, List<String> sizeParams) {
  final regex = RegExp(
    r'(' + sizeParams.join('|') + r')\s*:\s*(\d+(\.\d+)?)(?!.*getFontSize)',
    multiLine: true,
  );

  return content.replaceAllMapped(regex, (match) {
    final param = match.group(1);
    final sizeValue = match.group(2);
    return '$param: getFontSize($sizeValue, context)';
  });
}