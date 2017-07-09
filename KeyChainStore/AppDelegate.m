//
//  AppDelegate.m
//  KeyChainStore
//
//  Created by gaoguangxiao on 2017/7/9.
//  Copyright © 2017年 gaoguangxiao. All rights reserved.
//

#import "AppDelegate.h"
#import "KeychainItemWrapper.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"comXinHaoHuikey" accessGroup:nil];// 1
    NSString *imkey = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    //模拟器获取的钥匙串 是空
    if (!imkey || imkey.length==0) {
        NSString *randomkey = [NSString stringWithFormat:@"%u%u%u%u%u%u%u%u%u%u",arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10,arc4random()%10];
        [keychain setObject:randomkey forKey:(__bridge id)(kSecAttrAccount)];// 2
        
    }
    imkey = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSLog(@"钥匙串保存的信息：%@",imkey);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
