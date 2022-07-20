//
//  ExLoadingView.swift
//  HelloWeather
//
//


final class ExLoadingView: UIView {
    /// lazy messageLabel
    private lazy var messageLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = RegularFont(16)
        l.textAlignment = .center
       return l
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - deinit
    deinit { print("CCLoadingView deinit~") }
    
    // MARK: - init
    init(toast: String) {
        super.init(frame: .zero)
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = .hexColor("#000000", 0.5)
        addSubview(contentView)
        
        let activity = UIActivityIndicatorView(style: .white)
        contentView.addSubview(activity)
        
        if !toast.isEmpty {
            // contentView
            contentView.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: 120, height: 100))
            }
            
            // activity
            activity.snp.makeConstraints { (make) in
                make.top.equalTo(16)
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize(width: 37, height: 37))
            }
            
            // messageLabel
            messageLabel.text = toast
            addSubview(messageLabel)
            messageLabel.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(contentView.snp.bottom)
                make.size.equalTo(CGSize(width: 120, height: 36))
            }
        }else {
            // contentView
            contentView.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: 100, height: 100))
            }
            
            // activity
            activity.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
        }
        activity.startAnimating()
    }
}

extension UIView {
    
    func showLoading(_ message: String = "") {
        
        if let lastView = subviews.last as? ExLoadingView { lastView.removeFromSuperview() }
        
        let loadingView = ExLoadingView(toast: message)
        addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    func hideLoading() {
        for item in subviews {
            if item.isKind(of: ExLoadingView.self) {
                item.removeFromSuperview()
            }
        }
    }
}
