## To start project

1. Install Bundler

	```bash
	sudo gem install bundler
	```

1. Install gems dependencies

	```bash
	bundle i
	```

1. Install Cocoapods dependencies

	```bash
	bundle e pod install
	```

1. Install Homebrew

	```bash
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	```

1. Homebrew/bundle installation

	```bash
	brew tap Homebrew/bundle
	```
	
1. Install brews dependencies

	```bash
	brew bundle
	```

1. Install Carthage dependencies

	```bash
	carthage update --cache-builds --platform iOS
	```


## To get certificates

Enter project folder in terminal and run

```bash
bundle e fastlane updateAllProfiles
```

Full infomation at [AppManager](https://gitlab.smedialink.com/iOS/AppManager)

## To synchronize folders and groups in project for development

```bash
bundle e synx --no-sort-by-name WeatherApp.xcodeproj
```

## To do

- [ ] Add Carthage for most Cocoapods dependencies
- [ ] Add Carthage optimization with [CarthageCache](https://github.com/guidomb/carthage_cache) or something else
- [ ] Synchronize Cocoapods and Carthage with one script install
- [ ] add CHANGELOG.md