# Weather
This is the wather test app developed by Javier Jara please refer to instructions below in order to run the app properly. 

Weather app was developed using Xcode 9.1 and targeting iOS Devices > 10.0  

##Instalation 

As requested Alamofire was required as Networking layer you must install pods for this project, please refer to [I'm an inline-style link](https://guides.cocoapods.org/using/getting-started.html) for pods usage. 

## Architechure 

The app was developed following the Clean Swift Architecture by Raymond Law [More details](https://clean-swift.com/clean-swift-ios-architecture). From my standpoint this is the most solid architecture, has is learning curve but solves a lot of problems from MVC and MVVM (for example the couping with RxSwift -> which has a higher learning curve). 

Even tough getting the View Controllers is a hard task since exists dependendies on UI Delegates, and UI manipulation that belongs to this layer. 

## Simulator CLLocation Woraround 

Once installed pods and opnened the Weather workspace is quite possible you will get stuck while loading initial view. In case you are stuck while loading cities at the inital view and see the following error in console: 

`Error The operation couldn’t be completed. (kCLErrorDomain error 0.)`

Do the follwing: 

Product -> Scheme -> Edit Scheme -> Options -> Allow Location Simulation must be checked and try providing a default location, don't leave it set to "none"

## Pending

In order to have the project in the best form it MUST need to implement test. I now in a TDD test should go first, but I'd say this is one of the pitfails for Clean Swift, writing tests can be messy for covering all the architecture layers, due the lack of time I decided to leave test fo the end, however haven't any yet, is quite possible will update this in future commits. 

## Different Approach

Just as a note there is a requirement for displaying an Alert Controller on localization permissions disabled. I'm showing a view instead of that, should be a quick change, but will leave my current implementation for now. 
