import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/providers/userProfile.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';
import 'package:hacktoberxmlsa_app/widgets/button.dart';
import 'package:hacktoberxmlsa_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController rollController= TextEditingController();

  String savedName = '';
  String savedRoll = '';
  String savedEmail = '';
  String savedPassword = '';

  void saveProfileDetails() {
    setState(() {
      savedName = nameController.text;
      savedRoll = rollController.text;
      savedEmail = emailController.text;
      savedPassword = passwordController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile details saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {

    final userProfile = Provider.of<UserProfileProvider>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }, 
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenWidth*0.08,),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: purple,
                            spreadRadius: screenWidth*0.02,
                            blurRadius: screenWidth*0.1,
                            offset: Offset(0, 0),
                          ),
                        ]
                      ), 
                      child: Container(
                        height: screenWidth/3,
                        width: screenWidth/3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnDNmpgYnTP4ELmIob69uKE1O0Rbrotna00g&s',
                            fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight*0.05,),
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: nameController,
                onChanged: (value) {
                  userProfile.updateName(value);
                }
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                "Roll No.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: rollController,
                onChanged: (value) {
                  userProfile.updateRoll(value);
                },
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: emailController,
                onChanged: (value) {
                  userProfile.updateEmail(value);
                },
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: passwordController,
              ),
              SizedBox(height: screenHeight*0.04,),
              CustomButton(
                onPressed: () {
                  saveProfileDetails;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                }, 
                text: "Save"
              ),
            ],
          ),
        ),
      ),
    );
  }
}