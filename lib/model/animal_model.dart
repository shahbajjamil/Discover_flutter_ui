import 'package:flutter/material.dart';

class AnimalModel {
  String name;
  String imageUrl;
  String location;
  String description;
  Color bgColor;

  AnimalModel({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.bgColor,
  });
}

List<AnimalModel> birdData = [
  AnimalModel(
      name: "Hummingbird",
      imageUrl: "assets/images/bird/hummingBird.png",
      location: "Trinidad\nAnd Tobago",
      description:
          "Hummingbirds include the smallest birds in the world , but they belong to one of the largest group of birds , the Trochilidae family . These enchanting birds are found in deserts , mountains , and ...",
      bgColor: const Color(0xff5e6152)),
  AnimalModel(
      name: "Blue Parrot",
      imageUrl: "assets/images/bird/blueParrot.png",
      location: "Eastern South America",
      description:
          "Blue parrot species range from small to very large in size and come in powdery light blues to deep indigos. Some of these birds simply have flashy blue markings while others are predominantly blue.",
      bgColor: const Color(0xFF514CA5)),
  AnimalModel(
      name: "Roseate Spoonbill",
      imageUrl: "assets/images/bird/roseateSpoonbill.png",
      location: "South and North America",
      description:
          "The roseate spoonbill is a gregarious wading bird of the ibis and spoonbill family, Threskiornithidae. It is a resident breeder in both South and North America.",
      bgColor: const Color(0xFFA54C93)),
];

List<AnimalModel> mammalData = [
  AnimalModel(
      name: "Rhinos",
      imageUrl: "assets/images/mammal/Rhino.png",
      location: "Ujung Kulon National Park",
      description:
          "A rhinoceros, commonly abbreviated to rhino, is a member of any of the five extant species of odd-toed ungulates in the family Rhinocerotidae. Two of the extant species are native to Africa, and three to South and Southeast Asia.",
      bgColor: const Color(0xFF614848)),
  AnimalModel(
      name: "Polar Bear",
      imageUrl: "assets/images/mammal/polarBear.png",
      location: "The Arctic Circle",
      description:
          "The polar bear is a hypercarnivorous bear whose native range lies largely within the Arctic Circle, encompassing the Arctic Ocean, its surrounding seas and surrounding land masses. It is the largest extant bear species, as well as the largest extant land carnivore.",
      bgColor: const Color(0xFF486061)),
  AnimalModel(
      name: "Fox",
      imageUrl: "assets/images/mammal/fox.png",
      location: "North America",
      description:
          "Foxes are small to medium-sized, omnivorous mammals belonging to several genera of the family Canidae. They have a flattened skull, upright triangular ears, a pointed, slightly upturned snout, and a long bushy tail.",
      bgColor: const Color(0xFF64443C)),
];

List<AnimalModel> fishData = [
  AnimalModel(
      name: "Gold Fish",
      imageUrl: "assets/images/fish/goldFish.png",
      location: "East Asia",
      description:
          "The goldfish is a freshwater fish in the family Cyprinidae of order Cypriniformes. It is commonly kept as a pet in indoor aquariums, and is one of the most popular aquarium fish. Goldfish released into the wild have become an invasive pest in parts of North America.",
      bgColor: const Color(0xFF589BBA)),
  AnimalModel(
      name: "Nemo Fish",
      imageUrl: "assets/images/fish/nemo.png",
      location: "Shallow waters of the Indian Ocean",
      description:
          "The ocellaris clownfish, also known as the false percula clownfish or common clownfish, is a marine fish belonging to the family Pomacentridae, which includes clownfishes and damselfishes. Amphiprion ocellaris are found in different colors, depending on where they are located.",
      bgColor: const Color(0xFF447E37)),
  AnimalModel(
      name: "Siamese fighting fish",
      imageUrl: "assets/images/fish/SiameseFightingFish.png",
      location: "Southeast Asia",
      description:
          "Siamese fighting fish are beautiful and affordable and perfectly suited to those that are looking for a low maintenance pet that needs very little space. Their majestic fins and stunning array of colours makes these fish as much a part of the décor as they are a pet to be enjoyed and cared for, for up to three years.",
      bgColor: const Color(0xFF7E3779)),
];
