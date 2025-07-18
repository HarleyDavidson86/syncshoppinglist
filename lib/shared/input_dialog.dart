import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncshoppinglist/shared/styled_text.dart';

const _defaultCancelText = 'Abbruch';
const _defaultOkText = 'OK';
const _defaultTitle = 'Enter Text';

/// https://medium.com/@alexey.inkin/announcing-input-dialog-package-for-flutter-df590924e884
/// A widget to prompt user for a string.
class InputDialog extends StatefulWidget {
  /// The text for the button to close the dialog without returning the text.
  final String cancelText;

  /// The text for the button to close the dialog and return the text.
  final String okText;

  /// The dialog title.
  final String title;

  final String initialValue;

  ///
  const InputDialog({
    super.key,
    this.cancelText = _defaultCancelText,
    this.okText = _defaultOkText,
    this.title = _defaultTitle,
    this.initialValue = '',
  });

  /// Shows the dialog and returns the input string or `null` on cancel.
  static Future<String?> show({
    required BuildContext context,
    String cancelText = _defaultCancelText,
    String okText = _defaultOkText,
    String title = _defaultTitle,
    String initialValue = '',
  }) async {
    return showDialog(
      context: context,
      builder: (_) => InputDialog(
        cancelText: cancelText,
        okText: okText,
        title: title,
        initialValue: initialValue,
      ),
    );
  }

  @override
  State<InputDialog> createState() => _InputDialogState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('cancelText', cancelText));
    properties.add(StringProperty('okText', okText));
    properties.add(StringProperty('title', title));
  }
}

class _InputDialogState extends State<InputDialog> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: StyledTitle(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        onSubmitted: (_) => _ok(),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: StyledText(widget.cancelText),
        ),
        ElevatedButton(
          onPressed: _ok,
          child: StyledText(widget.okText),
        ),
      ],
    );
  }

  void _ok() {
    Navigator.pop(context, _controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
