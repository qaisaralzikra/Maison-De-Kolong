import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({Key? key}) : super(key: key);

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  String selectedLanguage = 'Bahasa Indonesia'; // default pilihan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Remix.arrow_left_circle_line,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Kotak Masuk',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildLanguageOption('Bahasa Indonesia'),
          _buildLanguageOption('English'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    final bool isSelected = selectedLanguage == language;

    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.pink : Colors.black,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Colors.pink,
              ),
          ],
        ),
      ),
    );
  }
}
