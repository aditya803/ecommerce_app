extension StringExtensions on String {
  bool isValidEmail() {
    return this.contains('@');
  }

  bool isValidPassword() {
    return this.length >= 7;
  }
}
