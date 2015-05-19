//
//  RegistViewController.m
//  Homework_03
//
//  Created by guanxiaobai on 4/22/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistView.h"
#import "LTView.h"
//#import "LoginViewController.h"

#define NAME_TAG 1111
#define PASS_TAG 1112
#define CONFIRM_TAG 1113
#define TELE_TAG 11114
#define EMAIL_TAG 1115

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)dealloc
{
    [_registView release];
    [super dealloc];
}
#pragma mark--------------Actions-----------------------
//回收键盘
-(void)recycleKeyboard:(RegistView *)registView
{
    for (int i = 0; i < 5; ++i) {
        LTView *ltV = (LTView *)[registView viewWithTag:(1000+i)];
        if ([ltV.textField isFirstResponder]) {
            [ltV.textField resignFirstResponder];
        }
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case NAME_TAG:
        {
            //find the password field
            LTView *ltV = (LTView *)[self.view viewWithTag:1001];
            [ltV.textField becomeFirstResponder];
            break;
        }
        case PASS_TAG:
        {
            //find the confirm field
            LTView *ltV = (LTView *)[self.view viewWithTag:1002];
            [ltV.textField becomeFirstResponder];
            break;
        }
            case CONFIRM_TAG:
        {
            //find the tele field
            LTView *ltV = (LTView *)[self.view viewWithTag:1003];
            [ltV.textField becomeFirstResponder];
            break;
        }
            case TELE_TAG:
        {
            //find the email field
            LTView *ltV = (LTView *)[self.view viewWithTag:1004];
            [ltV.textField becomeFirstResponder];
            break;
        }
        default:
            [textField resignFirstResponder];
            break;
    }
    return YES;
}

- (void)confirmRegist
{
    LTView *nameLTV = (LTView *)[self.view viewWithTag:1000];
    LTView *passLTV = (LTView *)[self.view viewWithTag:1001];
    LTView *confirmLTV = (LTView *)[self.view viewWithTag:1002];
    LTView *phoneLTV = (LTView *)[self.view viewWithTag:1003];
    LTView *emailLTV = (LTView *)[self.view viewWithTag:1004];
    
    NSString *userName = nameLTV.textField.text;
    NSString *password = passLTV.textField.text;
    NSString *confirmP = confirmLTV.textField.text;
    NSString *phoneNum = phoneLTV.textField.text;
    NSString *email = emailLTV.textField.text;
    if (0 == userName.length || 0 ==password.length || 0 == confirmP.length || 0 == phoneNum.length || 0 == email.length) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reminder" message:@"can not be nil" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
        [alert show];
        [alert release];
    }
    else
    {
        NSUserDefaults *users = [NSUserDefaults standardUserDefaults];
        NSArray *userArray = @[userName, password, confirmP, phoneNum, email];
        [users setObject:userArray forKey:userName];
        [users synchronize];
        NSLog(@"regist success");
        //返回登录界面
        [self backToLoginView];
    }
}
- (void)backToLoginView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _registView = [[RegistView alloc]initWithFrame:[UIScreen mainScreen].bounds];//attention
    self.navigationItem.title = @"Regist";
    //add target/action
    _registView.target = self;
    _registView.action = @selector(recycleKeyboard:);
    
    //set button event
    [_registView.confirmButton addTarget:self action:@selector(confirmRegist) forControlEvents:UIControlEventTouchUpInside];
    [_registView.cancelButton addTarget:self action:@selector(backToLoginView) forControlEvents:UIControlEventTouchUpInside];
    
    //set name textfield
    LTView *nameLTView = (LTView *)[_registView viewWithTag:1000];
    nameLTView.textField.tag = NAME_TAG;
    nameLTView.textField.delegate = self;
    [nameLTView.textField becomeFirstResponder];
    
    //set password textfield
    LTView *passLTView = (LTView *)[_registView viewWithTag:1001];
    passLTView.textField.tag = PASS_TAG;
    passLTView.textField.delegate = self;
    
    //set confirm textfield
    LTView *confirmLTView = (LTView *)[_registView viewWithTag:1002];
    confirmLTView.textField.tag = CONFIRM_TAG;
    confirmLTView.textField.delegate = self;
    
    //set tele textfield
    LTView *teleLTView = (LTView *)[_registView viewWithTag:1003];
    teleLTView.textField.tag = TELE_TAG;
    teleLTView.textField.delegate = self;
    
    //set email textfield
    LTView *emailLTView = (LTView *)[_registView viewWithTag:1004];
    emailLTView.textField.tag = EMAIL_TAG;
    emailLTView.textField.delegate = self;
    
    self.view = _registView;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *didRegistItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(confirmRegist)];
    self.navigationItem.rightBarButtonItem = didRegistItem;
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
