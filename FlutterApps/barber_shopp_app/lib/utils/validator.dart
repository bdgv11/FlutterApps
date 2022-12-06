class Validator {
  static String? validateName({required String name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name cannot be empty';
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
      return 'Name cannot be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }

    /*RegExp passRegExp = RegExp(
        (r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'));*/

    /*
        r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length  
$
      */

    if (password.isEmpty) {
      return 'Name cannot be empty';
    }
    if (password.length < 7) {
      return 'Please enter a password with length at least 6';
    }
    /*else if (!passRegExp.hasMatch(password)) {
      return 'Enter a valid password';
    }*/
    return null;
  }
}
