






classa RecentlyAdded extends StatelessWidget{
  const RecentlyAdded({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppSpacing.verticalSpaceLarge,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: CText(
          "Recently Added",
          type: TextType.displayLarge,
          color: AppColors.darkBlue,
          ), //CText
          ), //Padding
          ///Horizontal property list
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          )
)
]
    )
}
}