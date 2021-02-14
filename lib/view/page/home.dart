part of 'page.dart';

class HomePage extends StatelessWidget {

  final HomeController controller = injector.getController(
    HomeController(),
    tag: 'homeController'
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore Now', style: headline),
                  Text('Mencari kosan yang cozy', style: subheadline),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text('Popular Cities', style: headline.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 24, top: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => Get.to(DetailPage(controller.spaces[index])),
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 18),
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/popular_cities/city${index+1}.png',),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      color: palettes['canvas'],
                      child: Text('Jakarta', style: headline.copyWith(
                        fontSize: 16
                      ),),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Text('Recommended Space', style: headline.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),),
            ),
            FutureBuilder<void>(
              future: controller.getSpaces(),
              builder: (context, snapshot) => 
                snapshot.connectionState == ConnectionState.done ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: GestureDetector(
                        onTap: () => Get.to(DetailPage(controller.spaces[index])),
                        child: SizedBox(
                          height: 120,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(controller.spaces[index].imgUrl)
                                    )
                                  ),
                                  child: Container(
                                    height: 36,
                                    width: 81,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(32)
                                      ),
                                      color: palettes['primary']
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star,
                                          size: 20,
                                          color: palettes['accent'],
                                        ),
                                        Text(' ${controller.spaces[index].rating.toString()}/5', 
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(controller.spaces[index].name, style: headline.copyWith(
                                      fontSize: 18,
                                    ),),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '\$${controller.spaces[index].price}',
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
                                    const SizedBox(height: 6,),
                                    Text('${controller.spaces[index].city}, ${controller.spaces[index].country}', 
                                      style: subheadline
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ),
                ) : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SizedBox(
                        height: 120,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Skeleton(
                                height: 120,
                                width: 140,
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Skeleton(
                                    height: 48,
                                    style: SkeletonStyle.text,
                                  ),
                                  const SizedBox(height: 24,),
                                  Skeleton(
                                    height: 24,
                                    style: SkeletonStyle.text,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Text('Tips & Guidance', style: headline.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: List.generate(2, (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/img/tips/tips${index+1}.png',
                        height: 80,
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('City Guidelines', style: headline.copyWith(
                              fontSize: 18
                            ),),
                            Text('Updated 20 Apr', style: subheadline,),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded, color: palettes['text2'],)
                    ],
                  ),
                )),
              ),
            ),
            const SizedBox(height: 140,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, update) => Padding(
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: BottomNavyBar(
              selectedIndex: value,
              onItemSelected: (index) => update(index),
              backgroundColor: palettes['canvas'],
              iconSize: 30,
              containerHeight: 60,
              curve: Curves.easeOut,
              items: [
                BottomNavyBarItem(
                  title: const Text('Home'),
                  icon: const Icon(Icons.home_filled,),
                  activeColor: palettes['primary'],
                  inactiveColor: palettes['text2'],
                  textAlign: TextAlign.center
                ),
                BottomNavyBarItem(
                  title: const Text('Message'),
                  icon: const Icon(Icons.email_rounded,),
                  activeColor: palettes['primary'],
                  inactiveColor: palettes['text2'],
                  textAlign: TextAlign.center
                ),
                BottomNavyBarItem(
                  title: const Text('Notif'),
                  icon: const Icon(Icons.featured_play_list,),
                  activeColor: palettes['primary'],
                  inactiveColor: palettes['text2'],
                  textAlign: TextAlign.center
                ),
                BottomNavyBarItem(
                  title: const Text('Favorite'),
                  icon: const Icon(Icons.favorite,),
                  activeColor: palettes['primary'],
                  inactiveColor: palettes['text2'],
                  textAlign: TextAlign.center
                ),
              ],
            ),
          ),
        ),
      )
      // Container(
      //   alignment: Alignment.center,
      //   height: 72,
      //   margin: const EdgeInsets.symmetric(horizontal: 24),
      //   padding: const EdgeInsets.symmetric(horizontal: 24),
      //   decoration: BoxDecoration(
      //     color: palettes['canvas'],
      //     borderRadius: BorderRadius.circular(24),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Icon(Icons.home_filled,
      //         size: 30, 
      //         color: palettes['text2'],
      //       ),
      //       Icon(Icons.email_rounded, 
      //         size: 30,
      //         color: palettes['text2'],
      //       ),
      //       Icon(Icons.featured_play_list, 
      //         size: 30, 
      //         color: palettes['text2'],
      //       ),
      //       Icon(Icons.favorite,
      //         size: 30,  
      //         color: palettes['text2'],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
