{
  "$GMExtension":"",
  "%Name":"ScreenUtils",
  "androidactivityinject":"",
  "androidclassname":"ScreenUtils",
  "androidcodeinjection":"<YYAndroidManifestManifestInject>\r\n<uses-permission android:name=\"android.permission.WAKE_LOCK\" />\r\n</YYAndroidManifestManifestInject>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n<receiver\r\n            android:name=\".AdminReceiver\"\r\n            android:label=\"Demo\"\r\n            android:permission=\"android.permission.BIND_DEVICE_ADMIN\">\r\n            <meta-data\r\n                android:name=\"android.app.device_admin\"\r\n                android:resource=\"@xml/device_admin_sample\" />\r\n            <intent-filter>\r\n                <action android:name=\"android.app.action.DEVICE_ADMIN_ENABLED\" />\r\n            </intent-filter>\r\n</receiver>\r\n</YYAndroidManifestApplicationInject>\r\n\r\n",
  "androidinject":"<receiver\r\n            android:name=\".AdminReceiver\"\r\n            android:label=\"Demo\"\r\n            android:permission=\"android.permission.BIND_DEVICE_ADMIN\">\r\n            <meta-data\r\n                android:name=\"android.app.device_admin\"\r\n                android:resource=\"@xml/device_admin_sample\" />\r\n            <intent-filter>\r\n                <action android:name=\"android.app.action.DEVICE_ADMIN_ENABLED\" />\r\n            </intent-filter>\r\n</receiver>",
  "androidmanifestinject":"<uses-permission android:name=\"android.permission.WAKE_LOCK\" />",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"",
  "copyToTargets":562949953421320,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"0.0.1",
  "files":[
    {"$GMExtensionFile":"","%Name":"","constants":[],"copyToTargets":-1,"filename":"ScreenUtils.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"changeScreenLight","argCount":0,"args":[2,],"documentation":"","externalName":"changeScreenLight","help":"changeScreenLight(light)","hidden":false,"kind":4,"name":"changeScreenLight","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"turnOffScreen","argCount":0,"args":[],"documentation":"","externalName":"turnOffScreen","help":"turnOffScreen()","hidden":false,"kind":4,"name":"turnOffScreen","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"","kind":4,"name":"","order":[
        {"name":"changeScreenLight","path":"extensions/ScreenUtils/ScreenUtils.yy",},
        {"name":"turnOffScreen","path":"extensions/ScreenUtils/ScreenUtils.yy",},
      ],"origname":"","ProxyFiles":[],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"",
  "ioscodeinjection":"",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":false,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"ScreenUtils",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"扩展",
    "path":"folders/扩展.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":"",
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"",
  "tvosdelegatename":"",
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}