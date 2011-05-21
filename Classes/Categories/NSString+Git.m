//
//  NSString+Git.h
//  ObjectiveGitFramework
//
//  Created by Dave DeLong on 5/20/11.
//
//  The MIT License
//
//  Copyright (c) 2011 Dave DeLong
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

#import "NSString+Git.h"
#import "NSError+Git.h"

@implementation NSString (Git)

+ (NSString *)git_stringWithOid:(git_oid *)oid {
	char hex[41];
	git_oid_fmt(hex, oid);
	hex[40] = 0;
	return [NSString stringWithUTF8String:hex];
}

- (BOOL)git_isHexString {
    // Verify that self only has hexadecimal digits
    for (NSUInteger i = 0; i < [self length]; ++i) {
        unichar character = [self characterAtIndex:i];
        if (isxdigit(character) == NO) { return NO; }
    }
    return YES;
}

- (NSString *)git_shortUniqueShaString {
	if ([self git_isHexString] == NO) { return nil; }
    
	// Kyle says with a length of 6 our chances of collision are 9.6e-29, so we'll take those odds
	// todo: Vicent wrote something to do this officially: consider using it instead
	static const NSUInteger magicUniqueLength = 6;
    if ([self length] < magicUniqueLength) {
        return nil;
    }
        
	return [self substringToIndex:magicUniqueLength];
}

- (BOOL)git_getOid:(git_oid *)oid error:(NSError **)error {
    if ([self git_isHexString]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:GTGitErrorDomain 
                                         code:GIT_EINVALIDARGS 
                                     userInfo:
                      [NSDictionary dictionaryWithObject:@"unabled to create oid from non-sha string" 
                                                  forKey:NSLocalizedDescriptionKey]];
        }
        return NO;
    }
    
	int gitError = git_oid_mkstr(oid, [self UTF8String]);
	if(gitError != GIT_SUCCESS) {
		if(error != NULL) {
			*error = [NSError gitErrorForMkStr:gitError];
        }
		return NO;
	}
	return YES;
}

@end
