class Validator {
  static String? validateName({required String name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'El nombre no puede estar vacío';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));

    if (email.isEmpty) {
      return 'El correo no puede estar vacío';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Ingresar un correo válido';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'La contraseña no puede ir vacía';
    }
    if (password.length < 6) {
      return 'Ingresar una contraseña con al menos 6 caracteres';
    }

    return null;
  }
}
