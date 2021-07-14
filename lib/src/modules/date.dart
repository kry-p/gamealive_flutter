class DateConverter {
  String dateToString(int year, int month, int day) {
    try {
      return year.toString() + "-" + month.toString() + "-" + day.toString();
    } catch(e) {
      return null;
    }
  }
}