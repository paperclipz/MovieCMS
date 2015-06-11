//
//  Utils.m
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "Utils.h"

static BOOL isLogin = NO;
static NSString* playerLanguage;
NSString* const PLAYER_LANG = @"LANGUAGE";

@implementation Utils

+(UIColor*)getProjectColor
{
    return [UIColor colorWithRed:(53/255.0) green:(172/255.0) blue:(164/255.0) alpha:1];

}

+(float)getKeyboardHeight
{
  if([[UIDevice currentDevice] orientation]==UIInterfaceOrientationPortrait|| [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown)
  {
      return 216.0f;
  }
  else
  {
      return 162.0f;

  }
    
}

+(void)setIsLogin:(BOOL)flag
{
    isLogin = flag;
}
+(BOOL)isLogin
{
    return isLogin;
}

+(void)setPlayerPrefLanguage:(NSString*)lang
{
    playerLanguage = lang;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:lang
                     forKey:PLAYER_LANG];

    [userDefaults synchronize];
}
+(NSString*)playerPrefLanguage
{
    if(!playerLanguage)
    {
      
        playerLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:PLAYER_LANG];
        if(playerLanguage == nil)
        {
            playerLanguage = @"ENGLISH";
        }
        
    }
       return playerLanguage;
}

+(Language)playerPrefLanguageToEnum
{
    
    Language temp;
    
    if(!playerLanguage)
    {
        playerLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:PLAYER_LANG];
        if(playerLanguage == nil)
        {
            playerLanguage = @"ENGLISH";
        }
    }
 
    if([playerLanguage isEqualToString:@"ENGLISH"])
    {
        temp = ENGLISH;
    }
    else if([playerLanguage isEqualToString:@"MALAY"])
    {
        temp = MALAY;

    }
    else if([playerLanguage isEqualToString:@"CHINESE"])
    {
        temp = CHINESE;

    }
    
    return temp;
}
@end
