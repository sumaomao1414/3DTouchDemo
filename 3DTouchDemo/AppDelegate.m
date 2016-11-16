//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by maomao on 2016/11/3.
//  Copyright © 2016年 maomao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
#import "ShareViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
  = = = = = = =  十分钟上手3D Touch = = = = = = = =
    简介：
    http://baike.baidu.com/link?url=kQjZeWx7EixklHdi6zI4AN0Ho_boVi6c6vX_MgfIJCNec1pfXmBdJdivPK_NWGsE_To6bLdJX1PvqDaVMTOacZbRdblzDvykJTZt__UycXS
 
    主要讲3DTouch各种场景下的开发方法，开发主屏幕应用icon上的快捷选项标签（Home
    Screen Quick Actions），静态设置UIApplicationShortcutItem，动态添加、修改
    UIApplicationShortcutItem，peek和pop的实现。
 
 一、主屏幕按压应用图标展示快捷选项（Home Screen Quick Actions）
 　　应用快捷选项标签，iOS9为我们提供了2种方式来开发按压应用图标展示快捷选项功能（Home Screen Quick Actions）。
 
    1.静态标签
 　　打开项目的plist文件，添加如下项
 
    UIApplicationShortcutItems：数组中的元素就是我们的那些快捷选项标签。
 
    UIApplicationShortcutItemTitle：标签标题（必填）
 
    UIApplicationShortcutItemType：标签的唯一标识（必填）
 
    UIApplicationShortcutItemIconType：使用系统图标的类型，如搜索、定位、home等（可选）
 
    UIApplicationShortcutItemIconFile：使用项目中的图片作为标签图标（可选）
 
    UIApplicationShortcutItemSubtitle：标签副标题（可选）
 
    UIApplicationShortcutItemUserInfo：字典信息，如传值使用（可选）
 
 　2.动态标签
 　　在AppDelegate.m文件中写代码：（如下）
 
 二、 peek  and  pop  
 
 三、3DTouch压力值的运用
 
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

    //创建应用图标上的3D touch快捷选项
    [self creatShortcutItem];
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
    if (shortcutItem) {
        //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"com.mycompany.myapp.one"]){
            
        } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.search"]) {//进入搜索界面
            SearchViewController *childVC = [[SearchViewController alloc]init];
            [nav pushViewController:childVC animated:NO];
        } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]) {//进入分享界面
            ShareViewController *childVC = [[ShareViewController alloc]init];
            [nav pushViewController:childVC animated:NO];
            
            NSArray *arr = @[@"hello 3D Touch",@"你好啊   我在写demo ",@"啦啦啦啦啦啦啦啦啦"];
            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            }];
        }
        return NO;
    }
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

//如果app在后台，通过快捷选项标签进入app，则调用该方法，如果app不在后台已杀死，则处理通过快捷选项标签进入app的逻辑在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions中
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
    if([shortcutItem.type isEqualToString:@"com.mycompany.myapp.one"]){
        
    } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.search"]) {//进入搜索界面
       
        SearchViewController *childVC = [[SearchViewController alloc]init];
        [nav pushViewController:childVC animated:NO];
        
    } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]) {//进入分享界面
        
        ShareViewController *childVC = [[ShareViewController alloc]init];
        [nav pushViewController:childVC animated:NO];
        
        NSArray *arr = @[@"hello 3D Touch",@"你好啊   我在写demo ",@"啦啦啦啦啦啦啦啦啦"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
        }];

    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}


//创建应用图标上的3D touch快捷选项
- (void)creatShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    
    //创建自定义图标的icon
    //    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"分享.png"];
    
    //创建快捷选项
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"com.mycompany.myapp.share" localizedTitle:@"分享" localizedSubtitle:nil icon:icon userInfo:nil];
    
    UIApplicationShortcutItem * item2 = [[UIApplicationShortcutItem alloc]initWithType:@"com.mycompany.myapp.search" localizedTitle:@"搜索" localizedSubtitle:nil icon: [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    
    UIApplicationShortcutItem * item3 = [[UIApplicationShortcutItem alloc]initWithType:@"com.mycompany.myapp.one" localizedTitle:@"首页" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome]  userInfo:nil];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item,item2,item3];
}










@end
