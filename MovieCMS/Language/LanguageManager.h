//
//  LanguageManager.h
//  MovieCMS
//
//  Created by Paperclipz on 6/3/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LanguageManager : NSObject

@property(nonatomic,assign)Language lang;
-(NSString*) languageSelectedStringForKey:(NSString*) key;
+ (id)sharedManager;
-(void)AddLanguage:(id)delegate;
-(void)LanguageDidSelect:(Language)lang;

@end
