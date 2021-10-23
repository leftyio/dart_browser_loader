[![Dart](https://github.com/leftyio/dart_browser_loader/actions/workflows/dart.yml/badge.svg)](https://github.com/leftyio/dart_browser_loader/actions/workflows/dart.yml)

# dart_browser_loader

Import Javascript/Css... using Dart

```dart
await loadScript("https://code.jquery.com/jquery-3.2.1.min.js");
await loadLink("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css");
await loadInlineStyle('''
  body {
    color: red;
  }
  ''');
```

It will add following element to dom.

```html
<script type="text/javascript" async="" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<style>  body {
    color: red;
  }
 </style>
```

All function return future with element when link is valid or throw an error when invalid.