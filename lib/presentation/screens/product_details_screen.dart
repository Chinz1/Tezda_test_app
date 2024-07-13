import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tezda_app/widgets/animated_column.dart';
import 'package:tezda_app/widgets/description_widget.dart';
import 'package:tezda_app/widgets/label_widget.dart';

class ProductDetails extends StatefulWidget {
  final String imagePath;
  const ProductDetails({super.key, required this.imagePath});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final description = [
     "Name: Men's denim hoodies jackets",
     "Material: Denim Jean",
     "Style: International Regular style",
     "Features: Soft ,Comfortable,Beathable.",
     "Occasions: Causal wearing",
     "Color: As main picture shows",
     "Size: M, L ,XL,XXL,3XL"
  ];
  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           TabBar(indicatorSize: TabBarIndicatorSize.tab, splashFactory: InkRipple.splashFactory,
             labelColor: Colors.teal, unselectedLabelColor: const Color(0xff4F4F4F), dividerColor: const Color(0xff4F4F4F), indicatorColor: Colors.teal,
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F), fontSize: 14),
              tabs: const [
            Tab(text: "About Items"),
            Tab(text: "Reviews"),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelWidget(widgetKey: "Brand: ", widgetValue: "Dolce & Gabanna"),
                      LabelWidget(widgetKey: "Size: ", widgetValue: "54L"),
                    ],
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelWidget(widgetKey:"Material: ", widgetValue: "Jean"),
                      LabelWidget(widgetKey: "Delivery fee: ", widgetValue: "\$3.0"),
                    ],
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelWidget(widgetKey:"Item: ", widgetValue: "New"),
                      LabelWidget(widgetKey: "Availability Status: ", widgetValue: "Available"),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("Description", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 10,),
                  ...List.generate(description.length, (index){
                    return DescriptionWidget(description: description[index]);
                  })
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelWidget(widgetKey: "Brand: ", widgetValue: "Dolce & Gabanna"),
                      LabelWidget(widgetKey: "Size: ", widgetValue: "54L"),
                    ],
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelWidget(widgetKey:"Material: ", widgetValue: "Jean"),
                      LabelWidget(widgetKey: "Delivery fee: ", widgetValue: "\$3.0"),
                    ],
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelWidget(widgetKey:"Item: ", widgetValue: "New"),
                      LabelWidget(widgetKey: "Availability Status: ", widgetValue: "Available"),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("Description", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 10,),
                  ...List.generate(description.length, (index){
                    return DescriptionWidget(description: description[index]);
                  })
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          bottomNavigationBar: Container(height: 80, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.maxFinite, color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total Price", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F),),),
                    Text("\$18.00", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.teal, fontSize: 25),)
                  ],
                ),
                Row(
                  children: [
                    Container(decoration: const BoxDecoration(color: Colors.teal,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))), height: 60, width: 80,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        const Icon(Iconsax.shopping_cart, color: Colors.white,),
                        Text("1",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),)
                      ],),
                    ),
                    Container(decoration: const BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))), height: 60, width: 130,
                      child: Center(child: Text("Buy Now", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),)),
                    ),
                    Container(),
                  ],
                )
              ],
            ),),
          appBar: AppBar(
            backgroundColor: Colors.white, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
                child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon( Icons.favorite, size: 20, color: Colors.red,),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon( Icons.share_outlined, size: 20,),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon( Iconsax.shop, size: 20,),
              ),
            ],
          ),
      body: AnimatedColumn(padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
        ClipRRect(borderRadius: BorderRadius.circular(16),
          child: Container(
            // margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height/ 2.4, width: double.maxFinite,
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            const Icon(Iconsax.shop, size: 20, color: Color(0xff4F4F4F),),
            const SizedBox(width: 10,),
            Text("tokobaju.id", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F), fontSize: 15),)
          ],
        ),
        const SizedBox(height: 10,),
        Text("Essential Mem's Short Sleeve",textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),
        const SizedBox(width: 8,),
        Text("Crewneck T-Shirt",textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
        const SizedBox(height: 10,),
         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber,),
                const SizedBox(width: 5,),
                Text("4.9 Rating", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F), fontSize: 14),),
              ],
            ),
            Container(height: 3, width: 3, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),),
            Text("2.3k+ Reviews", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F), fontSize: 14),),
            Container(height: 3, width: 3, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),),
            Text("2.9k+ Sold", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F), fontSize: 14),)
          ],
        ), _tabSection(context),
      ])
      ),
    );
  }
}
