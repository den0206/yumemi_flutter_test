import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/common/dialog_key.dart';

// エラーダイアログ表示の共通関数
Future<void> showError(BuildContext context, Object err) async {
  if (!context.mounted) return;

  await showCommonDialog(
    key: DialogKey.error,
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
Future<void> showCommonDialog({
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
              key: DialogKey.cancel,
              onPressed: () async {
                if (Navigator.canPop(ctx)) Navigator.of(ctx).pop();
              },
              child: Text(
                okAction != null ? cancelString : okString,
              ),
            ),
            if (okAction != null)
              CupertinoDialogAction(
                key: DialogKey.ok,
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
              key: DialogKey.cancel,
              child: Text(
                okAction != null ? cancelString : okString,
              ),
              onPressed: () async {
                Navigator.of(ctx).pop();
              },
            ),
            if (okAction != null)
              TextButton(
                key: DialogKey.ok,
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
