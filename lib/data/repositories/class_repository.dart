import 'package:unitontro/data/model/class_model.dart';
import 'package:unitontro/data/services/supabase_api_client/supabase_api_client.dart';

class ClassRepository {
  final SupabaseApiClient _apiClient;
  
  ClassRepository() : _apiClient = SupabaseApiClient();

  Future<List<ClassInfo>> getClasses() async {
    return await _apiClient.getClasses();
  }
}