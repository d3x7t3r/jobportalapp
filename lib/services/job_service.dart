import 'package:jobportalapp/models/job.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobService {
  Future<List<Job>> fetchJobs() async {
    const url = 'https://jobs.github.com/positions.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Job> jobs = data.map((json) => Job.fromJson(json)).toList();
        return jobs;
      } else {
        throw Exception('Failed to fetch jobs');
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
