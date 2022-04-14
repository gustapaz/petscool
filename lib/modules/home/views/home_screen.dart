import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/shared/widgets/carousel_list.dart';
import 'package:test/shared/widgets/store_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Store> stores;
  late List<Carousel> carousels;
  int activeIndexCarousel = 0;
  int activeIndexScreen = 0;
  bool activeFavorite = false;

  @override
  void initState() {
    super.initState();

    stores = storeList;
    carousels = carouselList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          hoverColor: Colors.transparent,
                          child: SvgPicture.asset('icons/dog.svg'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Cachorros',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          hoverColor: Colors.transparent,
                          child: SvgPicture.asset('icons/cat.svg'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Gatos',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          hoverColor: Colors.transparent,
                          child: SvgPicture.asset('icons/bird.svg'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Pássaros',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          hoverColor: Colors.transparent,
                          child: SvgPicture.asset('icons/fish.svg'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Peixes',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 40,
            ),
            child: Text(
              'Destaques',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 120,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndexCarousel = index;
                    });
                  },
                ),
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  Carousel carousel = carousels[index];

                  return buildCarousel(carousel, index);
                },
              ),
              const SizedBox(height: 20),
              buildIndicator(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lojas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 70 * stores.length.toDouble(),
                  child: Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: stores.length,
                      itemBuilder: ((context, index) {
                        final store = stores[index];

                        return buildStore(store);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarousel(Carousel carousel, int index) {
    Color? backgroundColor;

    if (index == 0) {
      backgroundColor = const Color(0xFF642CA9);
    } else if (index == 1) {
      backgroundColor = const Color(0xFFEB884B);
    } else if (index == 2) {
      backgroundColor = const Color(0xFFA92C2C);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carousel.title!,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  carousel.description!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset('images/dog_food.png'),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndexCarousel,
      count: 3,
      effect: const SlideEffect(
        dotWidth: 8,
        dotHeight: 8,
        activeDotColor: Color(0xFF642CA9),
        dotColor: Color(0xFFC4C4C4),
      ),
    );
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
