import 'dart:io';
import 'package:conventional_commit/conventional_commit.dart';

void main() {
  final rootDir = Directory.current;
  final commitFile = File("${rootDir.path}/.git/COMMIT_EDITMSG");
  final commitMessage = commitFile.readAsStringSync();

  final parsedCommit = ConventionalCommit.tryParse(commitMessage);
  if (parsedCommit == null) {
    exit(1);
  }
  exit(0);
}
