# Coordination
Coordination is a swift framework that utilizes Coordinator pattern to separate navigation code from UI and business logic.

## Installation

Coordination is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Coordination'
```

## Usage

to start Using Coordination you have to create an applicationCoordinator to control whole app and initialize it in SceneDelegate (or AppDelegate if you're still not using XCode 11+)
```swift
let appWindow = UIWindow(windowScene: windowScene)
    applicationCoordinator = ApplicationCoordinator(window: appWindow)
    applicationCoordinator?.start()
    self.window = appWindow
```
then in the main coordinator you can add methods for every main flow 
```swift
 func runAuthenticationFlow() {
    let loginCoordinator = LoginCoordinator(router: router)
    router.setRootModule(loginCoordinator) {
      self.removeChild(loginCoordinator)
    }
    loginCoordinator.parentCoordinator = self
    addChild(loginCoordinator)
  }
```
Note: There is a completion block you'll have to add whenever you push a new coordinator, set root module, etc... as it will be implemented when the corresponding viewcontroller is popped through a back button or before setting root module.

For full understanding please have a look at the example project 🤓.

## Example

To try the example project:
clone the repo, run the example project. it's simple as that 😄.


## Contributions

If you have some ideas on how to improve the framework, Fork it, implement your changes and create that pull request already 😉.

All contributions are welcome 🤓.

## Author

Built by [Ahmed Khaled](https://github.com/ahmedkhaledselim)

## License

Coordination is available under the MIT license. See the LICENSE file for more info.
