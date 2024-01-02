import 'package:flutter/services.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthOTPNumbersBuilderWidget extends StatefulWidget {
  const AuthOTPNumbersBuilderWidget({super.key});

  @override
  State<AuthOTPNumbersBuilderWidget> createState() =>
      _AuthOTPNumbersBuilderWidgetState();
}

class _AuthOTPNumbersBuilderWidgetState
    extends State<AuthOTPNumbersBuilderWidget> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  late FocusNode _fifthFocusNode;
  late FocusNode _sixthFocusNode;

  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;
  late TextEditingController _fourthController;
  late TextEditingController _fifthController;
  late TextEditingController _sixthController;

  String otpNumber = '';

  @override
  void initState() {
    super.initState();

    _initializeFocusNodes();

    _initializeControllers();
  }

  @override
  void dispose() {
    super.dispose();

    _disposeFocusNodes();

    _disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextField(
          context: context,
          focusNode: _firstFocusNode,
          controller: _firstController,
          nextFocusNode: _secondFocusNode,
          nextController: _secondController,
        ),
        _buildTextField(
          context: context,
          focusNode: _secondFocusNode,
          controller: _secondController,
          nextFocusNode: _thirdFocusNode,
          nextController: _thirdController,
          previousFocusNode: _firstFocusNode,
        ),
        _buildTextField(
          context: context,
          focusNode: _thirdFocusNode,
          controller: _thirdController,
          nextFocusNode: _fourthFocusNode,
          nextController: _fourthController,
          previousFocusNode: _secondFocusNode,
        ),
        SizedBox(
          width: 20.w,
        ),
        _buildTextField(
          context: context,
          focusNode: _fourthFocusNode,
          controller: _fourthController,
          nextFocusNode: _fifthFocusNode,
          nextController: _fifthController,
          previousFocusNode: _thirdFocusNode,
        ),
        _buildTextField(
          context: context,
          focusNode: _fifthFocusNode,
          controller: _fifthController,
          nextFocusNode: _sixthFocusNode,
          nextController: _sixthController,
          previousFocusNode: _fourthFocusNode,
        ),
        _buildTextField(
          context: context,
          focusNode: _sixthFocusNode,
          controller: _sixthController,
          previousFocusNode: _fifthFocusNode,
        ),
      ],
    );
  }

  void _initializeFocusNodes() {
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
    _fifthFocusNode = FocusNode();
    _sixthFocusNode = FocusNode();
  }

  void _initializeControllers() {
    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
    _fourthController = TextEditingController();
    _fifthController = TextEditingController();
    _sixthController = TextEditingController();
  }

  void _disposeFocusNodes() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
  }

  void _disposeControllers() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
  }

  _buildTextField({
    required BuildContext context,
    required FocusNode focusNode,
    required TextEditingController controller,
    TextEditingController? nextController,
    FocusNode? nextFocusNode,
    FocusNode? previousFocusNode,
  }) {
    return Container(
      width: 0.1.sw,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: TextFormField(
        enabled: true,
        readOnly: false,
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: kPrimaryColor,
              fontWeight: kFontWeightBold,
            ),
        buildCounter: (
          BuildContext context, {
          int? currentLength,
          int? maxLength,
          bool? isFocused,
        }) =>
            null,
        cursorColor: kTextDarkColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextDarkColor,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextDarkColor,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextDarkColor,
              width: 2,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorColor,
              width: 2,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorColor,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          if (value == ' ') {
            controller.clear();
            return;
          }
          if (value.isEmpty && previousFocusNode != null) {
            previousFocusNode.requestFocus();
          }
          if (value.length == 1 && nextFocusNode != null) {
            focusNode.unfocus();
            nextFocusNode.requestFocus();
            nextController!.clear();
          }
        },
        onFieldSubmitted: (value) {
          if (nextFocusNode == null) {
            focusNode.unfocus();
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
