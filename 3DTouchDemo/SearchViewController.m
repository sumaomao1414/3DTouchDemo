//
//  SearchViewController.m
//  3DTouchDemo
//
//  Created by maomao on 2016/11/3.
//  Copyright © 2016年 maomao. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property(nonatomic,strong)UILabel *testLabel;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    label.center = self.view.center;
    label.backgroundColor = [UIColor yellowColor];
    label.numberOfLines = 0;
    label.userInteractionEnabled = YES;
    label.tag = 105;
    _testLabel = label;
    [self.view addSubview:label];

    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"Began压力 ＝ %f",touch.force);
        _testLabel.text = [NSString stringWithFormat:@"压力%f",touch.force];
    }
}

//按住移动or压力值改变时的回调
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    //通过tag确定按压的是哪个view，注意：如果按压的是label，将label的userInteractionEnabled属性设置为YES
    if (touch.view.tag == 105) {
        NSLog(@"move压力 ＝ %f",touch.force);
        _testLabel.text = [NSString stringWithFormat:@"压力%f",touch.force];
         }
    
    if (touch.force > 1 && touch.force <3) {
        self.view.backgroundColor = [UIColor cyanColor];
    }else if (touch.force < 1){
        self.view.backgroundColor = [UIColor redColor];
    }else if (touch.force > 3 && touch.force < 5){
        self.view.backgroundColor = [UIColor purpleColor];
    }else if (touch.force > 6){
        self.view.backgroundColor = [UIColor blueColor];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"End压力 ＝ %f",touch.force);
        _testLabel.text = [NSString stringWithFormat:@"压力%f",touch.force];
    }
    
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
