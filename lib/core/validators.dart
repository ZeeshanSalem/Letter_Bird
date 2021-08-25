class Validators {
  static String? validateField(String value, context) {
    if (value.isEmpty) {
      return "Field is required";
    }
    return null;
  }

  static String? validateName(String value) {
    String pattern = "^[a-zA-Z ]+\$";
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty) {
      return "Field is required";
    } else if (!regex.hasMatch(value)) {
      return "Name must contain alphabets only";
    }
    return null;
  }

  static bool validateNameBool(String value) {
    String pattern = "^[a-zA-Z ]+\$";
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty) {
      return false;
    } else if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateEmailBool(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty) {
      return false;
    } else if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }


  static String? validateEmail(String value, context) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty) {
      return "Field is required";
    } else if (!regex.hasMatch(value)) {
      return "Incorrect email entered";
    }
    return null;
  }

  static String? validatePassword(String value, context) {
    if (value.isEmpty) {
      return "Field is required";
    } else if (!(value.length >= 6)) {
      return "Minimum 6 characters required";
    }
    return null;
  }
}
