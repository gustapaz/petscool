class StoreModel {
  String? id;
  String avatar;
  String name;
  String address;
  String cep;
  String city;
  String state;
  String typeOfEstablishment;
  String rating;
  String distance;
  String averageDeliveryTime;
  String shippingPrice;
  bool favorite;

  StoreModel({
    this.id,
    required this.avatar,
    required this.name,
    required this.address,
    required this.cep,
    required this.city,
    required this.state,
    required this.typeOfEstablishment,
    required this.rating,
    required this.distance,
    required this.averageDeliveryTime,
    required this.shippingPrice,
    required this.favorite,
  });
}

List<StoreModel> storeList = [
  StoreModel(
    avatar: 'images/toca_do_bicho.png',
    name: 'Toca do Bicho',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,9',
    distance: '6,2',
    averageDeliveryTime: '60 - 90',
    shippingPrice: '12,00',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/vida_animal.png',
    name: 'Vida Animal',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,6',
    distance: '6',
    averageDeliveryTime: '60 - 90',
    shippingPrice: '8,00',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/ponto_cao.png',
    name: 'Ponto Cão',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,9',
    distance: '4,2',
    averageDeliveryTime: '30 - 50',
    shippingPrice: 'Grátis',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/petz.png',
    name: 'Petz',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,9',
    distance: '5,4',
    averageDeliveryTime: '40 - 60',
    shippingPrice: '7,00',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/pet_sa.png',
    name: 'Pet S/A',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,6',
    distance: '5',
    averageDeliveryTime: '30 - 60',
    shippingPrice: '6,00',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/pet_shop_da_vivi.png',
    name: 'Pet Shop da Vivi',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,7',
    distance: '4,4',
    averageDeliveryTime: '20 - 45',
    shippingPrice: 'Grátis',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/bemase_pet_shop.png',
    name: 'Bemase Pet Shop',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '5,0',
    distance: '6,3',
    averageDeliveryTime: '60 - 90',
    shippingPrice: '8,00',
    favorite: false,
  ),
  StoreModel(
    avatar: 'images/uniao_pet_shop.png',
    name: 'União Pet Shop',
    address: 'Av. 1',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
    typeOfEstablishment: 'Pet Shop',
    rating: '4,8',
    distance: '3,9',
    averageDeliveryTime: '20 - 35',
    shippingPrice: 'Grátis',
    favorite: false,
  ),
];
