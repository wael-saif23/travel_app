class CategoryModel {
  final String imageUrlOrPath;
  final String? title;
  final String? subTitle;
  final bool? isMarked;
  final double? price;
  final double? rating;

  const CategoryModel(
      {required this.imageUrlOrPath,
      this.title,
      this.subTitle,
      this.isMarked,
      this.price,
      this.rating});
}
