//
//  ViewController.m
//  JJKit
//
//  Created by luming on 2018/6/21.
//  Copyright © 2018年 luming. All rights reserved.
//

#import "ViewController.h"
#import "JJWebviewVCModuleProtocol.h"
#import "JJRouter.h"
#import "JJLoginProtocol.h"
#import "JJLoginProvider.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initSubview];
}

- (void)initSubview
{
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _titles = @[@"1 openUrl跳转web",@"2 openUrl跳转登录"];
    
    [self.view addSubview:self.tableView];
    
}


#pragma mark  - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
            
       
        case 0:
        {//openurl跳转web
            Action *action = [Action new];
            action.type = JJ_WebView;
            Params *params = [[Params alloc] init];
            //            params.pageID = JJ_LOGIN;
            action.params = params;
            NSDictionary *parms = @{Jump_Key_Action:action, Jump_Key_Param : @{WebUrlString:@"http://www.baidu.com",Name:@"小二"}, Jump_Key_Callback:[JJFunc callback:^(id  _Nullable object) {
                NSLog(@"%@",object);
            }]};
                        ActionJump(parms);
            
//            [JJRouter openURL:@"router://JJActionService/showWebVC" arg: parms error:nil completion:parms[Jump_Key_Callback]];

            
        }
            break;
        case 1:
        {//openurl跳转登录
            Action *action = [Action new];
            action.type = JUMP_INNER_NEW_PAGE;
            Params *params = [[Params alloc] init];
            params.pageID = JJ_LOGIN;
            action.params = params;
            NSDictionary *parms = @{Jump_Key_Action:action, Jump_Key_Param : @"", Jump_Key_Callback:[JJFunc callback:^(id  _Nullable object) {
                NSLog(@"%@",object);
            }]};
            ActionJump(parms);
            
        }
            break;
            
       
        default:
        {
            
        }
            break;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (_titles.count > indexPath.row) {
        cell.textLabel.text = _titles[indexPath.row];
    }
    
    return cell;
    
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
