Folder Structure

```
meta_package/
├─ pubspec.yaml
├─ pubspec.lock
├─ lib/
│  ├─ apis/
│  │  ├─ api_client/
│  │  ├─ api_core/
│  │  ├─ api_endpoint/
│  │  ├─ api_repository/
│  │  ├─ models/
│  ├─ meta_package.dart
│  ├─ translations/
│  │  ├─ translations.dart
│  ├─ utils/
│  │  ├─ date_utils.dart
│  │  ├─ global_singlton.dart
│  ├─ helper/
│  │  ├─ /
│  ├─ service/
│  │  ├─ /
│  │  
│  │
```

To generate translations files after csv is updated, run:

```
flutter pub run translations_gen
```

# Instructions on handling translations

[Google docs](https://docs.google.com/document/d/1Nv-Ho7Ueoyb68EJUkM9Nn3rrsPCZkJCE-1PdEQvwcVM/edit?usp=sharing)
