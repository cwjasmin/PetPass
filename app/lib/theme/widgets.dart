// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petpassflutter/theme/colors.dart';
import 'package:petpassflutter/theme/texts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final double width;
  final double height;
  final bool isIconVisible;
  final Color unfocusedBorderColor;
  final Color focusedBorderColor;
  final Color unfocusedTextColor;
  final Color focusedTextColor;
  final Color colorTextField;
  final bool isobscureText;
  final TextEditingController? controller; 

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.icon,
      this.controller,
      this.width = 300,
      this.height = 42,
      this.isIconVisible = true,
      this.unfocusedBorderColor = Colors.grey,
      this.focusedBorderColor = Colors.blue,
      this.unfocusedTextColor = Colors.black,
      this.focusedTextColor = Colors.blue,
      this.colorTextField = const Color(0xFFE5FDFF),
      this.isobscureText = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _internalController = widget.controller ?? TextEditingController();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 300, minHeight: 42),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.colorTextField,
          border: const Border(
            top: BorderSide(color: WidgetColors.textDark, width: 1.5),
            right: BorderSide(color: WidgetColors.textDark, width: 3),
            bottom: BorderSide(color: WidgetColors.textDark, width: 3),
            left: BorderSide(color: WidgetColors.textDark, width: 1.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: TextField(
        controller: _internalController,
        obscureText: widget.isobscureText,
        focusNode: _focusNode,
        style: AppTextStyles.bodyBase.copyWith(
          color: _isFocused
              ? WidgetColors.textAccent
              : WidgetColors.textAccentTrans,
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: widget.height / 4, horizontal: 12),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: _isFocused
                ? widget.focusedTextColor.withOpacity(0.6)
                : widget.unfocusedTextColor.withOpacity(0.6),
          ),
          prefixIcon: widget.isIconVisible
              ? Icon(
                  widget.icon,
                  color: const Color.fromARGB(50, 1, 1, 1),
                  size: 16,
                )
              : null,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isIconVisibleLeft;
  final bool isIconVisibleRight;
  final IconData? iconleft;
  final IconData? iconright;
  final double width;
  final double height;
  final double borderRadius;
  final bool isTransparent;
  final VoidCallback onPressed;
  final Color colorBtn;
  final Color colorTxt;

  const CustomButton({
    super.key,
    required this.text,
    this.isIconVisibleLeft = false,
    this.isIconVisibleRight = false,
    this.iconleft,
    this.iconright,
    this.width = 200,
    this.height = 50,
    this.borderRadius = 8,
    this.isTransparent = false,
    this.colorBtn = WidgetColors.primaryColor,
    this.colorTxt = WidgetColors.textDark,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isTransparent ? 0.26 : 1,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: WidgetColors.textDark,
          border: const Border(
            top: BorderSide(color: WidgetColors.textDark, width: 1.5),
            right: BorderSide(color: WidgetColors.textDark, width: 3),
            bottom: BorderSide(color: WidgetColors.textDark, width: 3),
            left: BorderSide(color: WidgetColors.textDark, width: 1.5),
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRect(
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius - 2),
                  ),
                  backgroundColor: colorBtn),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isIconVisibleLeft && iconleft != null) Icon(iconleft),
                  SizedBox(
                      width: isIconVisibleLeft && iconleft != null ? 8.0 : 0),
                  Text(
                    text,
                    style: AppTextStyles.bodyBase.copyWith(color: colorTxt),
                  ),
                  SizedBox(
                      width: isIconVisibleRight && iconright != null ? 8.0 : 0),
                  if (isIconVisibleRight && iconright != null) Icon(iconright),
                ],
              )),
        ),
      ),
    );
  }
}

class CardVert extends StatelessWidget {
  final String? portada;
  final String title;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  const CardVert(
      {Key? key,
      this.onPressed,
      this.onLongPressed,
      this.portada =
          "https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg",
      this.title = "Title Concurso;"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressed,
      onTap: onPressed,
      child: Container(
        width: 156,
        height: 173,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 157,
              width: 153,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(portada!),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print("Error loading image: $exception");
                    }),
                border: const Border(
                  top: BorderSide(color: WidgetColors.textDark, width: 1.5),
                  right: BorderSide(color: WidgetColors.textDark, width: 3),
                  bottom: BorderSide(color: WidgetColors.textDark, width: 3),
                  left: BorderSide(color: WidgetColors.textDark, width: 1.5),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 52,
                width: 126,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: WidgetColors.textDark, width: 1.5),
                    right: BorderSide(color: WidgetColors.textDark, width: 3),
                    bottom: BorderSide(color: WidgetColors.textDark, width: 3),
                    left: BorderSide(color: WidgetColors.textDark, width: 1.5),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyBase
                        .copyWith(color: WidgetColors.textDark),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardHorizontalA extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const CardHorizontalA(
      {super.key,
      required this.onPressed,
      this.title = "Mis Participaciones",
      this.description = "Body text for whatever you’d like to say...."});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 70),
        width: 326,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: WidgetColors.textDark, width: 1.5),
            right: BorderSide(color: WidgetColors.textDark, width: 3),
            bottom: BorderSide(color: WidgetColors.textDark, width: 3),
            left: BorderSide(color: WidgetColors.textDark, width: 1.5),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.paragraphSemi
                        .copyWith(color: WidgetColors.textDark),
                  ),
                  Text(
                    description,
                    style: AppTextStyles.small
                        .copyWith(color: WidgetColors.textDisable),
                  )
                ],
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}

class CardHorizontalB extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback? onPressed;

  const CardHorizontalB({
    super.key,
    this.onPressed,
    this.title = "Mis Participaciones",
    this.description = "Body text for whatever you’d like to say....",
    this.image =
        "https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 83),
        width: 332,
        height: 83,
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            left: 33,
            child: Container(
              width: 299,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: WidgetColors.textDark, width: 1.5),
                  right: BorderSide(color: WidgetColors.textDark, width: 3),
                  bottom: BorderSide(color: WidgetColors.textDark, width: 3),
                  left: BorderSide(color: WidgetColors.textDark, width: 1.5),
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 61, top: 12, bottom: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.paragraphSemi
                          .copyWith(color: WidgetColors.textDark),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      description,
                      style: AppTextStyles.small
                          .copyWith(color: WidgetColors.textDisable),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
              child: CircleAvatar(
                radius: 41,
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
