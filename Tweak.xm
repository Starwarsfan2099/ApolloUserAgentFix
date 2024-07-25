#import <Foundation/Foundation.h>

%hook NSMutableURLRequest
// Maybe server side checks the user agent?
- (instancetype)initWithURL:(NSURL *)URL {
    self = %orig(URL);
    if (self) {
        NSString *newUserAgent = @"Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1";
        [self setValue:newUserAgent forHTTPHeaderField:@"User-Agent"];
    }
    return self;
}

%end