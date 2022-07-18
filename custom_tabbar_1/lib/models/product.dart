class Product {
  final String name;
  final String decription;
  final String imageUrl;
  final category;

  const Product(this.name, this.decription, this.imageUrl, this.category);
}

// sample data
List<Product> productList = [
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=1', 1),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=2', 1),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=3', 1),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=4', 2),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=5', 2),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=6', 2),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=7', 3),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=8', 3),
  Product('At sanctus.', 'Diam sit magna sadipscing clita.',
      'https://picsum.photos/200/300?blur=9', 3),
];
