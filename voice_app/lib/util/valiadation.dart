// validate form in sign in page

class ValidationData {
  String validateEmail(String value){
    if (!value.contains("@")){
      return ("Please enter a valid email");
    }
    return null;
  }

  String validatePassword(String value){
    if (value.length < 10){
      return "Enter 10 more char";
    }
    return null;
  }
}