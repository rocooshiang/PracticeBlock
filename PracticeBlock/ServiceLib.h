//
//  ServiceLib.h
//  PracticeBlock
//
//  Created by Geosat-RD01 on 2015/11/12.
//  Copyright © 2015年 Geosat-RD01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ServiceLib : NSObject

-(void)fetchGetResponseWithCallback : (NSString *)urlStr success : (void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure;

- (void)fetchGetResponseWithCallback: (NSString *)urlStr callback:(void(^)(NSDictionary *responseDict, NSError *error))callback;

- (void)fetchImageWithCallback:(NSString *)urlStr callback:(void(^)(UIImage *image, NSError *error))callback;

@end
