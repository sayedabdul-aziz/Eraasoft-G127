void main() async {
  print('Task 1');
  await Future.delayed(Duration(seconds: 2), () {
    print('Task 2');
  });
  print('Task 3');
}
