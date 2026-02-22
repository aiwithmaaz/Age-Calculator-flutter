import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  // Ensure Flutter bindings are initialized for SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const AgeCalculatorApp(),
    ),
  );
}

class AgeCalculatorApp extends StatelessWidget {
  const AgeCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Age Calculator Pro',
      debugShowCheckedModeBanner: false,

      // Material 3 Theme Configuration
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: const SplashScreen(),
    );
  }
}

// --- Beautiful Splash Screen ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Home after 2.5 seconds
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Icon or Logo
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: value,
                    child: const Icon(
                      Icons.hourglass_empty_rounded,
                      size: 100,
                      color: Colors.deepPurple,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Age Calculator Pro",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}

// --- Utility for Extra Features (Share/Copy) ---
class AppUtils {
  static void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Results copied to clipboard!")),
    );
  }

  static void shareResult(String ageText) {
    Share.share(
        "Hey! I just calculated my age: $ageText. Check yours with Age Calculator Pro!");
  }
}
