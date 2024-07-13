import 'package:flutter/material.dart';
import 'package:tezda_app/presentation/screens/product_details_screen.dart';


class ProductCard extends StatefulWidget {
  final String imagePath;
  const ProductCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProductDetails(imagePath: widget.imagePath,)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: const Offset(1, 1,), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * .42,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(8),
                        child: Container(height: 100, width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text("Shirt", overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff4F4F4F))),
                      const SizedBox(height: 5,),
                      const Text("Essential Men's Short", overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xff4F4F4F))),
                      const Text("Sleeve CrewNeck T-Shirt", overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xff4F4F4F))),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star, size: 12,
                            color: Color(0xffF2994A),
                          ),
                          Text("\$12.00", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.teal, fontSize: 15, fontWeight: FontWeight.w700),)
                        ],
                      )
                      // const SizedBox(height: 20,),
                    ],
                  ),
                  const Positioned(right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.0, right: 1.0),
                        child: Icon(Icons.favorite_border, color: Colors.grey,),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
