import '../lib/dart_browser_loader.dart';

main() async {
  await loadScript("https://code.jquery.com/jquery-3.2.1.min.js");
  await loadLink(
      "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css");
  await loadInlineStyle('''
  body {
    color: red;
  }
  ''');
}
