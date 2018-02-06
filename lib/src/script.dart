library dart_browser_loader.script;

import 'dart:async';
import 'dart:html';

import "utils.dart";

Future<ScriptElement> loadScript(String src,
    {String id,
    bool isAsync: true,
    bool isDefer: false,
    String type: 'text/javascript',
    String integrity,
    String crossOrigin}) {
  ScriptElement element = id != null
      ? document.getElementById(id)
      : document.querySelector("script[src='$src']");

  if (element == null) {
    element = new ScriptElement()
      ..type = type
      ..async = isAsync
      ..defer = isDefer
      ..src = src;
    if (id != null) {
      element.id = id;
    }
    if (integrity != null) {
      element.integrity = integrity;
    }
    if (crossOrigin != null) {
      element.crossOrigin = crossOrigin;
    }
    document.head.append(element);
  }
  return waitLoad(element);
}

Future<ScriptElement> loadInlineScript(String src, String id,
    {String type: 'text/javascript'}) {
  ScriptElement element = document.getElementById(id);

  if (element == null) {
    element = new ScriptElement()
      ..type = type
      ..id = id
      ..innerHtml = src;
    document.head.append(element);
  }
  return waitLoad(element);
}
