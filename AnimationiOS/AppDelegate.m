//
//  AppDelegate.m
//  DexsatiFramwork
//
//  Created by TIKAM CHANDRAKAR on 30/05/15.
//  Copyright (c) 2015 XYMOB. All rights reserved.
//

#import "AppDelegate.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface AppDelegate ()
{
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.viewController = [[ViewController alloc] init];
    [_window setRootViewController: self.viewController];
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)showLoadingViewWithMsg:(NSString *)_message
{
    if(([self isDeviceIPad] && [self isIOS8]) || ![self isDeviceIPad])
    {
        [self resizeViewForiPhoneAndiPod:loadingView];
        messageView.layer.cornerRadius = 6;
        messageView.center = loadingView.center;
    }
    message.text = _message;
    [self.window addSubview:loadingView];
    
}
- (void)hideLoadingView
{
    [loadingView removeFromSuperview];
}

- (void)showFadeView
{
    if(([self isDeviceIPad] && [self isIOS8]) || ![self isDeviceIPad])
    {
        [self resizeViewForiPhoneAndiPod:fadeView];
    }
    [self.window addSubview:fadeView];
}

- (void)hideFadeView
{
    [fadeView removeFromSuperview];
}

- (void)showHelpMessage :(NSString *)_helpMessage  title:(NSString *)title height:(CGFloat) height
{
    
    if(helpMsgVisible)
    {
        
        [self hideHelpMessage];
        return;
    }
    [self showFadeView];
    helpMsgVisible = YES;
    helpView.hidden = NO;

    helpMessage.text = _helpMessage;
    CGSize maximumLabelSize = CGSizeMake([self deviceWidth]-100,1000);
    CGRect fontSize = [helpMessage.text boundingRectWithSize:maximumLabelSize
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:18]}
                                                     context:nil];
    
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         helpView.frame = CGRectMake([self getXpoint:[self deviceWidth]-80 frameWidth:[self deviceWidth]]
                                                     , [self deviceHeight]-fontSize.size.height - 60-100,[self deviceWidth]-80, fontSize.size.height + 60);;
                         if(title != nil)
                         {
                             messageTitle.text = title;
                             [helpMessage setFrame:CGRectMake(10, 40, [self deviceWidth]-100, fontSize.size.height)];
                         }
                         else{
                             messageTitle.text = @"";
                             [helpMessage setFrame:CGRectMake(10, 5, [self deviceWidth]-100, fontSize.size.height)];
                         }
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [helpView removeFromSuperview];
                         [self.window addSubview:helpView];
                         
                     }];
    
}
- (IBAction)hideHelpMessage
{
    [self hideFadeView];
    helpMsgVisible = NO;
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         helpView.frame = CGRectMake([self deviceWidth]
                                                     , [self deviceHeight],0, 0);
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [helpView removeFromSuperview];
                        [self.window addSubview:helpView];
                         helpView.hidden = YES;
                     }];
    
    
}

-(void)resizeViewForiPhoneAndiPod:(UIView*)targetView
{
    // if device is iPad then we dont need to set frame size for target view
    //if ([Helper isDeviceIPad])  return;
    if([self isDeviceIPad] && [[[UIDevice currentDevice] systemVersion] doubleValue] < 8.0)
    {
        return;
    }
    // this frame setting is for iPhone 5 and other iPhone/iPodTouch devices
    targetView.frame =  CGRectMake(targetView.frame.origin.x,
                                   targetView.frame.origin.y,
                                   [[UIScreen mainScreen]bounds].size.width,
                                   [[UIScreen mainScreen]bounds].size.height);
}

- (BOOL) isDeviceIPad
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    }
#endif
    return NO;
}
- (BOOL)isIOS8
{
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)isPhone6
{
    if([self deviceWidth] == 375)
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isPhone5
{
    if([self deviceHeight] == 568)
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isPhone6Plus
{
    if([self deviceWidth] > 375)
    {
        return YES;
    }
    
    return NO;
}

-(CGFloat)deviceWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)deviceHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

- (CGFloat)getXpoint:(CGFloat)width frameWidth:(CGFloat)frameWidth
{
    //    DebugLog(@"Top frameWidth %f",frameWidth);
    //    DebugLog(@"width %f",width);
    //    DebugLog(@"return; %f", (frameWidth - width)/2);
    
    return (frameWidth - width)/2;
}


- (CGFloat)getYpoint:(CGFloat)height frameHeight:(CGFloat)frameHeight
{
    return -(frameHeight - height)/2;
}


- (CGFloat)getYpointForViewController:(CGFloat)height frameHeight:(CGFloat)frameHeight
{
    //DebugLog(@"Top frameHeight %f",frameHeight);
    //  DebugLog(@"Height %f",height);
    return (frameHeight - height)/2;
}


@end
