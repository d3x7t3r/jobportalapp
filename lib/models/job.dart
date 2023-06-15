class Job {
  final String title;
  final String company;
  final String location;
  final String type;
  final String description;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.description,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      company: json['company'],
      location: json['location'],
      type: json['type'],
      description: json['description'],
    );
  }
}
