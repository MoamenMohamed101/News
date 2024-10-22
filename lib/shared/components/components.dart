import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/webview_screen.dart';

Widget defaultButton({
  bool isUpper = true,
  double width = double.infinity,
  double textSize = 20,
  Color color = Colors.blue,
  Color textColor = Colors.white,
  required String text,
  required VoidCallback voidCall,
}) =>
    MaterialButton(
      clipBehavior: Clip.antiAlias,
      minWidth: width,
      onPressed: voidCall,
      color: color,
      child: Text(
        isUpper ? text.toUpperCase() : text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );

Widget defaultTextFormField({
  bool isSuffix = true,
  bool isObscure = true,
  Function? onField,
  void Function(String)? onChanged,
  VoidCallback? iconButtonFunction,
  required String? Function(String?)? validate,
  String? Function()? onTap,
  required TextEditingController controller,
  required TextInputType textInputType,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required double radius,
  required String hintText,
}) =>
    TextFormField(
      onFieldSubmitted: (value) => onField,
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      controller: controller,
      obscureText: isObscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
          ),
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: isSuffix
            ? IconButton(
                onPressed: iconButtonFunction,
                icon: Icon(suffixIcon),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
    );

Widget buildArticleItem(Map model, context) => InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WebViewScreen(url: model["url"]),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    model['urlToImage'] ??
                        "https://media.wired.com/photos/5b17381815b2c744cb650b5f/1:1/w_1678,h_1678,c_limit/GettyImages-134367495.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        model['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      model['publishedAt'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
    );

Widget itemOfScreens({
  required BuildContext context,
  required List<dynamic> list,
}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (BuildContext context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            buildArticleItem(list[index], context),
        separatorBuilder: (BuildContext context, int index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.deepOrange,
        ),
      ),
    );
