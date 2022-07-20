//
//  WeatherViewController.swift
//  HelloWeather
//
//

import UIKit

class WeatherViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// cityArray
    private var cityArray = [String]()
    /// cityData
    private var cityData = [CityModel]()
    
    /// lazy weatherTableView
    private lazy var weatherTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 88
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.classString())
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard isReachable() else { view.toast("Network Exception"); return }
    }
    
    override func initData()  {
        // test city
//        cityArray = ["shanghai", "beijing", "shenyang", "shenzhen", "dalian"]
        
        // task city
        cityArray = ["Gothenburg", "Stockholm", "London", "New York", "Berlin"]
        
        for ele in self.cityArray {
            self.requsetData(name: ele)
        }
    }
    
    override func setUI() {
        view.addSubview(weatherTableView)
        weatherTableView.snp.makeConstraints { make in
            make.top.equalTo(kSafeMarginTop(0))
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - requsetData
    func requsetData(name: String)  {
        
        let params = ["q": name] as [String : Any]
        
        NetworkRequest(url: AppURL.baseURL, method: .get, params: params) { [weak self] res in
            
            guard res.resCode > 0 else { return }
            
            if let dic = res.data, let weather = dic["weather"] as? [[String: Any]] {
                for item in weather {
                    let model = WeatherModel.deserialize(from: item)
                    let cityModel = CityModel(name: name, weatherModel: model)
                    self?.cityData.append(cityModel)
                }
            }
            
            self?.weatherTableView.reloadData()
            
        }
    }
    
    // MARK: - menuTableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.classString(), for: indexPath) as! CityCell
        let item = cityData[indexPath.row]
        cell.configCell(item: item)
        return cell
    }
    
}

