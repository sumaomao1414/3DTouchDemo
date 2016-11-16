//
//  ViewController.m
//  3DTouchDemo
//
//  Created by maomao on 2016/11/3.
//  Copyright © 2016年 maomao. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *myArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.view addSubview:self.myTableView];
    //假数据
    _myArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 20; i++) {
        [_myArray addObject:[NSString stringWithFormat:@"我是第%ld个萌萌哒cell",i]];
    }
}

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _myArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.textLabel.text = _myArray[indexPath.row];
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSLog(@"3D Touch  可用!");
        //给cell注册3DTouch的peek（预览）和pop功能
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    } else {
        NSLog(@"3D Touch 无效");
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *vc = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIViewControllerPreviewingDelegate

//peek(预览)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //获取按压的cell所在行，[previewingContext sourceView]就是按压的那个视图
    NSIndexPath *indexPath = [_myTableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
    
    //设定预览的界面
    DetailViewController *childVC = [[DetailViewController alloc]init];
    childVC.preferredContentSize = CGSizeMake(0.0f,500.0f);
    childVC.str = [NSString stringWithFormat:@"%@,想看我就用力按一下进来呦",_myArray[indexPath.row]];
    
    __weak typeof(self)weakSelf = self;
    __weak typeof(childVC)weakChildVC = childVC;
    [childVC setTouch:^(NSInteger index) {
        [weakSelf.navigationController pushViewController:weakChildVC animated:YES];
    }];
    
    //调整不被虚化的范围，按压的那个cell不被虚化（轻轻按压时周边会被虚化，再少用力展示预览，再加力跳页至设定界面）
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width,40);
    previewingContext.sourceRect = rect;
    
    //返回预览界面
    return childVC;
}

//pop（按用点力进入）
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        [_myTableView setDelegate:self];
        [_myTableView setDataSource:self];
        _myTableView.tableFooterView = [UIView new];
        [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    }
    return _myTableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
