
class UboardingContent {
  String image;
  String title;
  String description;
  UboardingContent({
    required this.description,
    required this.title,
    required this.image,
  });
}

List<UboardingContent> contents = [
  UboardingContent(
      description: "Pick your food from our menu\n   More then 35 times",
      title: 'select from Our\n   Best Menu',
      image: "images/screen1.png"),
  UboardingContent(
      description: "Youe can pay on Cash and\n make a payment onnline",
      title: 'Easy and Online payment',
      image: "images/screen2.png"),
       UboardingContent(
      description: "Deliver your food at your\n      Doorsteep",
      title: 'Quick Delivery at your Doorstep',
      image: "images/screen3.png"),
];
