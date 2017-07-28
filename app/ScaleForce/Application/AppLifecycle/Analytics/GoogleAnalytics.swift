//
//  GoogleAnalytics.swift
//  ScaleForce
//
//  Created by Jay Clark on 1/13/17.
//  Copyright © 2017 LongTime All rights reserved.
//

import Foundation
import Swiftilities

class GoogleAnalytics {

    private static let analyticsDictKey = "GoogleAnalytics"
    private static let trackingId = "TrackingID"
    private static let environment = "Environment"
    private static let environmentCustomDimensionIndex: UInt = 1
    static let shared: GoogleAnalytics = { () -> GoogleAnalytics in
        let sh = GoogleAnalytics()
        sh.configure()
        return sh
    }()

    var tracker: GAITracker {
        return GAI.sharedInstance().defaultTracker
    }

    fileprivate func configure() {
        if let gai = GAI.sharedInstance(),
        let analyticsDict = Bundle.main.object(forInfoDictionaryKey: GoogleAnalytics.analyticsDictKey) as? [String: String],
            let trackingId = analyticsDict[GoogleAnalytics.trackingId],
            let environment = analyticsDict[GoogleAnalytics.environment] {
            gai.trackUncaughtExceptions = false
            gai.tracker(withTrackingId: trackingId)
            // Set the value for the GA custom dimension representing the environment - either dev or prod
            let environmentDimensionParameter = GAIFields.customDimension(for: GoogleAnalytics.environmentCustomDimensionIndex)
            gai.defaultTracker.set(environmentDimensionParameter, value: environment)

            // TODO: This is initially configured to verbose logging so you see screen hits and in dryrun mode so the hits aren't transmitted. When you are ready to start sending data uncomment these lines.  Be sure to set your GA_TRACKING_ID and GA_ENVIRONMENT in the Global.xcconfig
            // Comment this to hide GA debugging content
            gai.logger.logLevel = GAILogLevel.verbose
            gai.dryRun = true
        }
        else {
            preconditionFailure("Google Analytics configuration issue. Please ensure info.plist contains [\"GoogleAnalytics\":\"[\"Environment\":\"$(GA_ENVIRONMENT)\",\"TrackingID\":\"$(GA_TRACKING_ID)\"]] and either add GA_ENVIRONMENT and GA_TRACKING_ID to your xcconfig or hardcode them instead of the $() vars.")
        }
    }
}

extension GoogleAnalytics: AnalyticsService {

    func trackPageView(page: String) {
        tracker.set(kGAIScreenName, value: page)
        if let builder = GAIDictionaryBuilder.createScreenView() {
            tracker.send(builder.build() as [NSObject: AnyObject])
        }
    }

}

public class GoogleTrackPageViewBehavior: ViewControllerLifecycleBehavior {

    public init() {}
    public func afterAppearing(_ viewController: UIViewController, animated: Bool) {
        GoogleAnalytics.shared.track(viewController)
    }

}
