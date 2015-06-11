//
//  LanguageManager.m
//  MovieCMS
//
//  Created by Paperclipz on 6/3/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "LanguageManager.h"

@interface LanguageManager()
@property(nonatomic,strong)NSMutableArray* arrLanguageObject;

@end
@implementation LanguageManager

+ (id)sharedManager {
    static LanguageManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.lang = [Utils playerPrefLanguageToEnum];
    });
    return sharedMyManager;
}

-(void)AddLanguage:(id)delegate
{
    if (!_arrLanguageObject) {
        _arrLanguageObject = [NSMutableArray new];
    }
    if(![_arrLanguageObject containsObject:delegate])
    {
        [_arrLanguageObject addObject:delegate];
    }
    
}
-(NSString*) languageSelectedStringForKey:(NSString*) key
{
    
    NSString *path;
    switch (_lang) {
        case ENGLISH:
            path = [[NSBundle mainBundle] pathForResource:@"en-US" ofType:@"lproj"];

            break;
            
        case MALAY:
            path = [[NSBundle mainBundle] pathForResource:@"ms" ofType:@"lproj"];

            break;
        case CHINESE:
            path = [[NSBundle mainBundle] pathForResource:@"zh" ofType:@"lproj"];

            break;
            

            
        default:
            break;
    }
        NSBundle* languageBundle = [NSBundle bundleWithPath:path];
        NSString* str=[languageBundle localizedStringForKey:key value:@"" table:nil];
    
    return str;
}

-(void)LanguageDidSelect:(Language)lang
{
    _lang = lang;
    
    for (int i = 0;i<self.arrLanguageObject.count;i++)
    {
        MasterViewController*  vc = self.arrLanguageObject[i];
        if (vc.languageBlock) {
            vc.languageBlock();
        }
        else{
            [self.arrLanguageObject removeObject:vc];
        }
        
    }
}

@end
