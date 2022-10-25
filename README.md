# Boiler Time

<a href="https://flutter.dev/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="![boiler time banner](https://user-images.githubusercontent.com/89869612/197655945-524d6f7d-a44d-49c7-8e18-c6348baa05e6.png)">
      <img alt="Flutter" src="![boiler time banner](https://user-images.githubusercontent.com/89869612/197655945-524d6f7d-a44d-49c7-8e18-c6348baa05e6.png)">
    </picture>
  </h1>
</a>


Flutter is Google's SDK for crafting beautiful, fast user experiences for
mobile, web, and desktop from a single codebase. Flutter works with existing
code, is used by developers and organizations around the world, and is free and
open source.

## Documentation

* [Install Flutter](https://flutter.dev/get-started/)
* [Flutter documentation](https://docs.flutter.dev/)
* [Development wiki](https://github.com/flutter/flutter/wiki)
* [Contributing to Flutter](https://github.com/flutter/flutter/blob/master/CONTRIBUTING.md)

For announcements about new releases, follow the
[flutter-announce@googlegroups.com](https://groups.google.com/forum/#!forum/flutter-announce)
mailing list. Our documentation also tracks [breaking
changes](https://docs.flutter.dev/release/breaking-changes) across releases.



## Getting Started

Make sure your Flutter environment is setup

[Flutter setup](https://flutter.dev/get-started/)

Add Firebase to your Flutter app

[Add Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)

## what we need

    
    ├── Home  
    │   ├── icons
    |   │   ├── bus schedule
    |   │   ├── brightspace
    |   │   ├── Academic schedule
    |   │   ├── dining menu
    |   │   ├── library time
    │   ├── advertisement
    │   ├── pineed comunity
    ├── community
    │   ├── post list via popularity
    │   │   ├── community
    ├── Calendar 
    ├── Boiler
    │   ├── view & edit my profile
    │   ├── all community
    ├── side menu                 
    │   ├── log out

    
   ## project structure

    
    ├── constants
    |  ├── routes
    ├── enums  
    |  ├── menu_action
    ├── services
    |  ├── auth
    ├── utility
    |   ├── show_error_dialog
    ├── views    
    │   ├── auth
    │   ├── community
    │   ├── calendar
    │   ├── boiler
    │   ├── home
    ├── main    
    
   ## Data base structure

    
    ├── user
    │   ├──email
    │   ├──id
    │   ├──name
    ├── calendar
    │   ├──schedule
    
    
## dependecy

flutter pub add cloud_firestore

https://pub.dev/packages/persistent_bottom_nav_bar

https://pub.dev/packages/time_planner   

https://pub.dev/packages/dropdown_button2

https://pub.dev/packages/url_launcher

https://pub.dev/packages/flat_banners/example

https://pub.dev/packages/banner_carousel
