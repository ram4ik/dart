void main(List<String> args) {
  print("script argumetns:");

  for (String arg in args) {
    //print(arg);

    List<String> par = arg.split(':');
    var key = par[0];
    var value = par[1];

    print('Key is: $key - Value is: $value');

    //final parser = new ArgParser();
    //argResults = parser.parse(args);
    //List<String> pars = argsResult.rest;
    //print(pars)
  }
}