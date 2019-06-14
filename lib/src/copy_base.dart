// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
import 'dart:async';
import 'dart:io';

class Copy
{
  file(String src, String dist) async {
    File file = new File(src);
    assert(await file.exists() == true);

    Stream<List<int>> stream = file.openRead();

    File target = await new File(dist).create(recursive: true);
    IOSink sink = target.openWrite();

    await sink.addStream(stream);
    await sink.close();
  }

  copyDirectory(String src, String dist) async {
    await new Directory(dist).create(recursive: true);
    var directory = await new Directory(src);
    assert(await directory.exists() == true);

    Stream<FileSystemEntity> entityList = directory.list(recursive: true);
    await for (FileSystemEntity entity in entityList) {
      if (entity is Directory) {
        if (await entity.exists() == false) {
          await new Directory(entity.path.replaceFirst(src, dist)).create(recursive: true);
        }
      } else {
        file(entity.path, entity.path.replaceFirst(src, dist));
      }
    }

  }
}