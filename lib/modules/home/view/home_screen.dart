import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/shared/widgets/build_store_list.dart';
import 'package:test/shared/widgets/data/customer_data.dart';
import 'package:test/shared/widgets/carousel_list.dart';
import 'package:test/shared/widgets/data/store_data.dart';

class HomeScreen extends StatefulWidget {
  final CustomerModel customer;

  const HomeScreen({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<StoreModel> stores;
  late List<Carousel> carousels;
  int activeIndexCarousel = 0;
  int activeIndexScreen = 0;
  bool activeFavorite = false;
  Widget? content;

  @override
  void initState() {
    super.initState();

    stores = storeList;
    carousels = carouselList;
  }

  @override
  Widget build(BuildContext context) {
    content ??= homeContent();

    return content!;
  }

  Widget homeContent() {
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
                  height: 80 * stores.length.toDouble(),
                  child: Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: stores.length,
                      itemBuilder: ((context, index) {
                        final store = stores[index];

                        return BuildStoreList(
                          store: store,
                          onTap: () {
                            setState(() {
                              content = storeContent(store);
                            });
                          },
                        );
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

  Widget storeContent(StoreModel store) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      content = null;
                    });
                  },
                  icon: SvgPicture.asset('icons/left_arrow.svg'),
                ),
                Text(
                  store.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset('icons/store.svg'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffCED0E0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('images/toca_do_bicho_expanded.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'icons/location.svg',
                      width: 24,
                      color: const Color(0xFF642CA9),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.address,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF545566),
                          ),
                        ),
                        Text(
                          '${store.city} - ${store.state}',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF545566),
                          ),
                        ),
                        Text(
                          store.cep,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF545566),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFE6E7F0),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'icons/rating.svg',
                        width: 12,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        store.rating,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFEB884B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
