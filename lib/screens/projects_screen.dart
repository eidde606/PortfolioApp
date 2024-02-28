import 'package:flutter/material.dart';

import 'details_page.dart';

List<ImageDetails> _images = [
  (ImageDetails(
    img: 'assets/images/AndreyPro.png',
    title: 'AndreysProLandscaping',
    description:
        'Explore the completed landscaping website, showcasing my dedication to exceptional outdoor solutions. This project is now actively used by a real landscaping company.',
    link: 'https://jocular-melomakarona-435b13.netlify.app',
  )),
  (ImageDetails(
    img: 'assets/images/gameHub.png',
    description:
        "Created a responsive game catalog website with React.js and Chakra UI. Users can explore games by genre, highlighting expertise in responsive design and UI development, perfect for a web developer's portfolio.",
    link: "https://papaya-hamster-1f1519.netlify.app",
    title: 'GameHub',
  )),
  (ImageDetails(
    img: 'assets/images/todoList.png',
    description:
        'I built TodoList, a full-stack task management app with React and Material-UI. Users can add, edit, and delete tasks, with a responsive design for seamless usage. The app interacts with my Heroku-deployed backend, featuring MongoDB for data storage.',
    link: 'https://todolistfrontend-e161200f9920.herokuapp.com/',
    title: 'TodoList',
  )),
  (ImageDetails(
    img: 'assets/images/myreads.jpeg',
    description:
        'MyReads streamlines bookshelf management, allowing you to effortlessly categorize your reading list and access book details with ease. Stay organized and elevate your reading experience',
    link: "https://golden-seahorse-850414.netlify.app/",
    title: 'MyReads',
  )),
];

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Projects',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              img: _images[index].img,
                              title: _images[index].title,
                              description: _images[index].description,
                              link: _images[index].link,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_images[index].img),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String img;
  final String title;
  final String description;
  final String link;

  ImageDetails(
      {required this.img,
      required this.description,
      required this.link,
      required this.title});
}
