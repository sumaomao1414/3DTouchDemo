//
//  DetailViewController.h
//  3DTouchDemo
//
//  Created by maomao on 2016/11/3.
//  Copyright © 2016年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *str;

@property(copy,nonatomic) void(^touch)(NSInteger index);

@end
