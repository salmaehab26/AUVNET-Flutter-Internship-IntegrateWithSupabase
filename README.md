# auvnet_flutter_task

A new Flutter project.

mobile application built with Flutter, using Supabase for authentication and remote data(Cloud Database and Cloud Storage), Hive for local caching, and BLoC for state management, following Clean Architecture principles.
- User authentication (Sign up & Login) with Supabase
- Caching restaurants' data locally using Hive
- Clean and responsive UI


-Setup Instructions

  Clone the repo:
     git clone https://github.com/your-username/auvnet_flutter_task.git
  
-Supabase Setup
  Make sure you have created a project on Supabase

Add your URL and anonKey to the Supabase.initialize method in main.dart

-Dependencies

cupertino_icons
flutter_screenutil
flutter_bloc
bloc
flutter_carousel_widget
smooth_page_indicator
supabase_flutter
equatable
cached_network_image
shared_preferences
hive_flutter
