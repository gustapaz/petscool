class CustomerModel {
  String? id;
  String email;
  String password;
  String name;
  String cpf;
  String phone;
  String? address;
  String? cep;
  String? city;
  String? state;

  CustomerModel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.cpf,
    required this.phone,
    this.address,
    this.cep,
    this.city,
    this.state,
  });
}

List<CustomerModel> allCustomer = [
  CustomerModel(
    id: '1',
    email: 'cliente1@gmail.com',
    password: '123456',
    name: 'Primeiro Cliente',
    cpf: '12345678901',
    phone: '987654321',
    address: 'Rua 1',
    cep: '12345678',
    city: 'Sarandi',
    state: 'Paraná',
  ),
  CustomerModel(
    id: '2',
    email: 'cliente2@gmail.com',
    password: '123456',
    name: 'Segundo Cliente',
    cpf: '12345678901',
    phone: '987654321',
    address: 'Rua 2',
    cep: '12345678',
    city: 'Maringá',
    state: 'Paraná',
  ),
];
