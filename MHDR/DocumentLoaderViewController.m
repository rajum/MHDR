//
//  DocumentLoaderViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/6/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "DocumentLoaderViewController.h"

@interface DocumentLoaderViewController ()

@end

@implementation DocumentLoaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initiateLoadDocument:self.appNum];
    
}

- (void)initiateLoadDocument:(NSInteger)appNum
{
    switch (appNum) {
        case 0: // Interface Engine Contacts
        {
            [self loadDocument:@"OPS_Guide_Update.doc"];
            
            break;
            
        }
            
        case 1: // Medical Plaza North
        {
            [self loadDocument:@"MedicalPlazaNorth.xls"];
            
            break;
        }
            
            
        case 2: // Vendor Contact Info
        {
            
            [self loadDocument:@"VendorContact.xls"];
            
            break;
        }

        case 3: // Change Management
            [self loadDocument:@"ScheduleEventsSummary.pdf"];
            break;
        
        case 4: // Disaster Recovery Plan
            [self loadDocument:@"DisasterRecovery.pdf"];
            break;
        
        default:
            break;
    }
}

- (void)loadDocument:(NSString*)documentName
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    webView.tag = 55;
    webView.scalesPageToFit = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName  ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    /* Close Button for webView */
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"Back" forState:UIControlStateNormal];
//    
//    
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    button.frame = CGRectMake(5, 5, 100, 30);
//    
//    
//    [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
//    [webView addSubview:button];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
