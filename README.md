# Artlist DL

A Mac OS Desktop app made to download songs form [artlist.io](https://www.artlist.io) easily without requiring a premium account.


## Technical aspects

The desktop app runs on MacOS and utilises the power of cross-platform framework Flutter and the language features of Dart

## Getting started

- Go to the Releases section, grab the `artlist_dl.app` from there, and double click it after it's downloaded. It might show a prompt 
"This app is from an untrusted developer"
 So you would ideally follow the steps below
- Whitelist the app from the `Control Center`. Go to `Security` and click `Allow files from Unidentified Developers`
- The app will now launch automatically
- You can move the `.app` file to the `Applications` Folder by dragging it via the Finder

Self help links: 
- https://www.switchingtomac.com/macos/how-to-open-files-from-unidentified-developers-on-mac/


## Supported Features and extra information

- Download a single song and/or album via its direct link
  - Example of supported song link: [From Dream to Reality](https://artlist.io/royalty-free-music/song/from-dream-to-reality/130067)
  - ~~Albums is not supported since 1.2 since the backend is driven by Server Driven UI~~

- To search a song, Go to https://www.artlist.io, find your song, copy the link in the text field in the browser and paste it in the app. Then press enter so that the app can load the details for you 

> Note : Only the urls in the above formats are supported

- All the songs are downloaded under the `Artlist` folder in your `Downloads` directory. The download progress is shown while the download is happening

  

