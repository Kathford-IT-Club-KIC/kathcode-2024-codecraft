extension CapitalizeLetter on String{
  String get capitalizeFirstLetter => isEmpty?'' : this[0].toUpperCase()+substring(1);
}