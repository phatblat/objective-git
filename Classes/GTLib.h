//
//  GTLib.h
//  ObjectiveGitFramework
//
//  Created by Timothy Clem on 2/18/11.
//
//  The MIT License
//
//  Copyright (c) 2011 Tim Clem
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


@interface GTLib : NSObject {}

+ (NSData *)hexToRaw:(NSString *)hex error:(NSError **)error;
+ (NSString *)rawToHex:(NSData *)raw;

// Turn an Oid into a sha1 hash
// 
// oid - the raw git_oid to convert
//
// returns an NSString of the sha1
+ (NSString *)convertOidToSha:(git_oid const *)oid;

// Get a short unique sha1 for a full sha1
//
// sha - a NSString of the full sha1 to shorten
//
// returns a NSString of the shortened sha1
+ (NSString *)shortUniqueShaFromSha:(NSString *)sha;

@end
