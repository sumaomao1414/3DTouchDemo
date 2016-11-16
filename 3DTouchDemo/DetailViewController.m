//
//  DetailViewController.m
//  3DTouchDemo
//
//  Created by maomao on 2016/11/3.
//  Copyright © 2016年 maomao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    self.view.backgroundColor = [UIColor cyanColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    label.center = self.view.center;
    label.backgroundColor = [UIColor yellowColor];
    label.text = _str;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    
    // Do any additional setup after loading the view.
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Aciton1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton1");
        self.view.backgroundColor = [UIColor redColor];
        if (_touch) {
            _touch(1);
        }
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Aciton2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton2");
        if (_touch) {
            _touch(1);
        }
        self.view.backgroundColor = [UIColor brownColor];
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Aciton3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton3");
        self.view.backgroundColor = [UIColor purpleColor];
    }];
    
    NSArray *actions = @[action1,action2,action3];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
