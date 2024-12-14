import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';

// エラーダイアログ表示の共通関数
Future<void> showError(BuildContext context, Object err) async {
  if (!context.mounted) return;

  await _showCommonDialog(
    context: context,
    // 多言語: エラーが発生しました
    title: L10n.of(context).error_occurred,
    content: err.toString(),
  );
}

// アラートが表示されているかの分岐
// 目的 : 多重にダイアログを表示させない為
bool _isDialogShowing = false;

// 共通コンポーネント
// iOS: CupertinoDialogを表示する
// Android: AlertDialogを表示する
// 現在はPrivate
Future<void> _showCommonDialog({
  required BuildContext context,
  Key? key,
  String? title,
  String? content,
  TextAlign? contentAlign = TextAlign.center,
  GestureTapCallback? okAction,
}) async {
  // アラートが表示されている場合、アラートを追加しない
  if (_isDialogShowing) return;

  _isDialogShowing = true;

  final l10n = L10n.of(context);

  // 多言語: OK
  final okString = l10n.ok;

  // 多言語: キャンセル
  final cancelString = l10n.cancel;

  if (Platform.isIOS && context.mounted) {
    await showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          key: key,
          title: title != null ? Text(title) : null,
          content:
              content != null ? Text(content, textAlign: contentAlign) : null,
          actions: [
            CupertinoDialogAction(
              onPressed: () async {
                if (Navigator.canPop(ctx)) Navigator.of(ctx).pop();
              },
              child: Text(
                okAction != null ? cancelString : okString,
              ),
            ),
            if (okAction != null)
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  okAction.call();
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: Text(
                  okString,
                ),
              ),
          ],
        );
      },
    ).then((value) => _isDialogShowing = false);
  }
  if (Platform.isAndroid && context.mounted) {
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          key: key,
          title: title != null ? Center(child: Text(title)) : null,
          content: content != null
              ? Text(
                  content,
                  textAlign: contentAlign,
                )
              : null,
          actions: [
            TextButton(
              child: Text(
                okAction != null ? cancelString : okString,
              ),
              onPressed: () async {
                Navigator.of(ctx).pop();
              },
            ),
            if (okAction != null)
              TextButton(
                child: Text(okString),
                onPressed: () {
                  okAction.call();
                  Navigator.of(ctx).pop();
                },
              ),
          ],
        );
      },
    ).then((value) => _isDialogShowing = false);
  }
}
