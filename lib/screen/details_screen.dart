import 'package:discover_flutter/model/animal_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.animal});
  final AnimalModel animal;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF524A41),
              Color(0xFFAA928E),
            ],
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                LeftSide(animalInfo: widget.animal),
                RightSide(animalInfo: widget.animal),
              ],
            ),
            Positioned(
              right: -mediaQuery.size.width * .14,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    5,
                    mediaQuery.padding.top + mediaQuery.size.height * .05,
                    5,
                    mediaQuery.padding.bottom),
                // color: Colors.green.withOpacity(.5),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * .5,
                child: Hero(
                  tag: widget.animal.name,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(widget.animal.imageUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({super.key, required this.animalInfo});
  final AnimalModel animalInfo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        mediaQuery.padding.top,
        20,
        mediaQuery.padding.bottom,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(mediaQuery.size.width * .1),
          bottomLeft: Radius.circular(mediaQuery.size.width * .1),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3a352f),
            Color(0xFF776d6d),
          ],
        ),
      ),
      width: mediaQuery.size.width * .35,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 10,
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * .06,
                vertical: mediaQuery.size.height * .01,
              ),
              backgroundColor: const Color(0xff58534c),
              foregroundColor: Colors.white,
            ),
            child: const Text("Skip"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                elevation: 5,
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * .016,
                  vertical: mediaQuery.size.height * .01,
                ),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({super.key, required this.animalInfo});
  final AnimalModel animalInfo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        mediaQuery.padding.top,
        25,
        mediaQuery.padding.bottom,
      ),
      width: mediaQuery.size.width * .65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: mediaQuery.size.width * .15,
            height: mediaQuery.size.width * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: mediaQuery.size.width * .07,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: mediaQuery.size.width * .4,
            height: mediaQuery.size.height * .3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(mediaQuery.size.width * .6),
                bottomLeft: Radius.circular(mediaQuery.size.width * .4),
                bottomRight: Radius.circular(mediaQuery.size.width * .4),
              ),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(
                mediaQuery.size.width * .08,
                mediaQuery.size.width * .12,
                mediaQuery.size.width * .08,
                mediaQuery.size.width * .08,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(mediaQuery.size.width * .6),
                  bottomLeft: Radius.circular(mediaQuery.size.width * .4),
                  bottomRight: Radius.circular(mediaQuery.size.width * .4),
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * .02),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.5),
                ),
              ),
              Expanded(
                child: Text(
                  animalInfo.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: mediaQuery.size.height * .02),
          Text(
            animalInfo.description,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 1.4,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * .03),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 10,
                padding: EdgeInsets.symmetric(
                    vertical: mediaQuery.size.height * .025),
                backgroundColor: const Color(0xffb7a6a3),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text("Donate"),
            ),
          ),
        ],
      ),
    );
  }
}
