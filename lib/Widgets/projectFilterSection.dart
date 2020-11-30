import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectFilter extends StatefulWidget {
  @override
  _ProjectFilterState createState() => _ProjectFilterState();
}

class _ProjectFilterState extends State<ProjectFilter> {
  double _slidervalue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Filter",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          FlatButton(
            child: Text(
              "Reset all",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xffE86096),
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Distance",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Display all the projects within required radius.",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorColor:
                        Colors.white, // This is what you are asking for

                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 35.0),
                  ),
                  child: Slider(
                    inactiveColor: Color(0xffA0BBEE),
                    min: 0.0,
                    max: 10.0,
                    value: _slidervalue,
                    onChanged: (newvalue) {
                      setState(() {
                        _slidervalue = newvalue;
                        HapticFeedback.heavyImpact();
                      });
                    },
                    activeColor: Color(0xff6282C3),
                    divisions: 10,
                    label: "10km",
                    // onChangeStart: slideronChanged,
                    // onChangeEnd: slideronChanged,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10km",
                      style: TextStyle(
                        color: Color(0xff817E8F),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "1000km",
                      style: TextStyle(
                        color: Color(0xff817E8F),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Filter the result by selecting any of the  categorie to be displayed on the project list.",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Wrap(
                      children: [
                        FilterChips(
                          chip: "Open-Source Projects",
                          bgColor: Colors.grey[700],
                          textcolor: Colors.white,
                          checkmarkColor: Colors.white,
                          selectedcolor: Colors.black,
                        ),
                        FilterChips(
                          chip: "New Fresh Projects",
                          bgColor: Color(0xffBBDBFC),
                          textcolor: Colors.white,
                          checkmarkColor: Colors.white,
                          selectedcolor: Color(0xff6282C3),
                        ),
                        FilterChips(
                          chip: "On Going Projects",
                          bgColor: Color(0xffFAEFC6),
                          textcolor: Colors.white,
                          checkmarkColor: Colors.white,
                          selectedcolor: Color(0xffF5C400),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Technology Stack",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Filter the result by selecting any of the technology or framework you want to work on.",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Wrap(
                      children: [
                        TechnologyFilterChips(
                          chip: "Flutter",
                        ),
                        TechnologyFilterChips(
                          chip: "React Native",
                        ),
                        TechnologyFilterChips(
                          chip: "Python",
                        ),
                        TechnologyFilterChips(
                          chip: "JavaScript",
                        ),
                        TechnologyFilterChips(
                          chip: "Xamarin",
                        ),
                        TechnologyFilterChips(
                          chip: "Firebase",
                        ),
                        TechnologyFilterChips(
                          chip: "React js",
                        ),
                        TechnologyFilterChips(
                          chip: "Node js",
                        ),
                        TechnologyFilterChips(
                          chip: "Mongo DB",
                        ),
                        TechnologyFilterChips(
                          chip: "MySQL",
                        ),
                        TechnologyFilterChips(
                          chip: "PHP",
                        ),
                        TechnologyFilterChips(
                          chip: "C#",
                        ),
                        TechnologyFilterChips(
                          chip: "Angular js",
                        ),
                        TechnologyFilterChips(
                          chip: "Vue js",
                        ),
                        TechnologyFilterChips(
                          chip: "Django",
                        ),
                        TechnologyFilterChips(
                          chip: "Flask",
                        ),
                        TechnologyFilterChips(
                          chip: "Spring",
                        ),
                        TechnologyFilterChips(
                          chip: "Android",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterChips extends StatefulWidget {
  final String chip;
  final Color bgColor;
  final Color checkmarkColor;
  final Color textcolor;
  final Color selectedcolor;

  const FilterChips(
      {Key key,
      this.chip,
      this.bgColor,
      this.checkmarkColor,
      this.textcolor,
      this.selectedcolor})
      : super(key: key);

  @override
  _FilterChipState createState() => _FilterChipState();
}

bool _isSelected = false;

class _FilterChipState extends State<FilterChips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FilterChip(
        label: Text(
          widget.chip,
          style: TextStyle(
            color: widget.textcolor,
          ),
        ),
        onSelected: (isSelected) {
          setState(() {
            _isSelected = isSelected;
          });
        },
        selected: _isSelected,
        backgroundColor: widget.bgColor,
        checkmarkColor: widget.checkmarkColor,
        selectedColor: widget.selectedcolor,
        elevation: 2.0,
        pressElevation: 5,
      ),
    );
  }
}

class TechnologyFilterChips extends StatefulWidget {
  final String chip;

  const TechnologyFilterChips({
    Key key,
    this.chip,
  }) : super(key: key);

  @override
  _TechnologyFilterChipsState createState() => _TechnologyFilterChipsState();
}

bool _isSelectedtecnology = false;

class _TechnologyFilterChipsState extends State<TechnologyFilterChips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FilterChip(
        label: Text(
          widget.chip,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onSelected: (isSelected) {
          setState(() {
            _isSelectedtecnology = isSelected;
          });
        },
        selected: _isSelectedtecnology,
        backgroundColor: Colors.blue[200],
        checkmarkColor: Colors.white,
        selectedColor: Colors.blue,
        elevation: 2.0,
        pressElevation: 5,
      ),
    );
  }
}
