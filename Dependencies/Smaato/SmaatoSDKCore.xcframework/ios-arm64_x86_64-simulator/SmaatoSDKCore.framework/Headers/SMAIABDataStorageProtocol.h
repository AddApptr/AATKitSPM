//
//  SMAIABDataStorageProtocol.h
//  SmaatoSDKCore
//
//  Created by Smaato Inc on 13.04.18.
//  Copyright © 2018 Smaato Inc. All rights reserved.￼
//  Licensed under the Smaato SDK License Agreement￼
//  https://www.smaato.com/sdk-license-agreement/
//

#import <Foundation/Foundation.h>
#import <SmaatoSDKCore/SMAGDPRTypes.h>

/// GDPR
#pragma mark - GDPR section

@protocol SMAGDPRDataStorageProtocol <NSObject>
@required

/**
 The consent string passed as a websafe base64-encoded string.
 */
@property (nonatomic) NSString *consentString;

/**
 Enum that indicates    'SubjectToGDPR_Unknown'- value -1, unset.
 'SubjectToGDPR_No' – value 0, not subject to GDPR
 'SubjectToGDPR_Yes' – value 1, subject to GDPR,
 */
@property (nonatomic) SMASubjectToGDPR subjectToGDPR;


@end

/// CCPA
#pragma mark - CCPA section

@protocol SMACCPAStorageProtocol <NSObject>
@required

/**
 Encoded privacy string based on CCPA.
 */
@property (nonatomic) NSString *usPrivacyString;

@end

/// GPP
#pragma mark - GPP section

@protocol SMAGPPStorageProtocol <NSObject>
/**
 Encoded GPP String.
 */
@property (nonatomic) NSString *gppString;

/**
 Encoded GPP SectionID/s.
 */
@property (nonatomic) NSString *gppSid;

@end

/// Common iAB legal shared data protocol

@protocol SMAIABDataStorageProtocol <SMAGDPRDataStorageProtocol, SMACCPAStorageProtocol>

@end
