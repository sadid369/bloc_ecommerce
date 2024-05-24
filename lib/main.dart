import 'package:bloc_ecommerce/app.dart';
import 'package:flutter/material.dart';
import 'src/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = BlocEcommerceObserver();
  runApp(const BlocEcommerceApp());
}
