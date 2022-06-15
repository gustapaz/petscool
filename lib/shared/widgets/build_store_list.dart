import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/shared/widgets/data/store_data.dart';

class BuildStoreList extends StatefulWidget {
  final StoreModel store;
  final void Function() onTap;

  const BuildStoreList({
    Key? key,
    required this.store,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BuildStoreList> createState() => _BuildStoreListState();
}

class _BuildStoreListState extends State<BuildStoreList> {
  @override
  Widget build(BuildContext context) {
    Color colorSelected = Colors.red;
    Color colorUnselected = const Color(0xFF848599);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: widget.onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.all(5),
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
                widget.store.avatar,
                width: 48,
              ),
            ),
          ),
          title: Text(
            widget.store.name,
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
                    ' ${widget.store.rating}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFEB884B),
                    ),
                  ),
                  Text(
                    ' • ${widget.store.typeOfEstablishment} • ${widget.store.distance} km',
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
                    '${widget.store.averageDeliveryTime} min • ',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF848599),
                    ),
                  ),
                  Text(
                    'R\$ ${widget.store.shippingPrice}',
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
                widget.store.favorite = !widget.store.favorite;
              });
            },
            icon: SvgPicture.asset(
              'icons/favorite.svg',
              width: 24,
              color: (widget.store.favorite) ? colorSelected : colorUnselected,
            ),
          ),
        ),
      ),
    );
  }
}
