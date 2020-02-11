import 'dart:convert';

class Job {
  String type;
  int salary;
  String company;
  Job(this.type, this.salary, this.company);

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
}

var job = new Job("Software Developer", 7500, "Julia Computing LLC");

void main() {
  var job = new Job("Software Developer", 7500, "Julia ComputingLLC") ;
  var jsonStr = job.toJson(); print(jsonStr);
  var job2 = new Job.fromJson(jsonStr);
  assert(job2 is Job);
  assert(job2.toJson() == jsonStr);
}

