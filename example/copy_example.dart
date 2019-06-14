import 'dart:io';

import 'package:copy/copy.dart';

main() async {
  var copy = Copy();
  var src = 'test/copy_test.dart';
  var dist = 'test/copy_test2.dart';

  var dSrc = 'test';
  var dDist = 'test1';

  await copy.file(src, dist);

  var distFile = new File(dist);
  assert(await distFile.exists() == true);

  await distFile.delete();

  await copy.copyDirectory(dSrc, dDist);
  assert(await new Directory(dDist).exists() == true);

  var directory = new Directory(dDist);
  try {
    await directory.delete(recursive: true);
  } catch(e) {
    print(e.toString());
  }
}
