String? validatePhoneNumber(String string) {
  if (string.isEmpty) {
    return 'Please enter mobile number';
  }

  const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? validateUsername(String value) {
  if (value.isEmpty) {
    return 'Please enter your fullname';
  }
  RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  if (!regExp.hasMatch(value)) {
    return 'Please enter valid name';
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Please enter your email';
  }
  RegExp regExp = RegExp(r'\S+@\S+\.\S+');
  if (!regExp.hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}
