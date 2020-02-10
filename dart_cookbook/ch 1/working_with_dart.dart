void main() {
  isCheckedMode();
}

void isCheckedMode() {
  try {
    int n = 0;
    //throw new Exception("Checked Mode is disabled!");
  } on TypeError {
    print("Checked Mode is enabled!");
  }
}