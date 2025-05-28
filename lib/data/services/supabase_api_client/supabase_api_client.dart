import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unitontro/data/model/class_model.dart';

class SupabaseApiClient {
  final SupabaseClient _supabase;
  
  SupabaseApiClient() : _supabase = Supabase.instance.client;

  Future<List<ClassInfo>> getClasses() async {
    try {
      final response = await _supabase
          .from('classes')
          .select()
          .order('time', ascending: true);
      
      
      if(response.isEmpty) {
        print("No classes found");
        return [];
      }

      return response
          .map((classData) => ClassInfo.fromSupabase(classData))
          .toList();
    } catch (e) {
      print("Error fetching classes: $e");
      return [];
    }
  }
}