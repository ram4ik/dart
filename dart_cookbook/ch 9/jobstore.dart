library store;

import 'dart:html';
import 'dart:async';

import 'dart:indexed_db';
import 'dart:convert';

class JobStore {
  static const String JOB_STORE = 'jobStore';
  static const String TYPE_INDEX = 'type_index';
  Database _db;
  final List<Job> jobs = new List();

  Future openDB() {
    return window.indexedDB
        .open('JobDB', version: 1, onUpgradeNeeded: _initDb)
        .then(_loadDB)
        .catchError(print);
  }

  void _initDb(VersionChangeEvent e) {
    _db = (e.target as Request).result;
    var store = _db.createObjectStore(JOB_STORE, autoIncrement: true);
    store.createIndex(TYPE_INDEX, 'type', unique: false);
  }

  Future add(Job job) {
// create transaction and get objectstore:
    var trans = _db.transaction(JOB_STORE, 'readwrite');
    var store = trans.objectStore(JOB_STORE);
    store.add(job.toMap())
// called when add completes
        .then((addedKey) {
      print(addedKey);
      job.dbKey = addedKey;
    });
    return trans.completed.then((_) {
// called when transaction completes jobs.add(job);
      return job;
    });
  }

  Future _loadDB(Database db) {
    _db = db;
    var trans = db.transaction(JOB_STORE, 'readonly');
    var store = trans.objectStore(JOB_STORE);

    var cursors = store.openCursor(autoAdvance: true).asBroadcastStream();
    cursors.listen((cursor) {
      var job = new Job.fromJson(cursor.value);
      jobs.add(job);
    });
    return cursors.length.then((_) {
      return jobs.length;
    });
  }

  Future update(Job job) {
    var trans = _db.transaction(JOB_STORE, 'readwrite');
    var store = trans.objectStore(JOB_STORE);
    return store.put(job.toMap());
  }

  Future remove(Job job) {
    var trans = _db.transaction(JOB_STORE, 'readwrite');
    var store = trans.objectStore(JOB_STORE);
    store.delete(job.dbKey);
    return trans.completed.then((_) {
      job.dbKey = null;
      jobs.remove(job);
    });
  }

  Future clear() {
    var trans = _db.transaction(JOB_STORE, 'readwrite');
    var store = trans.objectStore(JOB_STORE);
    store.clear();
    return trans.completed.then((_) {
      jobs.clear();
    });
  }
}

class Job {
  String type;
  int salary;
  String company;
  Job(this.type, this.salary, this.company);

  get dbKey => null;

  set dbKey(dbKey) {}

  String toJson() {
    var jsm = new Map<String, Object>(); jsm["type"] = type;
    jsm["salary"] = salary;
    jsm["company"] = company;
    var jss = json.encode(jsm);
    return jss;
  }

  Job.fromJson(String jsonStr) {
    Map jsm = json.decode(jsonStr);
    this.type = jsm["type"];
    this.salary = jsm["salary"];
    this.company = jsm["company"];
  }

  toMap() {}
}