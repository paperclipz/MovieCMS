//
//  ConnectionManager.m
//  MovieCMS
//
//  Created by Paperclipz on 6/7/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "ConnectionManager.h"
#import "WinnerDetailModel.h"


@implementation ConnectionManager
#pragma mark - Service Request


- (NSString*)getUrlFromRequestType:(ServerRequestType)serverRequestType
{
    switch (serverRequestType) {
        case ServerRequestType_Login:
            return nil;
            break;
        default:
            return nil;
            break;
    }
}

- (MKNetworkOperation*)requestServerWithPost:(BOOL)isPost requestType:(ServerRequestType)serverRequestType requestJsonString:(JSONModel*)object completionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock
{
//    
    NSString *subPath = [self getUrlFromRequestType:serverRequestType];
//    self.fullURL = [NSString stringWithFormat:@"%@%@", SERVER_PATH, subPath];
     NSLog(@"\n\nload Path = %@",self.fullURLPath);
   
   
    NSString *httpMethod = (isPost) ? @"POST" : @"GET";
    
    NSLog(@"\n\nRequest URL: %@\nRequest JSON:\n%@", self.fullURLPath, [object toJSONString]);
    
    MKNetworkOperation *op = [self operationWithPath:subPath
                                              params:[object toDictionary]
                                          httpMethod:httpMethod];
    
    [op setPostDataEncoding:MKNKPostDataEncodingTypeURL];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSString *jsonString = [completedOperation responseString];
        
        NSLog(@"\n\nRequest URL: %@\nResponse JSON:\n%@", self.fullURLPath, jsonString);
        
       // [self loadJsonAndStoreInModel:jsonString ServerRequestType:serverRequestType];
        
        if (completionBlock) {
            [self invokeCompletionBlock:completionBlock forType:serverRequestType withJson:jsonString];
        }
        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        NSLog(@"\n\nerror == %@", [error localizedDescription]);
        if (errorBlock) {
            errorBlock(error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

-(void)loadJsonAndStoreInModel:(NSString*)jsonString ServerRequestType:(ServerRequestType)serverRequestType
{
    //    if ([[dict objectForKey:@"success"] integerValue] != 0) {
    //        return;
    //    }
    

    
    [self storeJSONIntoModel:jsonString andType:serverRequestType];
    
    
}

- (void)storeJSONIntoModel:(NSString*)jsonString andType:(ServerRequestType)serverRequestType
{
    NSError* err = nil;

    switch (serverRequestType) {
        case ServerRequestType_Login:
        {
           WinnerDetailModel* winnerDetailModel = [[WinnerDetailModel alloc] initWithString:jsonString error:&err];
        }
           // self.dataStore.mhModelLogin = [[MHModelLogin alloc]initWithResponseDict:responseDict];
            break;
        default:
            break;
            
    }
}

- (void)invokeCompletionBlock:(IDBlock)completionBlock forType:(ServerRequestType)serverRequestType
{
    switch (serverRequestType) {
        case ServerRequestType_Login:
            completionBlock(nil);
            break;
    }
}

- (void)invokeCompletionBlock:(IDBlock)completionBlock forType:(ServerRequestType)serverRequestType withJson:(NSString*)jsonString
{
    NSError* err = nil;

    switch (serverRequestType) {
        case ServerRequestType_Login:
        {
            WinnerDetailModel* winnerDetailModel = [[WinnerDetailModel alloc] initWithString:jsonString error:&err];
            completionBlock(winnerDetailModel);

        }
            break;
    }
}

@end
