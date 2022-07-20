//
//  BaseViewController.swift
//  HelloWeather
//
//  Created by a51095 on 2021/7/15.
//

import UIKit

class BaseViewController: UIViewController, NetworkStatusProtocol {
    
    /// barView
    public lazy var barView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    /// backButton
    public lazy var backButton: UIButton = {
        let b = UIButton()
        b.setImage(R.image.vc_back_black(), for: .normal)
        b.contentEdgeInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        b.addTarget(self, action: #selector(backButtonDidSeleted), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.setUI()
        self.setBackgroundColor()
    }
    
    /// initData
    public func initData() { }
    
    /// setUI
    public func setUI() { }
    
    /// setBackgroundColor
    public func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    /// addBarView
    public func addBarView() {
        let autoH = kSafeMarginTop(44)
        view.addSubview(barView)
        barView.snp.makeConstraints { make in
            make.height.equalTo(autoH)
            make.top.left.right.equalToSuperview()
        }
    }
    
    /// addBackButton
    public func addBackButton() {
        if barView.superview != nil {
            barView.addSubview(backButton)
        }else {
            view.addSubview(backButton)
        }
        
        let autoY = kSafeMarginTop(44) / 2
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(autoY)
            make.left.equalToSuperview()
        }
    }
    
    /// backButtonDidSeleted
    @objc func backButtonDidSeleted() {
        if self.navigationController?.visibleViewController != nil {
            self.navigationController?.popViewController(animated: true)
        }
        self.dismiss(animated: true)
    }
}
