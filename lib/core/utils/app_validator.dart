class AppValidator {
  AppValidator._();

  static String? required(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    final String? requiredResult = required(value, fieldName: 'Email');
    if (requiredResult != null) return requiredResult;

    final RegExp regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!regex.hasMatch(value!.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    final String? requiredResult = required(value, fieldName: 'Password');
    if (requiredResult != null) return requiredResult;
    if (value!.trim().length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    final String? requiredResult = required(value, fieldName: 'Confirm password');
    if (requiredResult != null) return requiredResult;
    if (value != password) return 'Passwords do not match';
    return null;
  }
}
