import 'dart:io';

import 'package:copy/copy.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Copy copy;

    var src = 'test/copy_test.dart';
    var dist = 'test/copy_test2.dart';

    var dSrc = 'test';
    var dDist = 'test1';

    setUp(() {
      copy = Copy();
    });

    test('First Test', () async {

      expect(await new File(src).exists(), isTrue);

      await copy.file(src, dist);
      
      var distFile = new File(dist);
      expect(await distFile.exists(), isTrue);
      
      await distFile.delete();

      await copy.copyDirectory(dSrc, dDist);
      expect(await new File(src).exists(), isTrue);

      var directory = new Directory(dDist);
      await directory.delete(recursive: true);
    });
  });
}
