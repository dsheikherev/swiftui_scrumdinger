//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Denis Sheikherev on 16.12.2020.
//

import SwiftUI
import Bugsee

@main
struct ScrumdingerApp: App {
    
    init() {
        let options: [String: Any] = [BugseeMaxRecordingTimeKey: 60,
                                      BugseeShakeToReportKey: true,
                                      BugseeScreenshotToReportKey : true,
                                      BugseeCrashReportKey        : true,
                                      BugseeMonitorNetworkKey : true,
                                      BugseeStyleKey : BugseeStyleSystemDefault];
        
        #warning("Please add your token")
        Bugsee.launch(token:"", options:options);
    }
    
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }
    }
}
