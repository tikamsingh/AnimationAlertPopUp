//
//  AppDelegate.h
//  DexsatiFramwork
//
//  Created by TIKAM CHANDRAKAR on 30/05/15.
//  Copyright (c) 2015 XYMOB. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    IBOutlet UIView *loadingView;
    IBOutlet UIView *fadeView;
    IBOutlet UIView *messageView;
    IBOutlet UILabel *message;
    IBOutlet UILabel *messageTitle;

    
    IBOutlet UIView *helpView;
    IBOutlet UILabel *helpMessage;
    BOOL helpMsgVisible;
}
@property (nonatomic, strong) ViewController *viewController;
@property (assign, nonatomic) NSInteger imageCounter;
@property (strong, nonatomic) IBOutlet UIWindow *window;

- (void)showLoadingViewWithMsg:(NSString *)_message;
- (void)hideLoadingView;
- (void)showFadeView;
- (void)hideFadeView;
- (void)showHelpMessage :(NSString *)_helpMessage title:(NSString *)title height:(CGFloat) height;
- (IBAction)hideHelpMessage;
@end

