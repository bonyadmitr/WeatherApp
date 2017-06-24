## To start project

Enter project folder in terminal and run

```bash
chmod +x ./install; ./install
```

> `chmod +x` needs to unlock custom scrpits.

> Without it you will get error: "Permission denied".

> `./install` simply runs the script.

## Terminal commands

#### To get all certificates

```bash
bundle e fastlane profiles
# or
bundle e match ... (one of: "development", "appstore", "adhoc")
```

#### To synchronize folders and groups in project for development

```bash
bundle e fastlane synx
# or
bundle e synx --no-sort-by-name WeatherApp.xcodeproj
```

#### Update Carthage dependencies and install new ones

```bash
bundle e fastlane carthages
# or
carthage update --cache-builds --platform iOS
```

#### Install Cocoapods dependencies

```bash
bundle e fastlane pods
# or
bundle e pod install
```

#### Print code lines count

```bash
bundle e fastlane clocc
# or
cloc ./WeatherApp
```


## To do

- [x] Add Carthage for most Cocoapods dependencies
- [x] Add Carthage optimization
- [x] Synchronize Cocoapods and Carthage with one script install
- [ ] add CHANGELOG.md
- [ ] add CI
- [ ] add DI
- [ ] add tests
- [ ] add data bases (core data, realm)
- [ ] add debug screen to change urls