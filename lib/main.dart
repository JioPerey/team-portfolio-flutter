import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Route Names
class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String gallery = '/gallery';
  static const String contact = '/contact';
  static const String photoDetails = '/photo';
}

// Theme
class AppColors {
  static const Color ink = Color(0xFF1A1A1A); // black (primary)
  static const Color charcoal = Color(0xFF4D4D4D); // dark gray
  static const Color slate = Color(0xFF666666); // medium gray
  static const Color ash = Color(0xFF8A8A8A); // mid-light gray
  static const Color silver = Color(0xFFBDBDBD); // light gray
  static const Color mist = Color(0xFFE0E0E0); // very light gray
  static const Color cloud = Color(0xFFF5F5F5); // background (off-white)
  static const Color text = Color(0xFF1A1A1A); // main text
  static const Color textSoft = Color(0xFF6B6B6B); // secondary text
}

Color soften(Color color) {
  return Color.alphaBlend(color.withAlpha(45), Colors.white);
}

/// Builds the single ThemeData used by the whole app.
ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.ink,
      primary: AppColors.ink,
      secondary: AppColors.charcoal,
      tertiary: AppColors.slate,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.cloud,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.cloud,
      foregroundColor: AppColors.text,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.text,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.text,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.text,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(color: AppColors.text, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.textSoft, fontSize: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.ink,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.ink, width: 2),
      ),
    ),
  );
}

class Member {
  final String name;
  final String role;
  final String bio;
  final String email;
  final Color color;
  final String photo;

  const Member({
    required this.name,
    required this.role,
    required this.bio,
    required this.email,
    required this.color,
    required this.photo,
  });

  String get initials {
    final parts = name.split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.length >= 2) return '${parts.first[0]}${parts.last[0]}';
    return name.isNotEmpty ? name[0] : '?';
  }
}

/// Holds the information of one gallery photo.
class GalleryPhoto {
  final String title;
  final String caption;
  final String owner;
  final String assetPath;
  final Color color;
  final IconData icon;

  const GalleryPhoto({
    required this.title,
    required this.caption,
    required this.owner,
    required this.assetPath,
    required this.color,
    required this.icon,
  });
}

const List<Member> members = [
  Member(
    name: 'Jio Perey',
    role: 'Project Lead / UI Designer',
    bio: 'Plans the app flow and designs the clean monochrome look.',
    email: 'jioperey@gmail.com',
    color: AppColors.ink,
    photo: 'assets/images/perey_profile.jpg',
  ),
  Member(
    name: 'Kenneth Perjes',
    role: 'Navigation Developer',
    bio: 'Handles named routes, route arguments and navigation.',
    email: 'kennethperjes@gmail.com',
    color: AppColors.charcoal,
    photo: 'assets/images/perejes_profile.png',
  ),
  Member(
    name: 'James Peralta',
    role: 'Gallery Developer',
    bio: 'Builds the gallery grid and the photo details page.',
    email: 'jamesperalta@gmail.com',
    color: AppColors.slate,
    photo: 'assets/images/peralta_profile.jpeg',
  ),
  Member(
    name: 'Shaun Piconada',
    role: 'Forms & Documentation',
    bio: 'Creates the contact form, validation and documentation.',
    email: 'shaunpiconada@gmail.com',
    color: AppColors.ash,
    photo: 'assets/images/piconada_profile.jpg',
  ),
];

const List<GalleryPhoto> photos = [
  GalleryPhoto(
    title: 'Team Meeting',
    caption: 'Planning the app layout together.',
    owner: 'Jio Perey',
    assetPath: 'assets/images/meeting.jfif',
    color: AppColors.ink,
    icon: Icons.groups,
  ),
  GalleryPhoto(
    title: 'Design Sketch',
    caption: 'First wireframe of our home screen.',
    owner: 'Jio Perey',
    assetPath: 'assets/images/sketch.jfif',
    color: AppColors.charcoal,
    icon: Icons.draw,
  ),
  GalleryPhoto(
    title: 'Coding Night',
    caption: 'Writing the routes late at night.',
    owner: 'Kenneth Perjes',
    assetPath: 'assets/images/coding.jfif',
    color: AppColors.slate,
    icon: Icons.code,
  ),
  GalleryPhoto(
    title: 'Bug Hunt',
    caption: 'Fixing navigation errors as a team.',
    owner: 'Kenneth Perjes',
    assetPath: 'assets/images/bug.jfif',
    color: AppColors.ash,
    icon: Icons.bug_report,
  ),
  GalleryPhoto(
    title: 'Campus Life',
    caption: 'Taking a break around the campus.',
    owner: 'James Peralta',
    assetPath: 'assets/images/campus.jfif',
    color: AppColors.charcoal,
    icon: Icons.park,
  ),
  GalleryPhoto(
    title: 'Snack Time',
    caption: 'Fuel for the final sprint.',
    owner: 'James Peralta',
    assetPath: 'assets/images/snack.jfif',
    color: AppColors.ink,
    icon: Icons.cookie,
  ),
  GalleryPhoto(
    title: 'Testing Day',
    caption: 'Running the app on our phones.',
    owner: 'Shaun Piconada',
    assetPath: 'assets/images/testing.jfif',
    color: AppColors.ash,
    icon: Icons.phone_android,
  ),
  GalleryPhoto(
    title: 'Final Demo',
    caption: 'Presenting the finished project.',
    owner: 'Shaun Piconada',
    assetPath: 'assets/images/demo.jfif',
    color: AppColors.slate,
    icon: Icons.emoji_events,
  ),
];

// App Entry Point & Route Registration

/// Starts the app
void main() => runApp(const MeetTheTeamApp());

/// Root widget
class MeetTheTeamApp extends StatelessWidget {
  const MeetTheTeamApp({super.key});

  /// Builds the MaterialApp with theme, routes and fallback screen.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piconada Group Portfolio',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: AppRoutes.home,

      // Simple routes
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.about: (context) => const AboutScreen(),
        AppRoutes.gallery: (context) => const GalleryScreen(),
        AppRoutes.contact: (context) => const ContactScreen(),
      },

      // Route that needs arguments
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.photoDetails &&
            settings.arguments is GalleryPhoto) {
          final photo = settings.arguments as GalleryPhoto;
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => PhotoDetailsScreen(photo: photo),
          );
        }
        return null;
      },

      // Fallback when a route does not exist
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const NotFoundScreen(),
      ),
    );
  }
}

// Reusable Widgets

/// Navigation drawer shared by Home, About, Gallery and Contact.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, String route) {
    final current = ModalRoute.of(context)?.settings.name;
    Navigator.pop(context);
    if (current == route) return;

    if (route == AppRoutes.home) {
      Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
    } else if (current == AppRoutes.home) {
      Navigator.pushNamed(context, route);
    } else {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  /// Builds one drawer menu item
  Widget _item(
      BuildContext context, IconData icon, String label, String route) {
    final selected = ModalRoute.of(context)?.settings.name == route;
    return ListTile(
      leading: Icon(icon, color: AppColors.ink),
      title: Text(label),
      selected: selected,
      selectedColor: AppColors.ink,
      selectedTileColor: AppColors.mist,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onTap: () => _go(context, route),
    );
  }

  /// Builds the drawer with a solid header and the four menu items
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cloud,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.ink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'The Dream Team',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _item(context, Icons.home_rounded, 'Home', AppRoutes.home),
          _item(context, Icons.info_rounded, 'About Us', AppRoutes.about),
          _item(context, Icons.photo_library_rounded, 'Gallery',
              AppRoutes.gallery),
          _item(context, Icons.mail_rounded, 'Contact Us', AppRoutes.contact),
        ],
      ),
    );
  }
}

class MemberAvatar extends StatelessWidget {
  final Member member;
  final double radius;
  const MemberAvatar({super.key, required this.member, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: member.color,
      child: ClipOval(
        child: Image.asset(
          member.photo,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Text(
            member.initials,
            style: TextStyle(
              color: Colors.white,
              fontSize: radius * 0.65,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/// Card that shows one member
class MemberCard extends StatelessWidget {
  final Member member;
  const MemberCard({super.key, required this.member});

  /// Builds the avatar, name, role, bio and email of a member
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: soften(member.color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          MemberAvatar(member: member, radius: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  member.role,
                  style: const TextStyle(
                    color: AppColors.charcoal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(member.bio, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text(member.email,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoImage extends StatelessWidget {
  final GalleryPhoto photo;
  const PhotoImage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      photo.assetPath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) => Container(
        color: photo.color,
        child: Icon(photo.icon, size: 56, color: Colors.white),
      ),
    );
  }
}

class NavCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const NavCard({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(vertical: 22),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(icon, size: 34, color: AppColors.ink),
              const SizedBox(height: 8),
              Text(label, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 1: Home Page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _confirmExit(BuildContext context) async {
    final leave = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Exit app?'),
        content: const Text('Do you want to close The Dream Team app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
    if (leave == true) SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _confirmExit(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        drawer: const AppDrawer(),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, we are',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The Dream Team',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A group of 4 mobile developers building friendly apps.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Explore', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),

            // Links to every page
            Row(
              children: [
                NavCard(
                  icon: Icons.info_rounded,
                  label: 'About',
                  color: AppColors.silver,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.about),
                ),
                NavCard(
                  icon: Icons.photo_library_rounded,
                  label: 'Gallery',
                  color: AppColors.mist,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.gallery),
                ),
                NavCard(
                  icon: Icons.mail_rounded,
                  label: 'Contact',
                  color: AppColors.silver,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.contact),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Text('The Dream Team',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: members
                  .map(
                    (m) => Column(
                      children: [
                        MemberAvatar(member: m, radius: 28),
                        const SizedBox(height: 6),
                        Text(
                          m.name.split(' ').first,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2: About us Page
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.mist,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'We are a team of four students from the College of Computing '
              'Studies. This app introduces who we are, shows our photos, '
              'and lets you reach us. Each of us built a part of it and '
              'combined everything in one shared project.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text('Our Members',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          ...members.map((m) => MemberCard(member: m)),
        ],
      ),
    );
  }
}

// Screen 3: Gallery Page
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  void _openPhoto(BuildContext context, GalleryPhoto photo) {
    Navigator.pushNamed(
      context,
      AppRoutes.photoDetails,
      arguments: photo,
    );
  }

  Widget _buildTile(BuildContext context, GalleryPhoto photo) {
    return GestureDetector(
      onTap: () => _openPhoto(context, photo),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Hero(
                  tag: photo.title,
                  child: PhotoImage(photo: photo),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    photo.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'by ${photo.owner}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      drawer: const AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.85,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) => _buildTile(context, photos[index]),
      ),
    );
  }
}

// Screen 4: Photo Details Page
class PhotoDetailsScreen extends StatelessWidget {
  final GalleryPhoto photo;
  const PhotoDetailsScreen({super.key, required this.photo});

  Member _findOwner() {
    return members.firstWhere(
      (m) => m.name == photo.owner,
      orElse: () => members.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Hero(
                tag: photo.title,
                child: PhotoImage(photo: photo),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(photo.title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(photo.caption, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Text('Contributed by', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          MemberCard(member: _findOwner()),
        ],
      ),
    );
  }
}

// Screen 5: CONTACT US Page
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter your name.';
    if (text.length < 2) return 'Name must be at least 2 characters.';
    if (!RegExp(r"^[A-Za-z .'-]+$").hasMatch(text)) {
      return 'Name can only contain letters.';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter your email.';
    if (!RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(text)) {
      return 'Please enter a valid email (e.g. name@mail.com).';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please write a message.';
    if (text.length < 10) return 'Message must be at least 10 characters.';
    if (text.length > 300) return 'Message must be 300 characters or less.';
    return null;
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Message sent!'),
        content: Text('Thank you, ${_nameController.text.trim()}. '
            'We will get back to you soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            ),
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.ink),
            const SizedBox(height: 6),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: AppColors.text),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              _infoTile(
                  Icons.email_rounded, 'dream@gmail.com', AppColors.silver),
              _infoTile(Icons.phone_rounded, '09566253222', AppColors.mist),
              _infoTile(Icons.location_on_rounded, 'Cabuyao, Laguna',
                  AppColors.silver),
            ],
          ),
          const SizedBox(height: 24),
          Text('Send us a message',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_rounded),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_rounded),
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _messageController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.message_rounded),
                  ),
                  validator: _validateMessage,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.send_rounded),
                    label: const Text('Send Message'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Fallback Screen
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.sentiment_dissatisfied_rounded,
                  size: 90, color: AppColors.silver),
              const SizedBox(height: 16),
              Text('Oops! 404',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              const Text('We could not find the page you are looking for.',
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                ),
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
