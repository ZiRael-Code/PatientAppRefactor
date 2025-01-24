import 'dart:io';

void main() {
  final libDirectory = Directory('lib');

  if (!libDirectory.existsSync()) {
    print('The lib directory does not exist.');
    return;
  }

  final files = libDirectory
      .listSync(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.dart'))
      .map((entity) => entity as File)
      .toList();

  final searchPattern = RegExp(
      r"Container\(\s*width: getFontSize\(35, context\),\s*height: getFontSize\(35, context\),\s*padding: EdgeInsets\.all\(10\),\s*decoration: BoxDecoration\(\s*borderRadius: BorderRadius\.circular\(50\),\s*color: Color\(0xFFE5E5E5\),\s*\),\s*child: SvgPicture\.asset\('assets/images/back\.svg',\s*width: getFontSize\(8\.0, context\),\s*height: getFontSize\(15, context\),\),\s*\),");

  final replacement = '''
InkWell(
          onTap: () => Navigator.pop(context),
          child: 
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),),
              ),
              ),
''';

  for (final file in files) {
    final content = file.readAsStringSync();
    if (searchPattern.hasMatch(content)) {
      final updatedContent = content.replaceAll(searchPattern, replacement);
      file.writeAsStringSync(updatedContent);
      print('Updated: ${file.path}');
    } else {
      print('No match found in: ${file.path}');
    }
  }

  print('Processing complete.');
}
