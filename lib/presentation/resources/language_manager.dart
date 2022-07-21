enum LanguageType { ENGLISH, PERSIAN }

const String ENGLISH = "en";
const String PERSIAN = "ir";
extension LanguageTypeExtension on LanguageType {
  String  getValue(){
    switch (this){
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.PERSIAN:
        return PERSIAN;
    }
  }
}
