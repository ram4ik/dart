main() {
  
  display("Fluttering...");
  
  print(displayString('Other way to display!'));
}

display(message) => print('Message is: $message');

displayString(message) {
  return 'Displaying this: $message';
}