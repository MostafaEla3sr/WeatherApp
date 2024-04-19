import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/features/home/presentation/view_models/get_weather_cubit/get_weather_state.dart';

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
  );
}
void showCustomSnackBar(WeatherFailureState state, BuildContext context) {
  final snackBar = SnackBar(
    clipBehavior: Clip.none,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      messageFontSize: 16,
      title: 'Oops !',
      message: state.errMessage,
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showToast({@required String? text, @required ToastStates? state}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 7,
        backgroundColor: toastColor(state!),
        textColor: state == ToastStates.warning ? Colors.black : Colors.white,
        fontSize: 16.0);

enum ToastStates { success, error, warning }

Color? color;
Color? toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      {}
      break;
    case ToastStates.warning:
      color = Colors.grey.shade400;
      break;
  }
  return color;
}
String getWeatherIconUrl(num? conditionCode) {
  if (conditionCode == null) {
    return AppAssets.cloud;
  }

  switch (conditionCode) {
    case 1000:
      return AppAssets.sun;
    case 1003:
      return AppAssets.partlyCloudy;
    case 1006:
      return AppAssets.cloud;
    case 1009:
      return AppAssets.cloud;
    case 1030:
      return AppAssets.mist;
    case 1063:
      return AppAssets.patchyRainPossible;
    case 1066:
      return AppAssets.patchySnowPossible;
    case 1069:
      return AppAssets.patchySleetPossible;
    case 1072:
      return AppAssets.patchyFreezingDrizzlePossible;
    case 1087:
      return AppAssets.thunderyOutbreaksPossible;
    case 1114:
      return AppAssets.snowy;
    case 1117:
      return AppAssets.blizzard;
    case 1135:
      return AppAssets.fog;
    case 1147:
      return AppAssets.freezingFog;
    case 1150:
      return AppAssets.lightRain;
    case 1153:
      return AppAssets.lightRain;
    case 1168:
      return AppAssets.snowy;
    case 1171:
      return AppAssets.snowy;
    case 1180:
      return AppAssets.patchyRainPossible;
    case 1183:
      return AppAssets.lightRain;
    case 1186:
    case 1189:
    case 1192:
    case 1195:
      return AppAssets.heavyRain;
    case 1198:
    case 1201:
    case 1204:
    case 1207:
      return AppAssets.patchyFreezingDrizzlePossible;
    case 1210:
    case 1213:
    case 1216:
    case 1219:
      return AppAssets.partlySnowy;
    case 1222:
    case 1225:
    case 1237:
      return AppAssets.snowy;
    case 1240:
    case 1243:
    case 1246:
    case 1249:
      return AppAssets.lightRain;
    case 1252:
      return AppAssets.heavyRain;
    case 1255:
      return AppAssets.partlySnowy;
    case 1258:
    case 1261:
    case 1264:
      return AppAssets.snowy;
    case 1273:
    case 1276:
      return AppAssets.thunderRain;
    case 1279:
      return AppAssets.thunderSnow;
    case 1282:
      return AppAssets.thunderyOutbreaksPossible;
    default:
      return AppAssets.partlyCloudy;
  }
}
