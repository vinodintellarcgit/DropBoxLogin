# DropBoxLogin

Follow below mentioned process to integrate DropBox integration in your iOS swift project.

Open your Project in Xcode, Create podfile and install following pod.

pod 'SwiftyDropbox'.


Login to your Dropbox Account and go to App Console and Create App Then
1. Choose an API.
2. Choose the type of access you need.
3. Name your app.

And Click Create App.


Now open your plist as a source and paste following snipet. 

<key>LSApplicationQueriesSchemes</key>
    <array>
        <string>dbapi-8-emm</string>
        <string>dbapi-2</string>
    </array>

<key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>db-<APP_KEY></string>
            </array>
            <key>CFBundleURLName</key>
            <string></string>
        </dict>
    </array>


Now open your project's AppDelegate and paste your App Key in didFinishLaunchingWithOptions Method.


import SwiftyDropbox

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         DropboxClientsManager.setupWithAppKey("Put your App Key here")
        return true
    }


You can commence the auth flow by calling authorizeFromController:controller:openURL method in your Projects's view controller.

import SwiftyDropbox

func myButtonInControllerPressed() {
    DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                  controller: self,
                                                  openURL: { (url: URL) -> Void in
                                                    UIApplication.shared.openURL(url)
                                                  })
}

Handle redirect back into SDK

To handle the redirection you should add the following code in your AppDelegate file.


import SwiftyDropbox

func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if let authResult = DropboxClientsManager.handleRedirectURL(url) {
        switch authResult {
        case .success:
            print("Success! User is logged into Dropbox.")
        case .cancel:
            print("Authorization flow was manually canceled by user!")
        case .error(_, let description):
            print("Error: \(description)")
        }
    }
    return true
}



Thanks have a nice day
