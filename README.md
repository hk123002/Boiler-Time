# Corn Market

<a href="https://flutter.dev/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png">
      <img alt="Flutter" src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png">
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

    
    ├── market                  
    │   ├── post using floating button (+)
    │   │   ├── camera function
    │   ├── view item (categorize & filter, search)
    │   │   ├──route to chat page with the user
    │   ├── view & edit my post (via filter my post functionality) 
    ├── community
    │   ├── post using floating button (+)
    │   ├── view item 
    │   │   ├──comment
    │   ├── view & edit my post (via filter my post functionality) 
    ├── chat (new chat starts via market)
    │   ├── view existing chat (as a list)
    │   ├── basic chat functionality
    ├── profile
    │   ├── view & edit my profile
    │   ├── transaction history (those that are marked as sold)
    ├── side menu                 
    │   ├── log out
    │   ├── contact us
    
   ## project structure

    
    ├── constants
    |  ├── routes
    ├── enums    
    ├── services
    |  ├── auth
    ├── utility
    |   ├── showe error dialog
    ├── views    
    │   ├── auth
    │   ├── chat
    │   ├── community
    │   ├── market
    │   ├── profile
    ├── main    
    
   
