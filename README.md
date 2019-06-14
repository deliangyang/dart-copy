A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:copy/copy.dart';

main() async {
  var copy = new Copy();
  await copy.file('xxxx.txt', 'xxx.txt');
  
  await copy.direcotry('a', 'b');
  
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/deliangyang/dart-copy/issues/replaceme
