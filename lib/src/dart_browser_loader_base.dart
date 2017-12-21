import 'dart:async';
import 'dart:html';

Future<ScriptElement> loadScript(String src,
    {String id,
    bool isAsync: true,
    bool isDefer: false,
    String type: 'text/javascript',
    String integrity,
    String crossOrigin}) {
  ScriptElement element = document.querySelector("script[src='$src']");

  if (id != null && element == null) {
    element = document.getElementById(id);
  }

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
  LinkElement element = document.querySelector("link[href='$href']");

  if (id != null && element == null) {
    element = document.getElementById(id);
  }

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

Future<T> waitLoad<T extends Element>(T element) {
  final completer = new Completer<T>();

  element.onLoad.first.then((_) {
    completer.complete(element);
  });

  element.onError.first.then((e) {
    completer.completeError(e);
  });

  return completer.future;
}
