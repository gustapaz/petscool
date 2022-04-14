class Store {
  final String? avatar;
  final String? name;
  //final String? address;
  final String? typeOfEstablishment;
  final String? rating;
  final String? distance;
  final String? averageDeliveryTime;
  final String? shippingPrice;
  bool? favorite;

  Store({
    this.avatar,
    this.name,
    //this.address,
    this.typeOfEstablishment,
    this.rating,
    this.distance,
    this.averageDeliveryTime,
    this.shippingPrice,
    this.favorite,
  });
}

List<Store> storeList = [
  Store(
    avatar: 'images/toca_do_bicho.png',
    name: 'Toca do Bicho',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,9',
    distance: '6,2',
    averageDeliveryTime: '60 - 90',
    shippingPrice: '12,00',
    favorite: false,
  ),
  Store(
    avatar: 'images/vida_animal.png',
    name: 'Vida Animal',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,6',
    distance: '6',
    averageDeliveryTime: '60 - 90',
    shippingPrice: '8,00',
    favorite: false,
  ),
  Store(
    avatar: 'images/ponto_cao.png',
    name: 'Ponto Cão',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,9',
    distance: '4,2',
    averageDeliveryTime: '30 - 50',
    shippingPrice: 'Grátis', favorite: false,
  ),
  Store(
    avatar: 'images/petz.png',
    name: 'Petz',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,9',
    distance: '5,4',
    averageDeliveryTime: '40 - 60',
    shippingPrice: '7,00',
    favorite: false,
  ),
  Store(
    avatar: 'images/pet_sa.png',
    name: 'Pet S/A',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,6',
    distance: '5',
    averageDeliveryTime: '30 - 60',
    shippingPrice: '6,00',
    favorite: false,
  ),
  Store(
    avatar: 'images/pet_shop_da_vivi.png',
    name: 'Pet Shop da Vivi',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,7',
    distance: '4,4',
    averageDeliveryTime: '20 - 45',
    shippingPrice: 'Grátis', favorite: false,
  ),
  Store(
    avatar: 'images/bemase_pet_shop.png',
    name: 'Bemase Pet Shop',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '5,0',
    distance: '6,3',
    averageDeliveryTime: '60 - 90',
    shippingPrice: '8,00',
    favorite: false,
  ),
  Store(
    avatar: 'images/uniao_pet_shop.png',
    name: 'União Pet Shop',
    //address: '',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,8',
    distance: '3,9',
    averageDeliveryTime: '20 - 35',
    shippingPrice: 'Grátis', favorite: false,
  ),
];
