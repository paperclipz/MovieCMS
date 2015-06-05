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

typedef enum
{
    ENGLISH = 1,
    MALAY = 2,
    CHINESE = 3
} Language;

typedef enum
{
    MenuType_Login = 1,
    MenuType_Profile = 2,
    MenuType_QRCode = 3,
    MenuType_Setting = 4,
    MenuType_Dashboard
} MenuType;

+(UIColor*)getProjectColor;
+(float)getKeyboardHeight;

@end
