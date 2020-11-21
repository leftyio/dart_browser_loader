import 'dart:async';
import 'dart:html';
import "utils.dart";

/// Include a inline [StyleElement] inside the <head>
///
/// Future<StyleElement> is completed when the style is loaded
///
/// ex: loadInlineStyle('body { margin: 0; }');
Future<StyleElement> loadInlineStyle(String style, {String id}) {
  StyleElement element = id != null ? document.getElementById(id) : null;

  if (element == null) {
    element = StyleElement()..innerHtml = style;
    if (id != null) {
      element.id = id;
    }
    document.head.append(element);
  }
  return waitLoad(element);
}

/// Include a [LinkElement] inside the <head>
///
/// Future<LinkElement> is completed when the link is loaded
///
/// ex: loadLink('./style.css');
Future<LinkElement> loadLink(
  String href, {
  String id,
  String rel = "stylesheet",
  String type = "text/css",
}) {
  LinkElement element = id != null
      ? document.getElementById(id)
      : document.querySelector("link[href='$href']");

  if (element == null) {
    element = LinkElement()
      ..type = type
      ..rel = rel
      ..href = href;
    if (id != null) {
      element.id = id;
    }
    document.head.append(element);
  }

  return waitLoad(element);
}
