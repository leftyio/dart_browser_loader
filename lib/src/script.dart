import 'dart:async';
import 'dart:html';

import 'utils.dart';

/// Include a [ScriptElement] inside the <head>
///
/// Future<ScriptElement> is completed when the script is loaded
Future<ScriptElement> loadScript(
  String src, {
  String? id,
  bool isAsync = true,
  bool isDefer = false,
  String type = 'text/javascript',
  String? integrity,
  String? crossOrigin,
}) {
  var element = id != null
      ? document.getElementById(id) as ScriptElement?
      : document.querySelector("script[src='$src']") as ScriptElement?;

  if (element == null) {
    element = ScriptElement()
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
    document.head!.append(element);
  }

  return waitLoad(element);
}

/// Include inline [ScriptElement] inside the <head>
///
/// Future<ScriptElement> is completed when the script is loaded
///
/// ex: loadInlineScript('console.log("Hello")');
Future<ScriptElement> loadInlineScript(
  String src,
  String id, {
  String type = 'text/javascript',
}) {
  var element = document.getElementById(id) as ScriptElement?;

  if (element == null) {
    element = ScriptElement()
      ..type = type
      ..id = id
      ..innerHtml = src;
    document.head!.append(element);
  }
  return waitLoad(element);
}
