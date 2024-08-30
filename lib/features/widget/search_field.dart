import 'package:bookly_app/utils/styles/colors.dart';
import 'package:flutter/material.dart';



class SearchField extends StatelessWidget {
  const  SearchField ({super.key, this.onFieldSubmitted, this.onPressed, this.controller});
  final void Function(String)? onFieldSubmitted;
  final  void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search by book...',
          hintStyle: const TextStyle(
            fontSize: 15.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.dark,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.dark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.dark,
            ),
          ),
          suffixIcon: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.search, size: 28, color: AppColors.dark),
              onPressed:onPressed,
            ),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
