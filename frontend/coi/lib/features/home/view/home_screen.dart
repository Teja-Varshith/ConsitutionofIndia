import 'package:coi/app/providers.dart';
import 'package:coi/features/auth/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: _bottomNav(),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _header(theme,ref),
               
               
                const Text("Explore Constitution",),
                const SizedBox(height: 16),
                _gridSection(),
                const SizedBox(height: 20),
                const Text("BILLS",
                   ),
                const SizedBox(height: 16),
                _touristSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _header(ThemeMode theme, WidgetRef ref) {
  return AppBar(
    actions: [
      IconButton(onPressed:
        () {
          ref.read(appThemeProvider.notifier).state = theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
        }, 
        icon: Icon(
        theme == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
        )  
      ),
    ],
    elevation: 5,
    backgroundColor:  Color(0xFF2d2d31),
    
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/image.png'),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Hello Gopi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
           
            
          ],
        ),

        const Spacer(),

        Icon(Icons.bookmark, color: Colors.white70),

        const SizedBox(width: 16),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/gold_coin.svg',
              height: 22,
            ),
            const SizedBox(height: 2),
            const Text(
              '200 coins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _gridSection() {
    return Column(
      children: [
        
        Row(
          children: [
            _card(
              color: Colors.amber,
              svgPath: 'assets/images/preamble_icon.svg',
              title: "Preamble",
              subtitle: "",
            ),
            const SizedBox(width: 12),
            _card(
              color: const Color.fromARGB(205, 208, 195, 227),
              svgPath: 'assets/images/COI.svg',
              title: "COI",
              subtitle: "",
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _card(
              color: const Color.fromARGB(255, 188, 184, 189),
              svgPath: 'assets/images/schedule.svg',
              title: "Schedules",
              subtitle: "",
            ),
            const SizedBox(width: 12),
            _card(
              color: const Color.fromARGB(255, 234, 174, 152),
              svgPath: 'assets/images/amendments.svg',
              title: "Amendments",
              subtitle: "",
            ),
          ],
        ),
      ],
    );
  }

Widget _card({
  required Color color,
  required String svgPath,
  required String title,
  required String subtitle,
}) {
  return Expanded(
    child: Container(
      height: 150,
      decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  image: DecorationImage(
    image: AssetImage("assets/images/pattern.png"),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
      const Color.fromARGB(255, 232, 241, 164).withOpacity(0.6), // dark overlay
      BlendMode.darken,
    ),
  ),
),

      child: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svgPath,
                  width: 45,
                  height: 45,
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 66, 66, 66),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Right top arrow button
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_outward,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _touristSection() {
    return Column(
      children: [
        CustomButton(

          text: 'Bills', 
          backgroundColor: const Color.fromARGB(255, 229, 231, 160), 
          bordercolor: const Color.fromARGB(255, 131, 131, 131), 
          gradientcolor1: const Color.fromARGB(255, 240, 247, 170), 
          // gradientcolor2:  const Color.fromARGB(26, 190, 161, 18), 
          fontsize: 18, 
          fontWeight: FontWeight.bold, 
          fontcolor: Color.fromARGB(255, 66, 66, 66),
          letterSpacing: 1.2, 
          buttonheight: 62, 
          svgpath: 'assets/images/bills.svg',
          ),
          SizedBox(
            height: 20,
          ),
          


          CustomButton(

          text: 'Judgements', 
           backgroundColor: const Color.fromARGB(255, 229, 231, 160), 
          bordercolor: const Color.fromARGB(255, 131, 131, 131), 
          gradientcolor1: const Color.fromARGB(255, 240, 247, 170), 
          // gradientcolor2:  const Color.fromARGB(26, 18, 190, 52), 
          fontsize: 18, 
          fontWeight: FontWeight.bold, 
          fontcolor: Color.fromARGB(255, 66, 66, 66),
          letterSpacing: 1.2, 
          buttonheight: 62, 
          svgpath: 'assets/images/judgements.svg',
          ),



        
        // _tourCard(Icons.nature, "Nature Tourism"),
        // const SizedBox(width: 12),
        // _tourCard(Icons.water, "Water Tourism"),
      ],
    );
  }

  // Widget _tourCard(IconData icon, String title) {
  Widget _bottomNav() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.home, color: Colors.amber),
            Icon(Icons.article, color: Colors.grey),
            SizedBox(width: 40),
            Icon(Icons.message, color: Colors.grey),
            Icon(Icons.person, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
