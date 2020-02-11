import 'dart:io';

// for step 3:
import 'dart:async';
import 'dart:convert';

main() {
  File data = new File("test.csv");
// using openRead:
  Stream<List<int>> input = data.openRead();
  input
      .transform(utf8.decoder) // Decode to UTF8.
      // Convert stream to individual lines.
      .transform(const LineSplitter())
      .listen((String line) {
    // Callback to process results.
    print('$line: ${line.length} bytes');
    // Further processing of line, e.g. as in processLines
  }, onDone: () {
    print('File is now closed.');
  }, onError: (e) {
    print(e.toString());
  });
}

processLines(List<String> lines) {
  // process lines:
  for (var line in lines) {
    print(line);
    // when not header line, split line on separator:
    bool header;
    if (!header) {
      List<String> fields = line.split(";");
      Wine wn = new Wine();
      wn.fixed_acidity = fields[0];
      wn.volatile_acidity = fields[1];
      // extracting remaining properties
      wn.alcohol = fields[10];
      wn.quality = fields[11];
      print(wn);
    }
    header = false;
  }
}

class Wine {
  var fixed_acidity;
  var volatile_acidity;

  // other properties
  var alcohol;
  var quality;

  toString() => "This wine has $fixed_acidity fixed acidity, "
      "alcohol % of $alcohol and quality $quality.";
}

handleError(e) {
  print("An error $e occurred");
}
