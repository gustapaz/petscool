import 'package:flutter/material.dart';

class Carousel {
  final Image? image;
  final String? title;
  final String? description;

  Carousel({
    this.image,
    this.title,
    this.description,
  });
}

List<Carousel> carouselList = [
  Carousel(
    title: 'Ração para cães',
    description: '10% OFF',
    image: null,
  ),
  Carousel(
    title: 'Ração para cães',
    description: '10% OFF',
    image: null,
  ),
  Carousel(
    title: 'Ração para cães',
    description: '10% OFF',
    image: null,
  ),
];
