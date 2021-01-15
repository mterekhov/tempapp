//
//  AppDelegate.m
//  tempapp
//
//  Created by Mihail Terekhov on 15.01.2021.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self createWindow];
    [self createMenu];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - Routine -

- (void)createWindow {
    NSSize screenSize = NSMakeSize(CGRectGetWidth(NSScreen.mainScreen.frame), CGRectGetHeight(NSScreen.mainScreen.frame));
    NSSize windowSize = NSMakeSize(800, 600);
    NSRect windowFrame = NSMakeRect(ceil(screenSize.width / 2 - windowSize.width / 2),
                                    ceil(screenSize.height / 2 - windowSize.height / 2),
                                    windowSize.width,
                                    windowSize.height);
    NSWindow *newWindow = [[NSWindow alloc] initWithContentRect: windowFrame
                                                      styleMask: NSWindowStyleMaskMiniaturizable| NSWindowStyleMaskTitled  | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable
                                                        backing: NSBackingStoreBuffered
                                                          defer: NO];
    newWindow.title = [[NSProcessInfo processInfo] processName];
    [newWindow makeKeyAndOrderFront: self];
    
    newWindow.contentViewController = [self createViewControllerWithViewFrame:NSMakeRect(0,
                                                                                         0,
                                                                                         windowSize.width,
                                                                                         windowSize.height)];
}

- (NSViewController *)createViewControllerWithViewFrame: (NSRect) viewFrame {
    NSView *cleanView = [[NSView alloc] initWithFrame: viewFrame];
    cleanView.wantsLayer = YES;
    cleanView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    
    NSViewController *newvc = [NSViewController new];
    newvc.view = cleanView;
    return  newvc;
}

- (void)createMenu {
    NSString *quitTitle = [@"Quit " stringByAppendingString: [[NSProcessInfo processInfo] processName]];
    NSMenuItem *quitMenuItem = [[NSMenuItem alloc] initWithTitle: quitTitle
                                                          action: @selector(terminate:)
                                                   keyEquivalent: @"q"];
    NSMenu *appMenu = [NSMenu new];
    [appMenu addItem: quitMenuItem];
    
    NSMenuItem *appMenuItem = [NSMenuItem new];
    [appMenuItem setSubmenu: appMenu];

    NSMenu *menubar = [NSMenu new];
    [menubar addItem: appMenuItem];
    NSApp.mainMenu = menubar;
}

@end
