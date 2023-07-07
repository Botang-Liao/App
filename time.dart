// import 'dart:html';

void main(List<String> args) {
  datetimeToInteger(DateTime(2023, 4, 23), DateTime(2023, 4, 22));
}

//計算剩餘時間(秒數)
int datetimeToInteger(DateTime time, DateTime std) {
  int timestamp = time.millisecondsSinceEpoch ~/ 1000;
  int stdTimestamp = std.millisecondsSinceEpoch ~/ 1000;
  print(timestamp - stdTimestamp);
  return timestamp - stdTimestamp;
}
