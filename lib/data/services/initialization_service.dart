import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InitializationService {
  static Future<void> initializeApp() async {
    await loadEnv();

    await initializeSupabase();
    await initializeGemini();
  }

}


Future<void> loadEnv () async{
  await dotenv.load();
}

Future<void> initializeSupabase() async{
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );
}

Future<void> initializeGemini() async{
  await Gemini.init(
    apiKey: dotenv.env['gemini_api_key'] ?? '',
    );
}