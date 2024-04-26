class FormValidators {
  String? userNameValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return "Required Field";
      } else if (value.length < 3) {
        return "Name Must be At Least 3 Characters";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String? emailValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return "Required Field";
      } 
      else if(value.length<14){
        return "Enter correct email";
      }
      else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
        return "Enter correct email";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String? strongPasswordValidator(String? value) {
    String? message;
    if (value == null || value.isEmpty) {
      message ??= '';
      message += 'Required Field';
    }
    else if (!RegExp(".*[0-9].*").hasMatch(value )) {
      message ??= '';
      message += 'Password should contain a numeric value 1-9. ';
    }
    else if (!RegExp('.*[a-z].*').hasMatch(value)) {
      message ??= '';
      message += 'Password should contain a lowercase letter a-z. ';
    }
    else if (!RegExp('.*[A-Z].*').hasMatch(value )) {
      message ??= '';
      message += 'Password should contain an uppercase letter A-Z. ';
    }
    else if(value.length<8){
      message ??= '';
      message += 'Password should be at least 8 Characters. ';
    }
    return message;
    // if (value != null) {
    //   if (value.isEmpty) {
    //     return "Required Field";
    //   } else if (value.length < 8) {
    //     return "Password Must be At Least 8 Characters";
    //   } else if (RegExp(r'^-?[0-9]+$').hasMatch(value)) {
    //     return 'Password Should Contain Numbers & Characters';
    //   } else if (RegExp(r'^[a-z]+$').hasMatch(value)) {
    //     return 'Password Should Contain Numbers & Characters';
    //   } else {
    //     return null;
    //   }
    // } else {
    //   return null;
    // }
  }

  String? phoneNumberValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return "Required Field";
      } else if (int.tryParse(value) == null) {
        return "Only Numbers Are Allowed";
      } else if (value.length != 10) {
        return "Phone Number Must be 10 digits";
      } else if (value.indexOf('09') != 0) {
        return "Enter correct phone number";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
