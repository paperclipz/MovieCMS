//
//  Utils.h
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

typedef void (^LanguageBlock)(void);

typedef enum
{
    ENGLISH = 0,
    MALAY = 1,
    CHINESE = 2
} Language;


typedef enum
{
    MenuType_Login = 1,
    MenuType_Profile = 2,
    MenuType_QRCode = 3,
    MenuType_Setting = 4,
    MenuType_Dashboard
} MenuType;

typedef enum
{
    ServerRequestType_Login = 1,
    ServerRequestType_SignUp = 2,
    ServerRequestType_AdsBanner = 3,
    ServerRequestType_ContestBanner = 4
    
}ServerRequestType;

+(UIColor*)getProjectColor;
+(float)getKeyboardHeight;
+(BOOL)isLogin;
+(void)setIsLogin:(BOOL)flag;
+(NSString*)playerPrefLanguage;
+(void)setPlayerPrefLanguage:(NSString*)lang;
+(Language)playerPrefLanguageToEnum;

@end
