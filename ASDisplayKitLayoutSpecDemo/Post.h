//
//  Post.h
//  Sample
//
//  Copyright (c) 2014-present, Facebook, Inc.  All rights reserved.
//  This source code is licensed under the BSD-style license found in the
//  LICENSE file in the root directory of this source tree. An additional grant
//  of patent rights can be found in the PATENTS file in the same directory.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
//  ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *name;
/**
 *  头像
 */
@property (nonatomic, copy) NSString *photo;
/**
 *  内容
 */
@property (nonatomic, copy) NSString *post;
/**
 *  发布时间
 */
@property (nonatomic, copy) NSString *time;
/**
 *  发布的图片
 */
@property (nonatomic, copy) NSString *media;
/**
 *  发布的平台
 */
@property (nonatomic, assign) NSInteger via;

@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, assign) NSInteger comments;

@end
