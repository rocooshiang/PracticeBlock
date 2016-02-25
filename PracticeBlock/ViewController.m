//
//  ViewController.m
//  PracticeBlock
//
//  Created by Geosat-RD01 on 2015/11/12.
//  Copyright © 2015年 Geosat-RD01. All rights reserved.
//

#import "ViewController.h"
#import "ServiceLib.h"

//定義一個BlockName1的形態，傳入一個int值，沒有回傳值
typedef void (^BlockName1)(int someValue);

//定義一個BlockName2的形態，沒有傳入值，回傳一個NSString
typedef NSString* (^BlockName2)(void);

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  /***
   1.
   a) 宣告block1
   b) 實作block1
   ***/
  BlockName1 block1;
  
  block1 = ^(int someValue){
    NSLog(@"Block1: %d",someValue);
  };
  
  /***
   2.
   宣告＆實作block
   ***/
  BlockName2 block2 = ^(){
    return @"I love block !!";
  };
  
  /***
   3.
   不宣告型態，直接實作Block
   ***/
  int (^block3) (int a, int b) = ^(int a, int b){
    
    return a+b;
  };
  
  //使用
  block1(3);
  NSLog(@"Block2: %@", block2());
  NSLog(@"Block3: %d", block3(3,8));
  
  
  //"Get" two Block
  ServiceLib *sLib = [[ServiceLib alloc] init];
  [sLib fetchGetResponseWithCallback:@"http://httpbin.org/get" success:^(NSDictionary *responseDict) {
    NSLog(@"json: %@",responseDict);
  } failure:^(NSError *error) {
    NSLog(@"error: %@",error.localizedDescription);
  }];
  
  //"Get" one Block
  [sLib fetchGetResponseWithCallback:@"http://httpbin.org/get1" callback:^(NSDictionary *responseDict, NSError *error) {
    
    if(error){
      NSLog(@"error: %@",error.localizedDescription);
    }else{
      NSLog(@"json: %@",responseDict);
    }
    
  }];
  
  // UIImage Block
  [sLib fetchImageWithCallback:@"http://httpbin.org/image/png" callback:^(UIImage *image, NSError *error) {
    if (image == nil) {
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"圖片下載失敗" message:nil preferredStyle:UIAlertControllerStyleAlert];
      UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
      [alert addAction:action];
      [self presentViewController:alert animated:YES completion:nil];
    }else{
      _myImageView.image = image;
    }
  }];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}



@end
