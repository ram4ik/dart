import 'dart:io';

main() {
  Process.run('ls', ['-la'], runInShell: true).then((ProcessResult rs) {
    print(rs.exitCode);
    print(rs.stdout);
    print(rs.stderr);
  });
}