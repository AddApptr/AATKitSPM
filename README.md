# AATKitSPM

A swift package manager that wraps AATKit and ad networks (Only ad networks with xcframework binaries are considered)

* For more information about integration steps, please refer to the [integration documentation](https://aatkit.gitbook.io/ios-integration/start/setup/swift-package-manager) 

## Important Note
You have to add -ObjC in your build settings by following these steps:

* Click on the project navigator
* Click on your target and build settings
* Search for "other linker flags"
* Add "-ObjC"
