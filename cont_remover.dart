import 'dart:io';

void main() {
  // Specify the folder to process
  final directory = Directory('lib/Account/Referral');

  if (directory.existsSync()) {
    directory.listSync(recursive: true).forEach((fileEntity) {
      if (fileEntity is File && fileEntity.path.endsWith('.dart')) {
        // Read the file content
        final content = fileEntity.readAsStringSync();

        // Remove all occurrences of the 'const' keyword
        final updatedContent = content.replaceAll(RegExp(r'\bconst\b\s*'), '');

        // Write the updated content back to the file
        fileEntity.writeAsStringSync(updatedContent);

        print('Removed "const" from ${fileEntity.path}');
      }
    });
  } else {
    print('The directory "lib" does not exist.');
  }
}
