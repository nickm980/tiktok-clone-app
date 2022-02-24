
class Numbers {
  static const thousand = 1000;
  static const million = thousand * 1000;
  static const billion = million * 1000;
  static const trillion = billion * 1000;

  static String condenseNumber(int number) {
    double newNumber = number + 0.0;
    var suffix = "";

    if (number >= thousand) {
      suffix = "K";
      newNumber = number / thousand;
    }
    else if (number >= million) {
      suffix = "M";
      newNumber = number / billion;
    }
    else if (number >= billion) {
      suffix = "B";
      newNumber = number / billion;
    }
    else if (number >= trillion) {
      suffix = "T";
      newNumber = number / trillion;
    }

    if (suffix == "") {
      return number.toString() + suffix;
    }

    return newNumber.toString() + suffix;
  }
}