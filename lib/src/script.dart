import 'dart:async';
import 'dart:html';

import 'dart:js' as js;

import "utils.dart";

/// Include a [ScriptElement] inside the <head>
///
/// Future<ScriptElement> is completed when the script is loaded
Future<ScriptElement> loadScript(
  String src, {
  String id,
  bool isAsync = true,
  bool isDefer = false,
  String type = 'text/javascript',
  String integrity,
  String crossOrigin,
}) {
  ScriptElement element = id != null
      ? document.getElementById(id)
      : document.querySelector("script[src='$src']");

  if (element != null) return waitLoad(element);

  element = ScriptElement()
    ..type = type
    ..async = isAsync
    ..defer = isDefer;

  final future = waitLoad(element);

  if (id != null) {
    element.id = id;
  }
  if (integrity != null) {
    element.integrity = integrity;
  }
  if (crossOrigin != null) {
    element.crossOrigin = crossOrigin;
  }

  element.src = src;
  document.head.append(element);

  return future;
}

/// Eval javascript string
/// 
/// ex: eval('console.log("Hello")');
void eval(String script) async {
  js.context.callMethod("eval", [script]);
}
