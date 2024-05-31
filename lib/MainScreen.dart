import 'package:app/Expanded_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

TextStyle title1() {
  return GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  );
}

TextStyle lorem() {
  return GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Color.fromARGB(255, 34, 33, 33),
      fontSize: 16.5,
      fontWeight: FontWeight.w600,
    ),
  );
}

class _MainScreenState extends State<MainScreen> {
  final List<bool> _isFollowingList = List.generate(10, (index) => false);
  bool _isAppBarExpanded = false;
  bool is_searched = false;
  final TextEditingController _controller = TextEditingController();
  late ScrollController _scrollController;
  bool _ismute = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void search_toggle() {
    setState(() {
      is_searched = !is_searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            setState(() {
              _isAppBarExpanded = scrollNotification.metrics.pixels >= 220;
            });
          }
          return true;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.red,
              pinned: true,
              leading: _isAppBarExpanded
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 190, 112, 112),
                        radius: 15,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    )
                  : null,
              actions: _isAppBarExpanded
                  ? [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0, right: 10),
                        child: GestureDetector(
                          onTap: _showBottomSheet,
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 190, 112, 112),
                            radius: 15,
                            child: Icon(
                              Icons.more_vert_outlined,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [],
              expandedHeight: screenSize.height * 0.45,
              flexibleSpace: FlexibleSpaceBar(
                title: _isAppBarExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0, top: 15),
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            CircleAvatar(
                              radius: screenSize.width * 0.07,
                              child: ClipOval(
                                child: Image.asset(
                                  'images/person1.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The Weeknd',
                                  style: title1().copyWith(
                                    color: Colors.white,
                                    fontSize: 22 * textScaleFactor,
                                  ),
                                ),
                                const Text(
                                  'Community. +11K members',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : null,
                background: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.35,
                          width: double.infinity,
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: 0.67,
                              child: Image.asset(
                                'images/person1.png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 20,
                          top: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 15,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      tileColor: Colors.red,
                      title: Text('The Weeknd', style: title1()),
                      subtitle: const Text(
                        'Community. +11K members',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (!is_searched)
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ExpandableText(
                          text:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: List.generate(4, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 150, 40, 40)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0, right: 6.0),
                                      child: Text(
                                        'Outdoor',
                                        style: lorem().copyWith(
                                            color: const Color.fromARGB(
                                                255, 150, 40, 40),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 150, 40, 40)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0, right: 6.0),
                                      child: Text(
                                        '+1',
                                        style: lorem().copyWith(
                                            color: const Color.fromARGB(
                                                255, 150, 40, 40),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Media, docs and links',
                          style: lorem().copyWith(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: screenSize.height * 0.15,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(4, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 9.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 150, 40, 40),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: screenSize.width * 0.28,
                                    height: screenSize.width * 0.28,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'images/person1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Mute Notifications',
                          style: lorem().copyWith(
                              fontSize: 17, fontWeight: FontWeight.w800),
                        ),
                        trailing: IconButton(
                          color: _ismute ? Colors.greenAccent : Colors.grey,
                          onPressed: () {
                            setState(() {
                              _ismute = !_ismute;
                            });
                          },
                          icon: Icon(
                            _ismute
                                ? Icons.toggle_on_rounded
                                : Icons.toggle_off_rounded,
                            size: 52,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.delete_outline,
                          size: 36,
                        ),
                        title: Text(
                          'Clear Chat',
                          style: lorem().copyWith(
                              fontSize: 17, fontWeight: FontWeight.w800),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.lock_outline_rounded,
                          size: 36,
                        ),
                        title: Text(
                          'Encryption',
                          style: lorem().copyWith(
                              fontSize: 17, fontWeight: FontWeight.w800),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.login_outlined,
                          size: 36,
                          color: Colors.red,
                        ),
                        title: Text(
                          'Exit community',
                          style: lorem().copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.red),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.thumb_down,
                          size: 36,
                          color: Colors.red,
                        ),
                        title: Text(
                          'Report',
                          style: lorem().copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                if (!is_searched)
                  ListTile(
                    title: Text(
                      'Members',
                      style: lorem().copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 230, 224, 224),
                      child: IconButton(
                        onPressed: search_toggle,
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                if (is_searched)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              labelText: 'Enter your text',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              is_searched = !is_searched;
                              _controller.clear();
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                Column(
                  children: List.generate(10, (index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: Image.asset(
                            'images/person2.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        'Yakshi',
                        style: lorem().copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        '29, India',
                        style: lorem().copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isFollowingList[index] = !_isFollowingList[index];
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: _isFollowingList[index]
                              ? const Color.fromARGB(255, 153, 178, 191)
                              : const Color.fromARGB(255, 234, 80, 131),
                          padding: _isFollowingList[index]
                              ? const EdgeInsets.only(left: 15, right: 15)
                              : const EdgeInsets.only(left: 35, right: 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          _isFollowingList[index] ? 'Following' : 'Add',
                          style: lorem()
                              .copyWith(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15),
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person_add_alt_1_outlined,
                  size: 35,
                ),
                title: Text(
                  'Invite',
                  style: lorem().copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.group_add_outlined, size: 35),
                title: Text(
                  'Add Member',
                  style: lorem().copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.group, size: 35),
                title: Text(
                  'Add Group',
                  style: lorem().copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
