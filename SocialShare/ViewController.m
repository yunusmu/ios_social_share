//
//  ViewController.m
//  SocialShare
//
//  Created by Joseph Apps on 04/05/2017.
//  Copyright © 2017 Joseph Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *twitterTextView;
@property (weak, nonatomic) IBOutlet UITextView *facebookTextView;
@property (weak, nonatomic) IBOutlet UITextView *moreTextView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)twitterAction:(id)sender {
    
    
}

- (IBAction)facebookAction:(id)sender {
}

- (IBAction)moreAction:(id)sender {
    
    UIActivityViewController *moreVC = [UIActivityViewController alloc];
    moreVC = [moreVC initWithActivityItems:@[self.moreTextView.text] applicationActivities:nil];
    [self presentViewController:moreVC animated:YES completion:nil];
    
}

- (IBAction)dummyAction:(id)sender {
}

@end
