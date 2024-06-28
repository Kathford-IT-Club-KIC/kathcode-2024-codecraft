class FieldValidators{
  static String? validateEmail(String? value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value){
  if(value == null || value.isEmpty){
    return 'Please enter your password';
  }
  return null;
}
static String? validateContactNumber(String? value){
String pattern = r'^[0-9]{10}$'; // Regular expression for 10-digit phone number
RegExp regex = RegExp(pattern);
if (value == null || value.isEmpty || !regex.hasMatch(value)) {
return 'Enter a valid 10-digit contact number';
}
return null; // Return null if the input is valid
}
  static String? validateFullName(String? value){

    if (value == null || value.isEmpty) {
      return 'Enter enter your full name';
    }
    return null; // Return null if the input is valid
  }

  static String? validateLocation(String? value){

    if (value == null || value.isEmpty || ) {
      return 'Please enter your location';
    }
    return null; // Return null if the input is valid
  }
  static String? validateConfirmPassword(String? value, String? password){

    if (value == null || value.isEmpty || ) {
      return 'Please Confirm your password';
    }
    if(value !=password){
      return 'Passwords do not match';
    }
    return null; // Return null if the input is valid
  }
}