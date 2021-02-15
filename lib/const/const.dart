import 'package:device_info/device_info.dart';

double IOS_DEVICE_NAME = -1;

double getIphoneName(String identifier) {
  // .5 => S, .8=> Plus .3=>c .58 S+ .52 SE

  switch (identifier) {
    case "iPhone1,1":
      return 1;
    case "iPhone1,2":
      return 3;
    case "iPhone2,1":
      return 3.5;
    case "iPhone3,1":
      return 4;
    case "iPhone3,2":
      return 4;
    case "iPhone3,3":
      return 4;
    case "iPhone4,1":
      return 4.5;
    case "iPhone5,1":
      return 5;
    case "iPhone5,2":
      return 5;
    case "iPhone5,3":
      return 5.3;
    case "iPhone5,4":
      return 5.3;
    case "iPhone6,1":
      return 5.5;
    case "iPhone6,2":
      return 5.5;
    case "iPhone7,2":
      return 6;
    case "iPhone7,1":
      return 6.8;
    case "iPhone8,1":
      return 6.5;
    case "iPhone8,2":
      return 6.58;
    case "iPhone8,4":
      return 0.52;
    case "iPhone9,1":
      return 7;
    case "iPhone9,3":
      return 7;
    case "iPhone9,2":
      return 7.8;
    case "iPhone9,4":
      return 7.8;
    case "iPhone10,1":
      return 8;
    case "iPhone10,4":
      return 8;
    case "iPhone10,2":
      return 8.8;
    case "iPhone10,5":
      return 8.8;
    case "iPhone10,3":
      return 10;
    case "iPhone10,6":
      return 10;
    default:
      return 11;
  }
}
