# Firebase Cloud Messaging Example

## Getting Started

Create a [firebase](https://console.firebase.google.com/project/) project.

add name and continue

then click on Android

![img.png](img.png)

Go to <your-project>/android/app/src/main/AndroidManifest.xml

copy "package" name (if does not have, add it at the end of xmlns: `package="com.example.fcm_example"`)

add it in firebase console

![img_1.png](img_1.png)

and click on Register app.

download `google-services.json` and put it under /src folder and add next.

To make the google-services.json config values accessible to Firebase SDKs, you need the Google services Gradle plugin.

Add the plugin as a dependency to your project-level build.gradle.kts file:

Root-level (project-level) Gradle file (<project>/build.gradle):

```
dependencies {
        ...
        classpath 'com.google.gms:google-services:4.4.0'
    }
```

Then, in module (app-level) Gradle file (<project>/<app-module>/build.gradle):

```
plugins {
  
  // Add the Google services Gradle plugin
  id "com.google.gms.google-services"
}

dependencies {
  // Import the Firebase BoM
    implementation platform('com.google.firebase:firebase-bom:32.4.1')

  // TODO: Add the dependencies for Firebase products you want to use
  // When using the BoM, don't specify versions in Firebase dependencies
  //implementation("com.google.firebase:firebase-analytics-ktx")


  // Add the dependencies for any other desired Firebase products
  // https://firebase.google.com/docs/android/setup#available-libraries
}
```

After adding the plugin and the desired SDKs, sync your Android project with Gradle files.

## Send Background Notification

After adding `firebase_api` and changing `main` method in [first commit](https://github.com/FtADev/FCM-Example/commit/a7e8b03663afd963c8756678d9266b1414126f83) and [second commit](https://github.com/FtADev/FCM-Example/commit/4979ec2c8b77e8bf328e074421b6bb11d1dbf157)

you can push a notification from your firebase console 

Go to your project page

![img_2.png](img_2.png)

![img_3.png](img_3.png)

![img_4.png](img_4.png)

After filling the fields click on send test message

![img_5.png](img_5.png)

Here you can add your token (That we were printing on the code) to target that specific device and click on add icon.

put the app in the background (or terminate it) and click on test!

## Routing

If you want to route to a specific screen by clicking on notification, you can see these commits:

1. [Add screens](https://github.com/FtADev/FCM-Example/commit/15f934c6974b19840c3202416d31eb6faa991ae8)

2. [Handle Messages](https://github.com/FtADev/FCM-Example/commit/8914a8cdc8275cca64b35324bed14537b2045957)

## Local Notifications

What should we do if we want to receive a notification when app is in foreground?

Just follow [this commit](https://github.com/FtADev/FCM-Example/commit/23bc2f58b405085def4785dc0e44e25c9bef9015)!

