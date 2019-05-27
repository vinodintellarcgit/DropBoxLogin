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




Thanks have a nice day
