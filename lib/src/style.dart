library dart_browser_loader.style;

import 'dart:async';
import 'dart:html';
import "utils.dart";

Future<StyleElement> loadInlineStyle(String style, {String id}) {
  StyleElement element = id != null ? document.getElementById(id) : null;

  if (element == null) {
    element = new StyleElement()..innerHtml = style;
    if (id != null) {
      element.id = id;
    }
    document.head.append(element);
  }
  return waitLoad(element);
}

Future<LinkElement> loadLink(String href,
    {String id, String rel: "stylesheet", String type: "text/css"}) {
  LinkElement element = id != null
      ? document.getElementById(id)
      : document.querySelector("link[href='$href']");

  if (element == null) {
    element = new LinkElement()
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
