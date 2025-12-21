import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/service/auth_service.dart';
import 'package:wms/utils/TokenManager.dart';

import '../config/cache_key.dart';
import '../r.dart';
import '../router/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  bool _obscurePassword = true;
  String baseUrl = "";

  @override
  void dispose() {
    _userNameController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _loadData();
  }

  final AuthService _authService = AuthService();

  void _handleLogin() async {
    try {
      final result = await _authService.login(
        _userNameController.value.text,
        _passWordController.value.text,
      );
      if (result.isSuccess) {
        await TokenManager.saveToken(result.data!);
        var myInfo = await _authService.myInfo();
        if (myInfo.isSuccess) {
          await TokenManager.saveCache(
            CacheKey.userInfo,
            jsonEncode(myInfo.data),
          );
        }
        context.go(Routes.index);
      }
      // 跳转首页
    } catch (e) {
      // 错误已在 Dio 拦截器中统一处理，此处可不做操作
      // 或根据需要做特殊处理
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 150.0,
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Image.asset(R.assetsImgHomeIndex, width: 100, height: 150),
            ),
            Text(
              '欢迎登录鼎腾WMS' + baseUrl,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Container(
              // height: 200.0,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text('账号密码登录', style: TextStyle(fontSize: 16.0)),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      maxLength: 10,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 10.0,
                        ),
                        prefixText: '账号 ',
                        prefixStyle: TextStyle(fontSize: 15.0),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '请输入',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16, // 👈 关键：调整垂直内边距使文本居中
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                          maxWidth: 32, // 自定义最大宽度
                          maxHeight: 32, // 自定义最大高度
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 20.0,
                    ),
                    child: TextField(
                      obscureText: _obscurePassword,
                      maxLength: 10,
                      controller: _passWordController,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 10.0,
                        ),
                        prefixText: '密码 ',
                        prefixStyle: TextStyle(fontSize: 15.0),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '请输入',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        hintMaxLines: 1,
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                          maxWidth: 32, // 自定义最大宽度
                          maxHeight: 32, // 自定义最大高度
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16, // 👈 关键：调整垂直内边距使文本居中
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text('请阅读并勾选'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '隐私条款',
                    style: TextStyle(color: Color.fromARGB(255, 41, 121, 255)),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              //rgb(40, 97, 189)
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 40, 97, 189),
              ),
              onPressed: () async {
                _handleLogin();
              },
              child: Text(
                '登录',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadData() async {
    var result = await TokenManager.getCache(CacheKey.baseUrl);
    if (result != null) {
      setState(() {
        baseUrl = result.toString();
      });
    }
  }
}
