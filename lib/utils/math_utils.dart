import 'dart:math';

final random = new Random();

double nextInRange(int min, int max) {
  return min + random.nextInt(max - min).toDouble();
}
