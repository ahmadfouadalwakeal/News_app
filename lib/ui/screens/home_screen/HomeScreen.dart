import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ixtask/ui/responsive-ui/ui_components/InfoWidget.dart';
import 'package:ixtask/ui/screens/home_screen/api/services/News_service.dart';
import 'package:ixtask/ui/widget/NewsListViewBuilder.dart';

import '../../../generated/l10n.dart';
import '../../widget/Custom_Button.dart';
import '../../widget/Custom_textfield.dart';
import '../change_language/ChangeLanguage.dart';
import '../../../data/news/models/ActicleModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> searchlist = [];
  List<ArticleModel> listdata = [];
  TextEditingController inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text(
            S.of(context).Home,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Custom_TextFormField(
                  hinitText: S.of(context).Search,
                  prefixIcon: Icon(Icons.search),
                  controller: inputController,
                  onchanged: (text) {
                    text = inputController.text.toLowerCase();
                    setState(() {
                      searchlist = listdata.where((element) {
                        var search = element.title.toLowerCase();
                        return search.contains(text);
                      }).toList();
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: NewsListViewBuilder(
                  catgegory: 'general',
                )),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: S.of(context).titlelanguage,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeLanguage()));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
