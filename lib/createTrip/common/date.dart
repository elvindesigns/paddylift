String getDay(int day) {
  var convertedDay;
  if (day == 1) convertedDay = "MON";
  if (day == 2) convertedDay = "TUE";
  if (day == 3) convertedDay = "WED";
  if (day == 4) convertedDay = "THUR";
  if (day == 5) convertedDay = "FRI";
  if (day == 6) convertedDay = "SAT";
  if (day == 7) convertedDay = "SUN";
  return convertedDay;
}

String getMonth(int month) {
  var convertedMonth;
  if (month == 1) convertedMonth = "JAN";
  if (month == 2) convertedMonth = "FEB";
  if (month == 3) convertedMonth = "MAR";
  if (month == 4) convertedMonth = "APR";
  if (month == 5) convertedMonth = "MAY";
  if (month == 6) convertedMonth = "JUN";
  if (month == 7) convertedMonth = "JUL";
  if (month == 8) convertedMonth = "AUG";
  if (month == 9) convertedMonth = "SEP";
  if (month == 10) convertedMonth = "OCT";
  if (month == 11) convertedMonth = "NOV";
  if (month == 12) convertedMonth = "DEC";
  return convertedMonth;
}

String getHour(int hour) {
  var convertedHour;
  convertedHour = hour.toString();
  if (hour == 13) convertedHour = "1";
  if (hour == 14) convertedHour = "2";
  if (hour == 15) convertedHour = "3";
  if (hour == 16) convertedHour = "4";
  if (hour == 17) convertedHour = "5";
  if (hour == 18) convertedHour = "6";
  if (hour == 19) convertedHour = "7";
  if (hour == 20) convertedHour = "8";
  if (hour == 21) convertedHour = "9";
  if (hour == 22) convertedHour = "10";
  if (hour == 23) convertedHour = "11";
  if (hour == 24) convertedHour = "12";

  return convertedHour;
}

String getAmPm(int hour) {
  var convertedHour = "AM";

  if (hour > 12) convertedHour = "PM";

  return convertedHour;
}
