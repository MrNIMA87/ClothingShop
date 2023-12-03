// import 'dart:developer';

// import 'package:dio/dio.dart';

// class GetService {
//   Dio dio = Dio();

//   Future<dynamic> getMethod(String url) async {
//     try {
//       return await dio
//           .get(url,
//               options: Options(
//                 responseType: ResponseType.json,
//                 method: 'GET',
//               ))
//           .then((value) {
//         return value;
//       });
//     } catch (e) {
//       log('Log Eror Dio Service'+e.toString());
//     }
//   }
// }
