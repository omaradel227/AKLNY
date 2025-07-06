import 'package:flutter/material.dart';
import 'package:graduation/screens/add_recipe.dart';
import 'package:graduation/screens/home_screen.dart';
import 'package:graduation/screens/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'saved_screen.dart';
import 'leftover_management_screen.dart';
import 'recommended_screen.dart';
import 'user_profile.dart';
import 'edit_profile_screen.dart'; // Import the EditProfileScreen
import 'chatbot_screen.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  MainNavigationPageState createState() => MainNavigationPageState();
}

class MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  // Central state for saved recipes
  List<Map<String, dynamic>> savedRecipes = [];

  // Example user data
  Map<String, String> userData = {
    'name': 'John Doe',
    'email': 'johndoe@example.com',
    'phone': '123456789',
    'address': '123 Street, City',
    'dietaryPreferences': 'Vegetarian',
    'allergies': 'Peanuts',
    'cookingSkillLevel': 'Intermediate',
    'dateOfBirth': '1990-01-01',
  };

  void _saveRecipe(Map<String, dynamic> recipe) {
    setState(() {
      if (!savedRecipes.contains(recipe)) {
        savedRecipes.add(recipe);
      }
    });
  }

  // Dynamic AppBar title based on current page
  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return "Aklny";
      case 1:
        return "Saved Recipes";
      case 2:
        return "Leftover Management";
      case 3:
        return "Healthy food advisor";
      case 4:
        return "Profile";
      default:
        return "Aklny";
    }
  }

  List<Widget> _buildTopActions() {
    return [
       IconButton(
          icon: Icon(Icons.chat_outlined,color: Colors.white,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WebSocketTestScreen()),
            );
          },
        ),
        IconButton(
        icon: Icon(Icons.search,color: Colors.white,),
        onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Pages to render for each tab
    final List<Widget> pages = [
      HomeScreen(onSave: _saveRecipe),
      SavedScreen(),
      LeftoverReportScreen(),
      RecommendedRecipes(
        onSave: (Map<String, dynamic> recipe) {},
      ),
      UserProfilePage(
        userData: null,
        onEditProfile: (updatedData) async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfileScreen(userData: userData),
            ),
          );
          if (result != null) {
            setState(() {
              userData = result;
            });
          }
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        toolbarHeight: 56,
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, '/signin');
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("auth_token");
            },
            icon: Icon(Icons.logout,color: Colors.white,)),
        title: Text(
          _getAppBarTitle(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: _buildTopActions(),
      ),
      // Dynamic Page Content
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateRecipeScreen()),
            );
              },
              // ignore: sort_child_properties_last
              child: Icon(Icons.add,color: Colors.white,),
              backgroundColor: const Color(0xFF2E7D32),
            )
          : null,

      // Persistent Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Leftovers'),
          BottomNavigationBarItem(
              icon: Icon(Icons.recommend), label: 'Recommended'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
