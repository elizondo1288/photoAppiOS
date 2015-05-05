//
//  RequestManager.m
//  iBusCR
//
//  Created by Esteban Mac on 05/01/14.
//  Copyright (c) 2014 Oreliz. All rights reserved.
//

#import "RequestManager.h"
#import "Factory_Requests.h"

@interface RequestManager ()

@property (nonatomic,strong) id<RequestDelegate> appDelegate;
@property (nonatomic,strong) NSString * methodTag;
@property (nonatomic,strong) NSMutableData * receivedData;
@end


@implementation RequestManager

int CODE_RECEIVED = 0;


//singleton method
+ (RequestManager *)sharedManager
{
    static RequestManager *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}


-(void)sendRequest:(RequestInfo *)info andImage:(NSData *)imageData withDelegate:(id<RequestDelegate>)delegate{
    
    //we set the global variables
    self.methodTag = info.tag;
    self.appDelegate = delegate;
    
    self.receivedData = [[NSMutableData alloc] init];
    
    [self.appDelegate requestSetUpView:YES];
    
    NSMutableURLRequest *request = [Factory_Requests createCorrectRequests:info andImage:imageData];
    [NSURLConnection connectionWithRequest:request delegate:self];
}



#pragma mark - URLConnection methods Delegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    //we get the status response
    NSHTTPURLResponse * httpsResponse = (NSHTTPURLResponse *)response;
    CODE_RECEIVED = (int)[httpsResponse statusCode];
    
    NSLog(@"---------  RECEIVE RESPONSE: %d",CODE_RECEIVED);
    
    //as soon as the app gets the response we set or initialize the receivedData variable
    [self.receivedData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //we start to appendData to the received data on every upcoming data from server
    
    NSLog(@"---------  RECEIVE DATA");
    //we serialize the data into a dictionary
    [self.receivedData appendData:data];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    //if it fails, then we set on nil the received data to avoid useless info on memory and we call the
    //delegate requestFailedWithError with the tag and the given tag.
    NSLog(@"---------  FAIL WITH ERROR");
    self.receivedData = nil;
    [self.appDelegate requestSetUpView:NO];
    [self.appDelegate requestFailedwithError:[error localizedDescription] witTag:self.methodTag];
}


-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //if the server response ends then we call the method requestSuccessWithData
    //with the received info and a tag.
    NSLog(@"---------  FINISH LOADING");
    
    [self.appDelegate requestSetUpView:NO];
    [self.appDelegate requestSuccesswithData:self.receivedData witTag:self.methodTag andCode:CODE_RECEIVED];
    self.receivedData = [[NSMutableData alloc] init];
}





 
// this is in case of a user/pass need on the connection
 - (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
     if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust] &&
         [challenge.protectionSpace.host hasSuffix:@"test.com"])
     {
         // accept the certificate anyway
         [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
     }
     else
     {
         [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
     }
}


@end
