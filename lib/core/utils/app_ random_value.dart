// ignore: file_names
import 'dart:math';

class AppRandomValues {
  static String get randomStringId {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random.secure();

    final codes = List<int>.generate(
      20,
      (index) => characters.codeUnitAt(random.nextInt(characters.length)),
    );

    return String.fromCharCodes(codes); 
  }
}
