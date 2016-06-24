//
//  CustomRefreshView.swift
//  PullToRefresh
//
//  Created by 许佳强 on 16/6/15.
//  Copyright © 2016年 Josip Cavar. All rights reserved.
//

import UIKit


class CustomRefreshView: UIView ,PullToRefreshViewDelegate{

    var activityIndicator: UIActivityIndicatorView!
    var labelTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 150, y: 10, width: 20, height: 20))
        activityIndicator.activityIndicatorViewStyle = .White
        activityIndicator.hidesWhenStopped = false
        labelTitle = UILabel(frame: CGRect(x: 85, y: 30, width: 150, height: 20))
        labelTitle.textColor = UIColor.darkTextColor()
        labelTitle.font = UIFont.systemFontOfSize(12)
        labelTitle.textAlignment = .Center
        self.addSubview(activityIndicator)
        self.addSubview(labelTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func pullToRefreshAnimationDidStart(view: PullToRefreshView) {
        activityIndicator.startAnimating()
        labelTitle.text = "Loading"
    }
    
    func pullToRefreshAnimationDidEnd(view: PullToRefreshView) {
        activityIndicator.stopAnimating()
        labelTitle.text = ""
    }
    
    func pullToRefresh(view: PullToRefreshView, progressDidChange progress: CGFloat) {
        
    }
    
    func pullToRefresh(view: PullToRefreshView, stateDidChange state: PullToRefreshViewState) {
        
        switch state {
        case .Loading:
            labelTitle.text = "Loading"
        case .PullToRefresh:
            labelTitle.text = "Pull to refresh"
           // activityIndicator.startAnimating()
        case .ReleaseToRefresh:
            labelTitle.text = "Release to refresh"
        }
    }

}
