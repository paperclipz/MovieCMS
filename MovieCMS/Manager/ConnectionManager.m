//
//  ConnectionManager.m
//  MovieCMS
//
//  Created by Paperclipz on 6/7/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "ConnectionManager.h"
#import "DataManager.h"

@interface ConnectionManager()
@property (strong, nonatomic) DataManager *dataManager;

@end
@implementation ConnectionManager
+ (id)Instance {
    static DataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(id)init
{
    self = [super init];
    self.serverPath = SERVER_PATH;
    self.dataManager = [DataManager sharedInstance];

    return self;
}

-(NSString*)getFullURLwithType:(ServerRequestType)type
{
    switch (type) {
        case ServerRequestType_Login:
            self.subPath = @"check_login";
            break;
        case ServerRequestType_SignUp:
            self.subPath = @"createuser";

            break;
        case ServerRequestType_AdsBanner:
            self.subPath = @"adsbanner";
            
            break;
        case ServerRequestType_ContestBanner:
            self.subPath = @"contestbanner";
            
            break;
            
        default:
            break;
    }
    
    return [NSString stringWithFormat:@"%@%@",self.serverPath,self.subPath];
}

-(void)requestServerWithPost:(bool)isPost requestType:(ServerRequestType)type param:(NSDictionary*)dict completeHandler:(IDBlock)completeBlock errorBlock:(IErrorBlock)error
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    NSLog(@"Request Server [%@]",[self getFullURLwithType:type]);
    
    if(isPost)
    {
        [manager POST:[self getFullURLwithType:type] parameters:dict
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             [self storeServerData:responseObject requestType:type];
             completeBlock(responseObject);
             NSLog(@"JSON: %@", responseObject);
         }
              failure:
         ^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    }
    else{

        [manager POST:[self getFullURLwithType:type] parameters:nil
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             [self storeServerData:responseObject requestType:type];
             completeBlock(responseObject);
             NSLog(@"JSON: %@", responseObject);
         }
              failure:
         ^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];

    }
    

}

-(void)storeServerData:(id)obj requestType:(ServerRequestType)type
{
    switch (type) {
        case ServerRequestType_Login:
            self.dataManager.loginModel = [[LoginModel alloc]initWithDictionary:obj error:nil];
            break;
            
        case ServerRequestType_SignUp:
            
            break;
            
        default:
            break;
    }
}

@end
