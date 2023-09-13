//
//  ViewController.m
//  obj-c-5
//
//  Created by Юлия Дебелова on 12.09.2023.
//

#import "ViewController.h"
#import "Loader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    //WKWebViewConfiguration *configuration = _webView.configuration;
    _searchBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self performLoadingWithGETRequest];
    //[self performLoadingWithPOSTRequest];
    //[self performLoadingSearchResultsFromYandex];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self performLoadingSearchResultsFromYandex: searchBar.text];
}


- (void)performLoadingWithGETRequest {
    [self.loader performGETRequestForURL:@"https://postman-echo.com/get" arguments:@{
        @"first": @"first value",
        @"second": @"second value"
    } completion:^(NSDictionary * dictionary, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            NSLog(@"%@", [NSString stringWithFormat:@"%@", dictionary]);
        });
    }];
}

- (void)performLoadingWithPOSTRequest {
    [self.loader performPOSTRequestForURL:@"https://postman-echo.com/post" arguments:@{
        @"first": @"first value",
        @"second": @"second value"
    } completion:^(NSDictionary * dictionary, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            NSLog(@"%@", [NSString stringWithFormat:@"%@", dictionary]);
        });
    }];
}

- (void)performLoadingSearchResultsFromYandex: (NSString *) searchQuery {
    [self.loader performGETRequestForURL:@"https://yandex.ru/search/" arguments:@{
        @"text": searchQuery
    } completionWithHTML:^(NSString * content, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            //NSLog(@"%@", content);
            [self->_webView loadHTMLString:content baseURL:nil];
        });
    }];
}

@end
