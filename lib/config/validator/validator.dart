class Validator {
  static String? phoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Phone is Empty';
    } else if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value)) {
      return 'phone must be 11 number';
    }
    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Password is Empty';
    } else if (value.length < 6) {
      return 'Password must be more than 8';
    }
    return null;
  }
}
