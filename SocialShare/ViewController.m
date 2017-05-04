//
//  ViewController.m
//  SocialShare
//
//  Created by Joseph Apps on 04/05/2017.
//  Copyright © 2017 Joseph Apps. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *twitterTextView;
@property (weak, nonatomic) IBOutlet UITextView *facebookTextView;
@property (weak, nonatomic) IBOutlet UITextView *moreTextView;

- (void)configureTextViews;
- (void)showAlertMessage:(NSString*)message;
- (void)resignTextViewsFirstResponder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configureTextViews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureTextViews {
    
    self.twitterTextView.layer.backgroundColor = [UIColor colorWithRed:0.0 green:(204.0/255.0) blue:(204.0/255.0) alpha:0.6].CGColor;
    self.twitterTextView.layer.borderWidth = 1.0;
    self.twitterTextView.layer.cornerRadius = 5;
    
    
    self.facebookTextView.layer.backgroundColor = [UIColor colorWithRed:0.0 green:(102.0/255.0) blue:(204.0/255.0) alpha:0.6].CGColor;
    self.facebookTextView.layer.borderWidth = 1.0;
    self.facebookTextView.layer.cornerRadius = 5;
    
    
    self.moreTextView.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:(102.0/255.0) alpha:0.6].CGColor;
    self.moreTextView.layer.borderWidth = 1.0;
    self.moreTextView.layer.cornerRadius = 5;
}

- (void)showAlertMessage:(NSString*)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SocialShare" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)resignTextViewsFirstResponder {
    
    if([self.twitterTextView isFirstResponder]) {
        [self.twitterTextView resignFirstResponder];
    }
    
    if([self.facebookTextView isFirstResponder]) {
        [self.facebookTextView resignFirstResponder];
    }
    
    if([self.moreTextView isFirstResponder]) {
        [self.moreTextView resignFirstResponder];
    }
}

- (IBAction)twitterAction:(id)sender {
    
    [self resignTextViewsFirstResponder];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        if([self.twitterTextView.text length] < 140) {
            [twitterVC setInitialText:self.twitterTextView.text];
        } else {
            NSString *shortString = [self.twitterTextView.text substringToIndex:140];
            [twitterVC setInitialText:shortString];
        }
        
        [self presentViewController:twitterVC animated:YES completion:nil];
        
    } else {
        [self showAlertMessage:@"Not signed in to Twitter!"];
    }
}

- (IBAction)facebookAction:(id)sender {
    
    [self resignTextViewsFirstResponder];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [facebookVC setInitialText:self.facebookTextView.text];
        
        
        [self presentViewController:facebookVC animated:YES completion:nil];
        
    } else {
        [self showAlertMessage:@"Not signed in to Facebook!"];
    }

}

- (IBAction)moreAction:(id)sender {
    
    [self resignTextViewsFirstResponder];
    
    UIActivityViewController *moreVC = [UIActivityViewController alloc];
    moreVC = [moreVC initWithActivityItems:@[self.moreTextView.text] applicationActivities:nil];
    [self presentViewController:moreVC animated:YES completion:nil];
    
}

- (IBAction)dummyAction:(id)sender {
    
    [self resignTextViewsFirstResponder];
    
    [self showAlertMessage:@"This doesn't do anything!"];
}

@end
