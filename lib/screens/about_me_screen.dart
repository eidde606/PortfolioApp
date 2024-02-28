import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/skill_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'About Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                height: 40,
                color: Colors.white,
              ),
              const Text(
                'Who am I?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "I'm Eddie Nazario, a Junior React Developer based in Hopewell, VA. With a strong background in Information Technology and a foundation in Respiratory Therapy, I bring a unique blend of skills and adaptability to web development. I've honed my development expertise at Vet Tech IT Services LLC, collaborating in agile environments. Proficient in React, JavaScript, CSS, HTML5, Flutter, Bootstrap, ChakraUI, and Github. I'm passionate about creating user-friendly web applications and continually expanding my skill set. Fluent in both English and Spanish, I thrive in diverse communication settings.Let's connect and explore exciting web development opportunities together!",
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Work Timeline',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Junior React Developer / Vet Tech IT Services LLC / Feb 2020 - May 2022 / Midlothian, VA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Freelance React Developer / Andrey's ProLandscaping & Tree Services LLC / Aug 2023 - Jan 2024 / Midlothian, VA",
              ),
              const Text(
                'Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SkillCard(title: 'React'),
                      SkillCard(title: 'React Native'),
                      SkillCard(title: 'Flutter'),
                      SkillCard(title: 'Javascript'),
                      SkillCard(title: 'HTML'),
                      SkillCard(title: 'GitHub'),
                      SkillCard(title: 'CSS'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
