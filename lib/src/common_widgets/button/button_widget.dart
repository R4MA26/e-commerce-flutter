import 'package:e_commarce/src/constants/constants.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  _blue,
  _wihte,
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget.blue({
    super.key,
    required this.text,
    bool? isEnabled,
    this.onTap,
    this.isSmall = false,
    this.isLoading = false,
  })  : _isEnabled = isEnabled ?? onTap != null ? true : false,
        color = ColorApp.blueOcean,
        focusColor = ColorApp.offGrey,
        textColor = ColorApp.pureWhite,
        overlayColor = ColorApp.softGrey,
        _buttonType = ButtonType._blue;

  const ButtonWidget.white({
    super.key,
    required this.text,
    bool? isEnabled,
    this.onTap,
    this.isSmall = false,
    this.isLoading = false,
  })  : _isEnabled = isEnabled ?? onTap != null ? true : false,
        color = ColorApp.pureWhite,
        textColor = ColorApp.navyBlack,
        focusColor = ColorApp.offGrey,
        overlayColor = ColorApp.softGrey,
        _buttonType = ButtonType._wihte;

  final bool _isEnabled;
  final ButtonType _buttonType;

  final VoidCallback? onTap;
  final Color color;
  final Color focusColor;
  final Color overlayColor;
  final Color textColor;
  final bool isSmall;
  final bool isLoading;
  final String text;

  Color? _getColor() {
    return _isEnabled ? color : ColorApp.halfGrey;
  }

  Color? _getFocusColor() {
    return _isEnabled ? focusColor : null;
  }

  MaterialStateProperty<Color>? _getOverlayColor() {
    return _isEnabled ? MaterialStateProperty.all(overlayColor) : null;
  }

  Widget _getLoadingWidget() {
    return const SizedBox(
      height: 18,
      width: 18,
      child: CircularProgressIndicator(),
    );
  }

  Border? _getBorder() {
    if (_isEnabled) {
      if (_buttonType == ButtonType._wihte) {
        return Border.all(color: ColorApp.navyBlack);
      } else if (_buttonType == ButtonType._blue) {
        return Border.all(color: ColorApp.pureWhite);
      }
    }
    return null;
  }

  EdgeInsets _getPadding() {
    if (isSmall) {
      return const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      );
    } else {
      return const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getColor(),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _isEnabled ? onTap : null,
        focusColor: _getFocusColor(),
        overlayColor: _getOverlayColor(),
        child: Container(
          width: isSmall ? null : double.infinity,
          padding: _getPadding(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: _getBorder(),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: isLoading,
                child: _getLoadingWidget(),
              ),
              Visibility(
                visible: !isLoading,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Text(
                  text,
                  style: TextStyle(
                    color: !_isEnabled ? Colors.grey[300] : textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
