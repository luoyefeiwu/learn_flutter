import 'package:shared_preferences/shared_preferences.dart';

// 存储token
Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<void> saveWarehouseCode(String warehouseCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('warehouseCode', warehouseCode);
}

Future<String> getWarehouseCode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('warehouseCode') ?? '';
}

// 读取token
Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') ?? '';
}

// 使用示例
Future<void> main() async {
  // 假设从某个地方获取到了token
  String token = 'your_token_here';

  // 存储token
  await saveToken(token);

  // 读取token
  String savedToken = await getToken();
  print('Saved token: $savedToken');
}