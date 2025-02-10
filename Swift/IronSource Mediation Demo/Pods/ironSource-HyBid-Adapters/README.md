# ironSource-hybid-adapters-ios
> Mediation adapters to be used in conjunction with ironSource iOS SDK to deliver HyBid Ads on iOS devices.

If you want to display HyBid Ads in your iOS application through ironSource, you’re at the right place.

## Requirements

- ![Platform: iOS 10.0+](https://img.shields.io/badge/Platform-iOS%2010.0%2B-blue.svg?style=flat)
- ![Xcode: 12.0+](https://img.shields.io/badge/Xcode-12.0+-blue.svg?style=flat)

## Features

- [x] Displaying HyBid Ads

## Installation

#### CocoaPods

If your project is managing dependencies through [CocoaPods](https://cocoapods.org/), you just need to add this pod in your `Podfile`.

It will install HyBid Adapters, as well as HyBid iOS SDK and ironSource iOS SDK (If not installed already).

1. Add pod named `ironSource-HyBid-Adapters` in your Podfile:

```ruby
platform :ios, '12.0'
pod 'ironSource-HyBid-Adapters', '3.2.0-beta5.0'
```

2. Run `pod install --repo-update` to install the pod in your project.
3. Integrate latest version of HyBid iOS SDK to your project using [HyBid Setup Guide](https://github.com/pubnative/pubnative-hybid-ios-sdk/wiki/Setup-HyBid).
4. If needed, implement [ironSource iOS SDK](https://developers.is.com/ironsource-mobile/ios/ios-sdk/) in your application.
5. Based on your needs, define custom events using the [Mediation]() page to finish the integration.
6. You’re done.

#### Manually

1. Integrate latest version of HyBid iOS SDK to your project using [HyBid Setup Guide](https://github.com/pubnative/pubnative-hybid-ios-sdk/wiki/Setup-HyBid).
2. If needed, implement [ironSource iOS SDK](https://developers.is.com/ironsource-mobile/ios/ios-sdk/) in your application.
3. Download the desired release of [ironSource HyBid Adapters](https://github.com/pubnative/ironSource-hybid-adapters-ios/releases).
4. Drag & Drop adapter files in your iOS project.
5. Based on your needs, define custom events using the [Mediation]() page to finish the integration.
6. You’re done.

## Integration Documentation

Integration instructions are available on [HyBid iOS SDK Documentation](https://github.com/pubnative/pubnative-hybid-ios-sdk/wiki) GitHub Wiki page.
