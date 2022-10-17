import 'package:discover_flutter/model/animal_model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabLength = 4;
  @override
  void initState() {
    tabController = TabController(
      length: tabLength,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            20, mediaQuery.padding.top, 20, mediaQuery.padding.bottom),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF524A41),
              Color(0xFFAA928E),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 30),
                const Icon(Icons.search, size: 30),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Discover",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Protect our earth together.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.5,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
            TabBar(
              controller: tabController,
              automaticIndicatorColorAdjustment: false,
              labelPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Birds"),
                Tab(text: "Fishes"),
                Tab(text: "Mammals"),
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                buildAnimalList(birdData + fishData + mammalData),
                buildAnimalList(birdData),
                buildAnimalList(fishData),
                buildAnimalList(mammalData),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_bag_rounded)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.airplanemode_on_rounded)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.featured_play_list)),
              ],
            )
          ],
        ),
      ),
    );
  }

  ListView buildAnimalList(List<AnimalModel> animalList) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          return AnimalCard(
            animal: animalList[index],
          );
        });
  }
}

class AnimalCard extends StatelessWidget {
  const AnimalCard({super.key, required this.animal});
  final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: mediaQuery.size.width * 0.55,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(5, 5)),
            ],
          ),
          child: Row(
            children: [
              MapArea(color: animal.bgColor, location: animal.location),
              const ButtonArea(),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Container(
            width: mediaQuery.size.width * 0.5,
            height: mediaQuery.size.width * 0.5,
            child: FittedBox(
                fit: BoxFit.cover, child: Image.asset(animal.imageUrl)),
          ),
        ),
      ],
    );
  }
}

class MapArea extends StatelessWidget {
  const MapArea({
    Key? key,
    required this.color,
    required this.location,
  }) : super(key: key);

  final Color color;
  final String location;

  Alignment get _alignment {
    final random = math.Random();
    return Alignment(random.nextDouble(), random.nextDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            alignment: _alignment,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
            image: const AssetImage("assets/images/worldMap.png"),
          ),
        ),
        child: Stack(children: [
          Positioned(
              //this is for random position on map
              top: math.Random().nextInt(80).toDouble(),
              right: math.Random().nextInt(110).toDouble(),
              child: const LocationMarker()),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white54,
                ),
                Text(
                  location,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class LocationMarker extends StatelessWidget {
  const LocationMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.25),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.amber.withOpacity(0.5),
            width: 2,
          )),
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 5,
        height: 5,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.yellow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20))),
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
