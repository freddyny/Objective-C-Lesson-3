//
//  ViewController.m
//  Lesson3InterviewApp
//
//  Created by Frederik Nygaard on 19.05.16.
//  Copyright (c) 2016 Frederik Nygaard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
    
@end

@implementation ViewController


-(IBAction)doShowViewControllerButton:(id)sender{
    AboutViewController *vc =  [[AboutViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    CGRect rect = CGRectInset(self.view.bounds,20,20);
    self.myTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    
    self.myRowNames = @[@"About This app",@"Display Web Browser",@"Display Phone Dialer",@"Display Map"];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    
    [self.view addSubview:self.myTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myRowNames.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.myRowNames[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //DETTE ER HVOR VI SKAL GJØRE ENDRINGENE.
    
    switch (indexPath.row) {
        case 0:
            [self doShowViewControllerButton:self];
            break;
        case 1:{
            NSString *urlString = @"http://developer.apple.com";
            NSURL *url = [NSURL URLWithString:urlString];
            if([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }

            break;
        }
        case 2: {
            
        
            NSString *urlString = @"tel:800-123-4567";
            NSURL *url = [NSURL URLWithString:urlString];
            if([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
            //Phone Dialer
            
            else{
                [[[UIAlertView alloc] initWithTitle:@"No Phone" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK",nil] show];
            }
            break;
        }
        case 3:{
            
            NSString *urlString = @"http://maps.apple.com/?q=cupertino";
            NSURL *url = [NSURL URLWithString:urlString];
            if([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
            //Phone Dialer
            break;
        }
        default:
            break;
    }
    
    /*
    NSInteger row = indexPath.row;
    NSString *rowName = self.myRowNames[row];
    NSString *title = [NSString stringWithFormat:@"row: %li, %@", row, rowName];
    
    [[[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle: nil otherButtonTitles:@"OK", nil] show];*/
}


@end
