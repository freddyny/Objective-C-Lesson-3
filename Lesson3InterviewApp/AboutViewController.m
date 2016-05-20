//
//  AboutViewController.m
//  Lesson3InterviewApp
//
//  Created by Frederik Nygaard on 19.05.16.
//  Copyright (c) 2016 Frederik Nygaard. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGFloat leftBounds = 20;
    CGFloat rightBounds = 20;
    CGFloat width = self.view.bounds.size.width - leftBounds-rightBounds;
    CGFloat height = 44;
    CGRect rect = CGRectMake(20, 20, width, height);
    
    
    self.myApp = [[UILabel alloc] initWithFrame:rect];
    self.myApp.text = @"This Program by Frederik Nygaard";
    self.myApp.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.myApp];

    
    
    rect.origin.y += height;
    rect.size.height = self.view.bounds.size.height-(2*height);
    UIButton *button =[[UIButton alloc]initWithFrame:rect];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"Touch to end" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
}

-(void) doButton:(UIButton*) button {
    [self dismissViewControllerAnimated:YES completion:nil];
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
