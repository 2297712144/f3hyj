//
//  AppDelegate.swift
//  f3hyj
//
//  Created by JoymanM on 16/5/5.
//  Copyright © 2016年 hyju. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /**
         *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
         *  在将生成的AppKey传入到此方法中。
         *  方法中的第二个第三个参数为需要连接社交平台SDK时触发，
         *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
         *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
         */
        ShareSDK.registerApp("12792a97491f0",
                             
                             activePlatforms : [SSDKPlatformType.TypeWechat.rawValue,
                                                SSDKPlatformType.TypeQQ.rawValue,
                                                SSDKPlatformType.TypeSinaWeibo.rawValue],
                             
                             // 第三个参数
                             onImport: {(platform : SSDKPlatformType) -> Void in
                                switch platform {
                                    
                                case SSDKPlatformType.TypeWechat:
                                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                                    
                                case SSDKPlatformType.TypeQQ:
                                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                                    
                                case SSDKPlatformType.TypeSinaWeibo:
                                    ShareSDKConnector.connectWeibo(WeiboSDK.classForCoder())
                                    
                                default:
                                    break
                                }
                             },
                             
                             // 第四个参数
                             onConfiguration: {(platform : SSDKPlatformType,appInfo : NSMutableDictionary!) -> Void in
                                switch platform {
                                    
                                //设置微信应用信息
                                case SSDKPlatformType.TypeWechat:
                                    appInfo.SSDKSetupWeChatByAppId("wx68b324eb25e73b15",
                                                        appSecret: "e1767bbbb78a557d2b0d1af87676fc2e")
                                    break
                
                                //设置QQ应用信息
                                case SSDKPlatformType.TypeQQ:
                                    appInfo.SSDKSetupQQByAppId("1105307165",
                                        appKey   : "0R6SgrTiUhBUaYb7",
                                        authType : SSDKAuthTypeBoth)
                                    break
                                    
                                //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                                case SSDKPlatformType.TypeSinaWeibo:
                                    appInfo.SSDKSetupSinaWeiboByAppKey("2333272974",
                                        appSecret   : "9fa05963bb117c7b4a4d04c1b0097422",
                                        redirectUri : "http://www.sharesdk.cn",
                                        authType    : SSDKAuthTypeBoth)
                                    break
                                    
                                default:
                                    break
                                }
        })
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}
