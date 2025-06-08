import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 32),
              Text(
                'Choose Language',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Please select from the available languages',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLanguageCard(
                      language: 'English',
                      flag:
                          'assets/image/English_Language_Selection.png', // Replace with your image path
                      isSelected: selectedLanguage == 'English',
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'English';
                        });
                      },
                      context: context),
                  SizedBox(width: 16),
                  _buildLanguageCard(
                      language: 'हिन्दी',
                      flag:
                          'assets/image/Hindi_Language_Selection.png', // Replace with your image path
                      isSelected: selectedLanguage == 'हिन्दी',
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'हिन्दी';
                        });
                      },
                      context: context,
                      isHindi: true),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: selectedLanguage != null
                      ? () {
                          Navigator.pop(context);
                          // Navigate to the next screen or perform action
                          print('Selected Language: $selectedLanguage');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.blue.shade200,
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageCard(
      {required String language,
      required String flag,
      required bool isSelected,
      required VoidCallback onTap,
      required BuildContext context,
      bool isHindi = false}) {
    double cardWidth = (MediaQuery.of(context).size.width - 64) / 2;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardWidth * 0.8,
        decoration: BoxDecoration(
          color: isHindi ? Colors.teal.shade300 : Colors.blue.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand, // Expand the Stack to fill the Container
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                flag, // Replace with your image path
                fit: BoxFit.fill, // Cover the entire container
              ),
            ),

            // Checkmark (Radio Button) - Stacked on top of the image
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.white,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
