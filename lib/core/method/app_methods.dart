class AppMethods{
    static showFlexibleSizeBottomSheet({
        required Widget widget,
        required BuildContext context,
        bool isScrollable = true,
        bool showConstraints = true,
    }) {
        return showModalBottomSheet(
            backgroundColor: AppColors.greyStroke,
            isScrollControlled: isScrollable,
            // constraints: BoxConstraints(maxHeight: 0.70.sh),
            constraints: showConstraints ? const BoxConstraints(maxHeight: 0.70) : null,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
                ),
            ),
    };
}

static void showLoaderDialog(BuildContext context,
  {String ? txt, bool dismissable = true}) {
    AlertDialog alert = AlertDialog(
        content: Row(
            children: [
                const CircularProgressIndicator(),
                Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text(txt ?? AppStrings.loadingTxt)),
            ],
        ),
    );
    showDialog(
        barrierDismissible: dismissable,
        context: context,
        builder: (BuildContext context) {
            return alert;
        },
    );
  }