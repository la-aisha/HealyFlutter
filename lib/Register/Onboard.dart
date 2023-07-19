import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  itemCount: demodate.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                      image: demodate[index].image,
                      title: demodate[index].title,
                      description: demodate[index].description))),
          Row(
            children: [
              ...List.generate(
                demodate.length,
                (index) => Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Dotindicator(isactive: index == _pageIndex)),
              ),
              Spacer(),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(microseconds: 300),
                            curve: Curves.ease);
                      },
                      style: ElevatedButton.styleFrom(shape: CircleBorder()),
                      child: Image.asset(
                        'images/arrow2.png',
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ))),
            ],
          ),
        ],
      )),
    );
  }
}

class Dotindicator extends StatelessWidget {
  const Dotindicator({
    super.key,
    this.isactive = false,
  });
  final bool isactive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds:300 ),
      height: isactive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isactive? Colors.blue :Colors.pink,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 250,
        ),
        Spacer(),
        Text(
          title,
          style: GoogleFonts.dosis(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.normal,
            color: Colors.black87,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer()
      ],
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demodate = [
  Onboard(
    image: 'images/medecin.png',
    title: 'Etiam pellentesque posuere orci id tempus',
    description:
        'at justo pulvinar vestibulum. Sed eget tincidunt lectus. Nunc eget velit sit amet neque fermentum faucibus. Etiam pellentesque ',
  ),
  Onboard(
    image: 'images/gyneco.png',
    title: 'Etiam pellentesque posuere orci id tempus',
    description:
        'at justo pulvinar vestibulum. Sed eget tincidunt lectus. Nunc eget velit sit amet neque fermentum faucibus. Etiam pellentesque ',
  ),
  Onboard(
    image: 'images/location.png',
    title: 'Etiam pellentesque posuere orci id tempus',
    description:
        'at justo pulvinar vestibulum. Sed eget tincidunt lectus. Nunc eget velit sit amet neque fermentum faucibus. Etiam pellentesque ',
  )
];
