//
//  RequestManager.h
//  iBusCR
//
//  Created by Esteban Mac on 05/01/14.
//  Copyright (c) 2014 Oreliz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestInfo.h"

@protocol RequestDelegate <NSObject>

//This method will be called on the delegate if the request was successful and return any data
//this method is a good point to check any error and if it's ok, then the info should be handled in processResults
-(void)requestSuccesswithData:(NSData *)data witTag:(NSString *)tag andCode:(int)codeResponse;

//Will be called in the delegate if the Request failed at any point
-(void)requestFailedwithError:(NSString *)error witTag:(NSString *)tag;

//works together along with the requestSuccessWithData, it handles given information
-(void)requestProcessResults:(id)dict;

//when there's and error or we got 0 results
-(void)requestProcessEmptyResults:(id)dict;

//changes the visibility of the viewBackground of the view
-(void)requestSetUpView:(BOOL)isOn;

@end

@interface RequestManager : NSObject

/*
 
 This class is the gateway for communication between UIViews and the Server
 No View should instantiate a category or call directly to core data. It should use this singleton class
 */
+ (RequestManager *)sharedManager;


//main method used by the entire application to make a server request
-(void)sendRequest:(RequestInfo *)info andImage:(NSData *)imageData withDelegate:(id<RequestDelegate>)delegate;

@end
