import 'dart:html';
import 'dart:indexed_db';
import 'jobstore.dart';

void main() {
  //test if browser supports IndexedDB:
  if (!IdbFactory.supported) {
    window.alert("Sorry, this browser does not support IndexedDB");
    return;
  }
  var js = new JobStore();
  //creating and opening the database:
  js.openDB();
  querySelector("#store").onClick.listen(storeData);
}

storeData(Event e) {
  var job = _jobData();
  //writing data to IndexedDB
  var js;
  js.add(job);
}

class _jobData {
}