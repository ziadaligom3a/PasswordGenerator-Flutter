import 'dart:io';
import 'dart:math';

class Generate {
  generatePassword(int length) {
    String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lower = 'abcdefghijklmnopqrstuvwxyz';
    String numbers = '1234567890';
    String symbols = '!@#\$%^&*()<>,./';
    var all = upper + lower + numbers + symbols;
    var list = all.split("");
    // print(list);
    Random rand = Random();
    var password = "";
    for (var i = 0; i < length; i++) {
      var index = rand.nextInt(list.length);
      password += list[index];
    }

    return password;
  }
}
