# Save Data in shared_preferences in Flutter  . [shared_preferences: ^2.0.13](https://pub.dev/packages/shared_preferences)

    Flutter plugin for reading and writing simple key-value pairs.

## Getting Started

- ### Download this package as a library
 
  - Depend on it Run this command:
    ```
    $ flutter pub add shared_preferences
    ```
 
  - This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
    ```
    dependencies:
       shared_preferences: ^2.0.13
    ```
  - Import it Now in your Dart code, you can use:
     ```
     import 'package:shared_preferences/shared_preferences.dart';
     ```
- ### How to Use this Packege
 
  - for the first application start we need to check if the user is loggged or not , for example I check that in the Splach screen, So if the user is logged the splach screen it will be redirct me to the Home Screen but if not is logged yet , it will be redirct me to login page , and for this way I start to chek if the key of login is created befor or not by using this Code :
    ```
    
    CheckingSavedData() async {
            WidgetsFlutterBinding.ensureInitialized();
            await Future.delayed(const Duration(seconds: 2), () async {
                SharedPreferences prefe = await SharedPreferences.getInstance();
                if (prefe.containsKey('Emaildata')) {
                    Get.off(const HomeScreen());
                } else {
                    Get.off(LoginScreen());
                }
            }
        );
    }
    ```
   - So if redirect to the login Screen it's mean that the Shared pereference key not created yet , and it will be created after the user login  :
    ```
    onPressed: () async {
        if (_formKey.currentState!.validate()) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('Emaildata', _Emailcontroller.text);
            Get.off(() => const HomeScreen());
        }
    },
    ```   
   - if I redirect to the home Screen , it's mean that the Shared pereference key is already created , so if i logout the key will be removed :
    ```
    onPressed: () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove('Emaildata');
        Get.off(() => LoginScreen());
    },
    ```
- ### Preview
<img src="https://user-images.githubusercontent.com/82768399/154568620-7acf6f6b-5658-4e05-8fb0-ba9aa2ac9f6b.gif" width="400" >