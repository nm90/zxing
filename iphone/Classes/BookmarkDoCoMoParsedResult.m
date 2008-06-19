//
//  BookmarkDoCoMoParsedResult.m
//  ZXing
//
//  Created by Christian Brunschen on 29/05/2008.
/*
 * Copyright 2008 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "BookmarkDoCoMoParsedResult.h"
#import "DoCoMoParsedResult.h"

@implementation BookmarkDoCoMoParsedResult

+ parsedResultForString:(NSString *)s {
  NSRange foundRange = [s rangeOfString:@"MEBKM:"];
  if (foundRange.location == NSNotFound) {
    return nil;
  }
  
  NSString *urlString = [s fieldWithPrefix:@"URL:"];
  if (urlString == nil) {
    return nil;
  }
  
  NSString *title = [s fieldWithPrefix:@"TITLE:"];
  
  return [[[self alloc] initWithURLString:urlString 
                                    title:title] autorelease];
}

- (NSString *)stringForDisplay {
  if (self.title) {
    return [NSString stringWithFormat:@"%@: %@", self.title, self.urlString];
  } else {
    return self.urlString;
  }
}

@end
