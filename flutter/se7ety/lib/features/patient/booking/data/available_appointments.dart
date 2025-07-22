List<int> getAvailableAppointments(
  DateTime selectedDate,
  String start,
  String end,
) {
  int startHour = int.parse(start);
  int endHour = int.parse(end);

  List<int> availableHours = [];

  for (int i = startHour; i < endHour; i++) {
    // check if we are today
    DateTime configuredDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ); // to ignore the time of today

    int diffInDays = selectedDate.difference(configuredDate).inDays;
    if (diffInDays != 0) {
      availableHours.add(i);
    } else {
      // we are today
      if (i > DateTime.now().hour) {
        availableHours.add(i);
      }
    }
  }

  return availableHours;
}
