import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBTx1lTRCGJkjSA-HeQJvQBElLq8bZVF_M",
            authDomain: "hurbhub23.firebaseapp.com",
            projectId: "hurbhub23",
            storageBucket: "hurbhub23.appspot.com",
            messagingSenderId: "463936766369",
            appId: "1:463936766369:web:09eb8cd654016403094be0",
            measurementId: "G-YMYN9WJZZS"));
  } else {
    await Firebase.initializeApp();
  }
}
