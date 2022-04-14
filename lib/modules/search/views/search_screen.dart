import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/shared/widgets/store_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Store> stores;
  String query = '';

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    stores = storeList;
  }

  void searchStore(String query) {
    final stores = storeList.where((store) {
      final nameLower = store.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.stores = stores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Encontre tudo o que você precisa para o seu pet...',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            buildSearchbar(),
            const SizedBox(height: 40),
            (query.isEmpty) ? buildDefaultSearchScreen() : buildSearchList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSearchbar() {
    Widget? closeButton;

    if (query.isEmpty) {
      closeButton = null;
    } else {
      closeButton = Padding(
        padding: const EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: () {
            setState(() {
              query = '';
              searchController.clear();
            });
          },
          child: const Icon(
            Icons.close,
            color: Color(0xFF545566),
          ),
        ),
      );
    }

    return Container(
      height: 58,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE6E7F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: searchController,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        //controller: controller,
        decoration: InputDecoration(
          hintText: 'Pesquisar item ou loja...',
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF545566),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              'icons/search.svg',
              color: const Color(0xFF642CA9),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 30,
            maxWidth: 30,
          ),
          suffixIcon: closeButton,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 30,
            maxWidth: 30,
          ),
        ),
        //style: style,
        onChanged: searchStore,
      ),
    );
  }

  Widget buildDefaultSearchScreen() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGenericBox('Cachorros', 'images/dog_box.png'),
            buildGenericBox('Gatos', 'images/cat_box.png'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGenericBox('Passaros', 'images/bird_box.png'),
            buildGenericBox('Peixes', 'images/fish_box.png'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGenericBox('Roedores', 'images/rodent_box.png'),
            buildGenericBox('Rações', 'images/food_box.png'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGenericBox('Medicamentos', 'images/medicine_box.png'),
            buildGenericBox('Acessórios', 'images/accessory_box.png'),
          ],
        ),
      ],
    );
  }

  Widget buildGenericBox(String title, String imageUrl) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF642CA9),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xFF545566),
              ),
            ),
            const SizedBox(height: 15),
            Image.asset(imageUrl),
          ],
        ),
      ),
    );
  }

  Widget buildSearchList() {
    Widget? content;

    if (stores.isNotEmpty) {
      content = SizedBox(
        height: 70 * stores.length.toDouble(),
        child: Expanded(
          child: ListView.builder(
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];

              return buildStore(store);
            },
          ),
        ),
      );
    } else {
      content = Center(
        child: Column(
          children: [
            Image.asset('images/not_found.png'),
            const SizedBox(height: 10),
            const Text(
              'Não encontrou nada!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }

    return content;
  }

  Widget buildStore(Store store) {
    Color colorSelected = Colors.red;
    Color colorUnselected = const Color(0xFF848599);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: const Color(0xFF935DD6),
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              store.avatar!,
              width: 48,
            ),
          ),
        ),
        title: Text(
          store.name!,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        subtitle: (Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'icons/rating.svg',
                  width: 12,
                ),
                Text(
                  ' ${store.rating!}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFEB884B),
                  ),
                ),
                Text(
                  ' • ${store.typeOfEstablishment!} • ${store.distance!} km',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF848599),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${store.averageDeliveryTime!} min • ',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF848599),
                  ),
                ),
                Text(
                  'R\$ ${store.shippingPrice!}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF26B872),
                  ),
                ),
              ],
            ),
          ],
        )),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              store.favorite = !store.favorite!;
            });
          },
          icon: SvgPicture.asset(
            'icons/favorite.svg',
            width: 24,
            color: (store.favorite!) ? colorSelected : colorUnselected,
          ),
        ),
      ),
    );
  }
}
