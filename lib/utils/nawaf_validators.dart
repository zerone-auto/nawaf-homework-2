class NawafValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length != 9) {
      return 'رقم الهاتف يجب أن يكون 9 أرقام';
    }
    if (!value.startsWith('77') && !value.startsWith('78')) {
      return 'رقم الهاتف يجب أن يبدأ ب 77 أو 78';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'الرجاء إدخال أرقام فقط';
    }
    return null;
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'الرجاء إدخال نص فقط';
    }
    return null;
  }
}
