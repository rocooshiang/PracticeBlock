//
//  ServiceLib.m
//  PracticeBlock
//
//  Created by Geosat-RD01 on 2015/11/12.
//  Copyright © 2015年 Geosat-RD01. All rights reserved.
//

#import "ServiceLib.h"

@implementation ServiceLib

-(void)fetchGetResponseWithCallback : (NSString *)urlStr success : (void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure{
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString: urlStr];
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
                                           
                                           NSDictionary * json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                           
                                           if (json != nil) {
                                               success(json);
                                           }else{
                                               failure(error);
                                           }

                                       }];
    [dataTask resume];
}

- (void)fetchGetResponseWithCallback: (NSString *)urlStr callback:(void(^)(NSDictionary *responseDict, NSError *error))callback{
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString: urlStr];
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
                                           
                                           NSDictionary * json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                           
                                           callback(json,error);
                                           
                                       }];
    [dataTask resume];
}

- (void)fetchImageWithCallback:(NSString *)urlStr callback:(void(^)(UIImage *image, NSError *error))callback{
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString: urlStr];
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
                                           
                                           UIImage *image = [[UIImage alloc] initWithData:data];
                                           
                                           callback(image,error);
                                           
                                       }];
    [dataTask resume];
}

@end
