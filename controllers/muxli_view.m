//
//  muxli_view.m
//  codex
//
//  Created by Luka on 8/20/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "muxli_view.h"

@interface muxli_view ()

@property (weak, nonatomic) IBOutlet UITextView *muxliText;
@property (weak, nonatomic) IBOutlet UILabel *muxliTitle;

@end

@implementation muxli_view

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
    self.muxliTitle.text = self.muxliItem.title;
    self.muxliText.text = self.muxliItem.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
