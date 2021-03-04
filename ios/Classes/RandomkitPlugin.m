#import "RandomkitPlugin.h"
#if __has_include(<randomkit/randomkit-Swift.h>)
#import <randomkit/randomkit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "randomkit-Swift.h"
#endif

@implementation RandomkitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRandomkitPlugin registerWithRegistrar:registrar];
}
@end
