import 'dart:ui';
import 'package:flutter/material.dart';

class LoadingManager {
  static void showLoading(
      BuildContext context, {
        String? message,
        Color backgroundColor = Colors.black,
        Color indicatorColor = Colors.white,
        Color textColor = Colors.white,
        bool useBlurBackground = true,
      }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) => Stack(
        alignment: Alignment.center,
        children: [
          // 模糊背景
          if (useBlurBackground)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),

          // 加载框
          Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 自定义旋转动画
                    _buildRotatingIndicator(indicatorColor),

                    if (message != null) ...[
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildRotatingIndicator(Color color) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}