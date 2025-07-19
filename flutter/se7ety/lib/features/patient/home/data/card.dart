import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/specialization.dart';

const Color skyBlue = Color(0xff71b4fb);
const Color lightBlue = Color(0xff7fbcfb);

const Color orange = Color(0xfffa8c73);
const Color lightOrange = Color(0xfffa9881);

const Color purple = Color(0xff8873f4);
const Color purpleLight = Color(0xff9489f4);

const Color green = Color(0xff4cd1bc);
const Color lightGreen = Color(0xff5ed6c3);

class CardModel {
  String specialization;
  Color cardBackground;
  Color cardLightColor;

  CardModel(this.specialization, this.cardBackground, this.cardLightColor);
}

List<CardModel> cards = [
  CardModel(specialization[0], skyBlue, lightBlue),
  CardModel(specialization[1], green, lightGreen),
  CardModel(specialization[2], orange, lightOrange),
  CardModel(specialization[3], purple, purpleLight),
  CardModel(specialization[4], green, lightGreen),
  CardModel(specialization[5], skyBlue, lightBlue),
  CardModel(specialization[6], green, lightGreen),
  CardModel(specialization[7], orange, lightOrange),
  CardModel(specialization[8], purple, purpleLight),
  CardModel(specialization[9], green, lightGreen),
];
