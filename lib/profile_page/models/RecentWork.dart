class RecentWork {
  final String image, category, title;
  final int id;

  RecentWork({required this.id, required this.image, required this.category, required this.title});
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: "Tuples",
    category: "Python",
    image: "assets/images/work_1.png",
  ),
  RecentWork(
    id: 2,
    title: "Drop down",
    category: "Flutter",
    image: "assets/images/work_2.png",
  ),
  RecentWork(
    id: 3,
    title: "Images",
    category: "HTML",
    image: "assets/images/work_3.png",
  ),
  RecentWork(
    id: 4,
    title: "api handling",
    category: "Node js",
    image: "assets/images/work_4.png",
  ),
  
];
