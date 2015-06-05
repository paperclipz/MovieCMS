//
//  Utils.m
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "Utils.h"

static BOOL isLogin = NO;


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
@end
