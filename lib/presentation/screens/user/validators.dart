class Validators {
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su $fieldName';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su número de teléfono';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Ingrese un número de teléfono válido';
    }
    return null;
  }

  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su $fieldName';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Ingrese un número válido';
    }
    return null;
  }
}
