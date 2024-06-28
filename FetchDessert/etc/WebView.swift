//
//  WebView.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/28/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
