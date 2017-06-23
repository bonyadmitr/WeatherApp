## To start project

Enter project folder in terminal and run

```bash
chmod +x ./install; ./install
```

> `chmod +x` needs to unlock custom scrpits.

> Without it you will get error: "Permission denied".

> `./install` simply runs the script.

## Terminal commands

<!--
## To get certificates

```bash
bundle e fastlane updateAllProfiles
```
-->

#### To synchronize folders and groups in project for development

```bash
bundle e synx --no-sort-by-name WeatherApp.xcodeproj
```

#### Update Carthage dependencies

```bash
carthage update --cache-builds --platform iOS
```

#### Update Cocoapods dependencies

```bash
bundle e pod update
```

#### Print code lines count

```bash
cloc ./WeatherApp
```


## To do

- [x] Add Carthage for most Cocoapods dependencies
- [x] Add Carthage optimization
- [x] Synchronize Cocoapods and Carthage with one script install
- [ ] add CHANGELOG.md