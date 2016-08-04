//
//  ViewController.m
//  Parse
//
//  Created by Herock on 8/4/16.
//  Copyright © 2016 Herock. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self infoLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)infoLoad
{
    NSURL *URL = [NSURL URLWithString:@"http://www.newsbangladesh.com/english/api/mostemailed/"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSError *error = nil;
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        NSArray *array = JSON ;
      
        [self.imageView setImageWithURL:[NSURL URLWithString:@"http://media.santabanta.com/gallery/indian%20%20celebrities(f)/tamanna%20bhatia/tamanna-bhatia-169-v.jpg"] placeholderImage:[UIImage imageNamed:@"banner"]];
        
        
        if (error) {
            NSLog(@"Error serializing %@", error);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
