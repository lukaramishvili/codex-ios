//
//  muxli_view.m
//  codex
//
//  Created by Luka on 8/20/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "muxli_view.h"
#import "tavi.h"
#import <FacebookSDK/FacebookSDK.h>
#import "Socialize.h"
#import "Helpers.h"


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
    self.muxliTitle.text = [[self.muxliItem getTavi] title];//self.muxliItem.title;
    self.muxliText.text = self.muxliItem.text;
    
    //fb login button
    /*FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];*/
    
    //code to open the fb share dialog
    //todo: working link to muxli
    /*[Helpers shareOnFB :self.muxliItem.title :[[self.muxliItem getTavi] title]
        :self.muxliItem.text :@"http://aa.ge/link"
        :@"http://aa.ge/assets/frontend/img/logo.png"];*/
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.actionBar == nil) {
        self.entity = [SZEntity entityWithKey:@"codex_muxli" name:[NSString stringWithFormat:@"მუხლი %@" ,self.muxliItem.title]];
        self.actionBar = [SZActionBarUtils showActionBarWithViewController:self entity:self.entity options:nil];
        
        SZShareOptions *shareOptions = [SZShareUtils userShareOptions];
        shareOptions.dontShareLocation = NO;
        
        shareOptions.willAttemptPostingToSocialNetworkBlock = ^(SZSocialNetwork network, SZSocialNetworkPostData *postData) {
            if (network == SZSocialNetworkTwitter) {
                NSString *entityURL = [[postData.propagationInfo objectForKey:@"twitter"] objectForKey:@"entity_url"];
                NSString *displayName = [postData.entity displayName];
                NSString *customStatus = [NSString stringWithFormat:@"Custom status for %@ with url %@", displayName, entityURL];
                
                [postData.params setObject:customStatus forKey:@"status"];
                
            } else if (network == SZSocialNetworkFacebook) {
                NSString *entityURL = [[postData.propagationInfo objectForKey:@"facebook"] objectForKey:@"entity_url"];
                NSString *displayName = [postData.entity displayName];
                NSString *customMessage = [NSString stringWithFormat
                    :@"საქართველოს კანონმდებლობა; %@; %@, %@"
                        ,@"სისხლის სამართლის კოდექსი"
                        ,[[self.muxliItem getTavi] title]
                        ,displayName];
                
                [postData.params setObject:customMessage forKey:@"message"];
                [postData.params setObject:entityURL forKey:@"link"];
                [postData.params setObject:@"A caption" forKey:@"caption"];
                [postData.params setObject:@"Custom Name" forKey:@"name"];
                [postData.params setObject:self.muxliItem.text forKey:@"description"];
            }
        };
        
        self.actionBar.shareOptions = shareOptions;
    }
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
