part of 'page.dart';

class DetailPage extends StatelessWidget {


  const DetailPage(this.space);

  final SpaceModel space;

  @override
  Widget build(BuildContext context) {

    final facilities = [
      {
        'label': 'kitchen',
        'icon': 'assets/img/facilities/facilities1.png',
        'num': space.numOfKitchens,
      },
      {
        'label': 'bedroom',
        'icon': 'assets/img/facilities/facilities2.png',
        'num': space.numOfBedrooms,
      },
      {
        'label': 'cupboard',
        'icon': 'assets/img/facilities/facilities3.png',
        'num': space.numOfCupBoards,
      }
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(space.imgUrl)
              )
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: ClipOval(
                        child: Container(
                          height: 48,
                          width: 48,
                          color: Colors.white,
                          child: Icon(Icons.arrow_back_ios_rounded, color: palettes['primary'],),
                        ),
                      ),
                    ),
                    ValueBuilder<bool>(
                      initialValue: false,
                      builder: (value, update) => GestureDetector(
                        onTap: () => update(!value),
                        child: ClipOval(
                          child: Container(
                            height: 48,
                            width: 48,
                            color: Colors.white,
                            child: Icon(value ? Icons.favorite : Icons.favorite_outline, 
                              color: value ? Colors.red : palettes['primary'],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.7,
            minChildSize: 0.55,
            initialChildSize: 0.55,
            builder: (_, controller) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: ListView(
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(space.name, style: headline),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$${space.price}',
                                      style: headline.copyWith(
                                        color: palettes['primary'],
                                        fontSize: 16
                                      )
                                    ),
                                    TextSpan(
                                      text: ' / month',
                                      style: subheadline
                                    ),
                                  ]
                                )
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 4,
                          child: Wrap(
                            children: List.generate(5, (index) => Icon(Icons.star, 
                              color: space.rating > index ? palettes['accent'] : palettes['text2'],
                              size: 20,
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 24),
                    child: Text('Main Facilities', style: headline.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: facilities.map((item) => Column(
                        children: [
                          Image.asset(item['icon'].toString(),
                            height: 32,
                          ),
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(text: '${item['num']} ', style: subheadline.copyWith(
                                color: palettes['primary'],
                                fontWeight: FontWeight.normal
                              ),),
                              TextSpan(text: item['label'].toString(), style: subheadline.copyWith(
                                fontWeight: FontWeight.normal
                              ),)
                            ]
                          ))
                        ],
                      )).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 24),
                    child: Text('Photos', style: headline.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 24, top: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: space.photos.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(space.photos[index].toString(),
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location', style: headline.copyWith(fontSize: 16),),
                              Text(space.address, style: subheadline,),
                              Text(space.city, style: subheadline,),
                            ],
                          ),
                          ClipOval(
                            child: Container(
                              height: 40,
                              width: 40,
                              color: palettes['canvas'],
                              child: Icon(Icons.location_on, color: palettes['text2'],)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: FlatButton(
                      color: palettes['primary'],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12), 
                      child: const Text('Book Now', style: mainbutton,)
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}