import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  final bool isFavorite;
  final bool isPopular;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.imageUrl,
    required this.isFavorite,
    required this.isPopular,
    required this.price,
    required this.productCategoryName,
    required this.quantity,
  });
}

class ProductProvider with ChangeNotifier {
  // List<Product> _products = [   
  //   Product(
  //       id: 'Samsung1',
  //       title: 'Spider-Man: No Way Home (4K UHD) (1-Disc)',
  //       description:
  //           'Starring: Tom Holland , Zendaya , J.K. Simmons and Benedict Cumberbatch',
  //       price: 50.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/81Mm0D7ygEL._AC_UY218_.jpg',
  //       brand: 'Marvel',
  //       productCategoryName: 'Action',
  //       quantity: 65,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Samsung Galaxy A10s',
  //       title:
  //           'Disney Pixar Finding Dory Book and CD: With Original Movie Voices',
  //       description: 'Ages: 3 - 6 years',
  //       price: 50.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/51-4rpeyWmL._AC_UY218_.jpg',
  //       brand: 'Disney',
  //       productCategoryName: 'Adventure',
  //       quantity: 1002,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Samsung Galaxy A51',
  //       title: 'Disney Winnie the Pooh The Original Movie Collection (CD)',
  //       description: 'Ages: 5 years and up',
  //       price: 50.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71dNnYT-woL._AC_UY218_.jpg',
  //       brand: 'Disney',
  //       productCategoryName: 'Adventure',
  //       quantity: 6423,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Apple MacBook Air',
  //       title:
  //           'Disney Movie Collection Five Spectacular Stories (5 Titles + CD)',
  //       description: 'by Parragon Books',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71i15aS+51L._AC_UY218_.jpg',
  //       brand: 'Disney',
  //       productCategoryName: 'Adventure',
  //       quantity: 815,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Apple MacBook Progag',
  //       title: 'Waqt Ki Awaz Hindi Movie VCD 2 Disc Pack + 1 Free CD',
  //       description:
  //           'Starring: Mithun Chakraborthy , Sri Devi , Kadar Khan and Shakti Kapoor',
  //       price: 700.89,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71JF3tSs7SL._AC_UY218_.jpg',
  //       brand: 'Nollywood',
  //       productCategoryName: 'Action',
  //       quantity: 815,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Apple MacBook Air',
  //       title: 'Joy Ride',
  //       description: '2001 | Ages 13 and Older | CC',
  //       price: 780.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/81Ulm5KkgFL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Action',
  //       quantity: 4455,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Apple 16 MacBook Pro',
  //       title: 'Coraline Movie Tie-In CD',
  //       description: 'Ages: 10 - 12 years',
  //       price: 800.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/51gzElKxuuL._AC_UY218_.jpg',
  //       brand: ' Neil Gaiman',
  //       productCategoryName: 'Adventure',
  //       quantity: 885,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Sofa Setttt',
  //       title: 'Ab aani Cd',
  //       description: '2020 | All Ages | CC',
  //       price: 650.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/91iF8iJd2aL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Comedy',
  //       quantity: 91,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Furniture Classroom with Teacher\'s',
  //       title: 'World War Z/Star Trek into Darkness',
  //       description: 'Blu-ray',
  //       price: 120.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71519VMe62L._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Action',
  //       quantity: 815,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Sofa Couch for Two People',
  //       title: 'Best of Nutan',
  //       description: 'DVD',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/510LLaqVBeL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Romance',
  //       quantity: 8100,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Delta Children Plastic Toddler Bed',
  //       title: '15 Eagle Movie Video CD Set + 5 Free Movie VCDs Vol 3',
  //       description: 'Video CD',
  //       price: 127.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/816Lyw7SNUL._AC_UY218_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Multiple',
  //       quantity: 9145,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Outdoor Patio ',
  //       title: 'They Live - English Full Movie VCD + 1 FREE CD ',
  //       description: 'Video CD',
  //       price: 1224.88,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71yACHK735L._AC_UY218_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Horror',
  //       quantity: 25,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Flash Furniture Nantucket 6 Piece',
  //       title: 'Gentleman - Hindi Full Movie VCD + 1 FREE CD',
  //       description: 'Video CD',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/61YBTIZ0kML._AC_UY218_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Comedy',
  //       quantity: 651,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
  //       title: 'Disney Movie Night Read-Along Storybook',
  //       description:
  //           'by Disney Book Group and Disney Storybook Art Team | 9 October 2018',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71EK5PwGpxL._AC_UY218_.jpg',
  //       brand: 'Disney',
  //       productCategoryName: 'Adventure',
  //       quantity: 594,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Ashley Furniture Signature Design',
  //       title: 'Nehru - The Jewel of India [Movie DVD]',
  //       description:
  //           'by Amitabh Bachchan, Pratap Sharma, anuja,, Girish Karnad, Rita Bhaduri, Anupam Kher,, et al. | 2005',
  //       price: 300.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71s+EP2CvJL._AC_UY218_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Documentary',
  //       quantity: 78,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Apple Watch Series 3',
  //       title: 'Rang De Basanti Hindi Movie VCD 2 Disc Pack + 1 FREE CD',
  //       description: 'Video CD',
  //       price: 100.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/910+WzCtTvL._AC_UY218_.jpg',
  //       brand: 'No Brand',
  //       productCategoryName: 'Drama',
  //       quantity: 156,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Garmin Forerunner 45S',
  //       title: 'Khadgam (ఖడ్గం) Full Telugu Movie DVD + 1 FREE CD',
  //       description: 'DVD',
  //       price: 86.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/91P1+wM0V3L._AC_UY218_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Drama',
  //       quantity: 142,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Samsung Galaxy Watch Active 2',
  //       title:
  //           'Maa Pallelo Gopaludu (మా పల్లెలో గోపాలుడు) Full Telugu Movie DVD + 1 FREE CD',
  //       description: 'DVD',
  //       price: 300.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/81BQAifBAEL._AC_UY218_.jpg',
  //       brand: 'No Brand',
  //       productCategoryName: 'Drama',
  //       quantity: 167,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Garmin vivoactive 4S',
  //       title: 'Mr. Bean: Live Action Vol. 2',
  //       description: 'DVD',
  //       price: 40.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/81hmKL5XTnL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Comedy',
  //       quantity: 659,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Patek Philippe World',
  //       title: 'Mark Wahlberg Collection - The Italian Job + Shooter',
  //       description: 'DVD',
  //       price: 20.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/51bPDdxunfL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Action',
  //       quantity: 98,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Bell & Ross Men',
  //       title:
  //           'Seven Worlds, One Planet 4K ULTRA HD + BLU RAY [2019] UK IMPORT REGION FREE',
  //       description: 'Blu-ray',
  //       price: 33.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71dSarchCwL._AC_UY218_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Adventure',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'New Apple Watch Series',
  //       title: 'Voyage to the Bottom of the Sea',
  //       description: 'DVD',
  //       price: 400.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/81KVpUaF+EL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Adventure',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'New Apple Watch SE',
  //       title: 'Malli Malli Idi Rani Roju Telugu Full Movie DVD + 1 FREE CD',
  //       description: 'DVD',
  //       price: 200.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/91RAc4usZ3L._AC_UY218_.jpg',
  //       brand: 'DVD',
  //       productCategoryName: 'Romance',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'YAMAY Smart Watch 2020 Ver',
  //       title:
  //           'Pokemon the Movie: Genesect and the Legend Awakened (Pokémon: the Movie)',
  //       description:
  //           'by Momota Inoue , Satoshi Tajiri, et al. | 3 December 2013',
  //       price: 183.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/811biCjkDgL._AC_UY218_.jpg',
  //       brand: 'Prime Video',
  //       productCategoryName: 'Adventure',
  //       quantity: 56,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy Watch Active 23',
  //       title: 'Sutradharulu (సూత్రధారులు) Full Telugu Movie DVD + 1 FREE CD ',
  //       description: 'DVD',
  //       price: 150.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/91nt-QRBpHL._AC_UY218_.jpg',
  //       brand: 'No Brand',
  //       productCategoryName: 'Romance',
  //       quantity: 78,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy Watch 3',
  //       title: 'The Prince of Kro-Tan (Movie VCD)',
  //       description: 'by Various Artists | 2006',
  //       price: 184.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/715StveSO0L._AC_UY218_.jpg',
  //       brand: 'No Brand',
  //       productCategoryName: 'Drama',
  //       quantity: 9598,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy Watch Active2 ',
  //       title: 'Dil Ne Phir Yaad Kiya - Hindi Full Movie VCD + 1 FREE CD ',
  //       description: 'Video CD',
  //       price: 120.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/71vcZCjg1OL._AC_UY218_.jpg',
  //       brand: 'No Brand',
  //       productCategoryName: 'Drama',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Huawei Watch 2 Sport Smartwatch',
  //       title: 'Mere Hamdam Mere Dost Hindi Movie VCD 2 Disc Pack +1 Free CD',
  //       description: 'Video CD',
  //       price: 180.99,
  //       imageUrl:
  //           'https://m.media-amazon.com/images/I/81mrjV-OGdL._AC_UY218_.jpg',
  //       brand: 'No Brand',
  //       productCategoryName: 'Drama',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: true),
  // ];

   List<Product> _products = [];

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      productSnapshot.docs.forEach((element) {
        _products.insert(
          0,
          Product(
            id: element.get('productId'),
            title: element.get('productTitle'),
            brand: element.get('productBrand'),
            description: element.get('productDescription'),
            imageUrl: element.get('productImage'),
            price: double.parse(element.get('productPrice')),
            productCategoryName: element.get('productCategory'),
            quantity: int.parse(element.get('productQuantity')),
            isFavorite: false,
            isPopular: false,
          ),
        );
      });
    });
  }

  List<Product> products() => _products;

  List<Product> getByCatName(String catName) {
    List<Product> catList = _products
        .where((element) =>
            element.productCategoryName.toLowerCase() == catName.toLowerCase())
        .toList();
    return catList;
  }

  List<Product> getByBrandName(String brandName) {
    List<Product> catList = _products
        .where(
            (element) => element.brand.toLowerCase() == brandName.toLowerCase())
        .toList();
    return catList;
  }

  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  Product getById(String prodId) {
    return _products.firstWhere((element) => element.id == prodId);
  }

  List<Product> getBySearch(String search) {
    List<Product> prodList = _products
        .where((element) =>
            element.title.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
    return prodList;
  }
}