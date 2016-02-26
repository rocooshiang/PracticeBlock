//
//  PracticeBlockTests.m
//  PracticeBlockTests
//
//  Created by Geosat-RD01 on 2015/11/12.
//  Copyright © 2015年 Geosat-RD01. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ServiceLib.h"
#import "ViewController.h"

@interface PracticeBlockTests : XCTestCase

@end

@implementation PracticeBlockTests

XCTestExpectation *expectation;

- (void)setUp {
  [super setUp];
  expectation =
  [self expectationWithDescription:@"High Expectations"];
  
}

-(void)testBlock1{
  
  ServiceLib *sLib = [[ServiceLib alloc] init];
  
  [sLib fetchGetResponseWithCallback:@"http://httpbin.org/get" success:^(NSDictionary *responseDict) {
    
    XCTAssertNotNil(responseDict,@"block1 無法取得Data");
    [expectation fulfill];
    
  } failure:^(NSError *error) {
    
    XCTAssertNotNil(error,@"block1 無法取得Data");
    [expectation fulfill];
    
  }];
  
  [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
    if (error) {
      NSLog(@"Timeout Error: %@", error);
    }
  }];
}

-(void)testBlock2{
  
  ServiceLib *sLib = [[ServiceLib alloc] init];
  
  [sLib fetchGetResponseWithCallback:@"http://httpbin.org/get" callback:^(NSDictionary *responseDict, NSError *error) {
    
    //不符合預期才會中斷
    XCTAssertNotNil(responseDict,@"block2 無法取得Data");
    [expectation fulfill];
    
    if(error){
      NSLog(@"json: %@",responseDict);
    }else{
      NSLog(@"json: %@",responseDict);
    }
    
  }];
  
  [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
    if (error) {
      NSLog(@"Timeout Error: %@", error);
    }
  }];
  
}

-(void)testBlock3{
  
  ServiceLib *sLib = [[ServiceLib alloc] init];
  
  // UIImage Block
  [sLib fetchImageWithCallback:@"http://httpbin.org/image/png" callback:^(UIImage *image, NSError *error) {
    
    XCTAssertNotNil(image,@"block3 無法取得Data");
    [expectation fulfill];
  }];
  
  [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
    if (error) {
      NSLog(@"Timeout Error: %@", error);
    }
  }];
}

@end
