class CustomElevated Button extends StatelessWidget {
final VoidCallback onPressed;
final String text;
final Color backgroundColor;
final Color textColor;

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  CustomElevatedButton({
required this.onPressed,
 required this.text,
 required this.backgroundColor,
 required this.textColor,
});
  @override
  Widget build (BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
          shape: Rounded Rectangle Border (
          borderRadius: BorderRadius.circular (8),
    ), // Rounded RectangleBorder
    ),
    child: CText(
    text,
    type: TextType.titleMedium,
    color: textColor,
    fontSize: 14.0,
    ),
    );
  }
}