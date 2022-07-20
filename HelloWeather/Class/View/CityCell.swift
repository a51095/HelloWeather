//
//  CityCell.swift
//  HelloWeather
//
//

import UIKit
import Foundation

class CityCell: UITableViewCell {
    /// 城市名称
    private var cityLabel = UILabel()
    /// 天气图标
    private var iconImageView = UIImageView()
    /// 天气状态
    private var mainLabel = UILabel()
    /// 天气描述
    private var desLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    // MARK: - UI初始化
    func setUI() {
        selectionStyle = .none
        
        cityLabel.font = SemiblodFont(16)
        cityLabel.textAlignment = .center
        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.size.equalTo(kScaleSize(100, 36))
        }
        
        iconImageView.layer.cornerRadius = 6
        iconImageView.layer.masksToBounds = true
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(kAdaptedWidth(66))
            make.left.equalTo(cityLabel.snp.right).offset(20)
        }
        
        mainLabel.font = RegularFont(14)
        mainLabel.textAlignment = .center
        contentView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.centerY.equalToSuperview()
            make.left.equalTo(iconImageView.snp.right).offset(20)
        }
        
        desLabel.font = RegularFont(14)
        desLabel.textAlignment = .center
        contentView.addSubview(desLabel)
        desLabel.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.centerY.equalToSuperview()
            make.left.equalTo(mainLabel.snp.right).offset(20)
        }
        
    }
    
    func configCell(item: CityModel) {
        cityLabel.text = item.name
        mainLabel.text = item.weatherModel?.main
        desLabel.text = item.weatherModel?.description
        
        let composeURL = AppURL.iconURL + item.weatherModel!.icon! + "@2x.png"
        
        if let source = URL(string: composeURL) {
            iconImageView.kf.setImage(with: source)
        }
    }
}
