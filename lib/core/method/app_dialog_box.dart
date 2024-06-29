typedef DialogActionCallback=void Function();
class DialogClass{
  static Future<bool> showConfirmDialog({
    required BuildContext context,
    required String message,
    String? titleMsg,
    String? leftButtonText,
    String? rightButtonText,
    DialogActionCallback? onLeftButtonTap,
    DialogActionCallback? onRightButtonTap,
    TextType? leftBtnTextType,
    TextType? rightBtnTextType,
    TextType? titleType,
    Widget? messageWidget,
    String? icon,
    bool? showIcon,
  })
  async{
    return await showDialog<bool>(context:context,
    builder:(BuildContext context){
      List<Widget> actions = [];
      if (leftButtonText != null && onLeftButtonTap != null) 
        {
          actions.add(
            ReusableButton(
              text: leftButtonText,
              onPressed: () => onLeftButtonTap(),
              fontWeight: FontWeight.w600,
              textColor: AppColors.black,
              backgroundColor: AppColors.greyStroke,
              borderColor: AppColors.white,
            ),
          );
        }

        if (leftButtonText != null && rightButtonText != null) 
        {
          actions.add(
              const SizedBox(width: 16)); // Adjustable space between buttons
        }
        if (rightButtonText != null && onRightButtonTap != null) {
          actions.add(
            ReusableButton(
              text: rightButtonText,
              fontWeight: FontWeight.w600,
              onPressed: () => onRightButtonTap(),
              // backgroundGradient: AppColors.buttonGradientColor,
              textColor: AppColors.black,
            ),
          );
        }

        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                SvgPicture.asset(
                  icon,
                ),
              titleMsg != null
                  ? CText(titleMsg, type: titleType ?? TextType.titleLarge)
                  : const SizedBox.shrink(),
            ],
          ),

          content: SingleChildScrollView(
            child: messageWidget ?? const SizedBox.shrink(),
          ),
          actionsAlignment: MainAxisAlignment.center,

          actions: [
            if (actions.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: actions,
                ),
              ),
          ]
          actionsPadding: const EdgeInsets.symmetric(
              horizontal: 12.0, vertical: 8.0),
        );
    },
    );
  }
}