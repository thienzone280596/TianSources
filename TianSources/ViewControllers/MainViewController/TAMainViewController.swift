//
//  ViewController.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 26/06/2022.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingOptionType]
}

//Tạo một enum
enum SettingOptionType {
    case staticCell(model: SettingOptions)
    case switchCell(model: SettingSwitchOption)
}

struct SettingSwitchOption {
    let title:String
    let icon:UIImage?
    let bacgroundColor: UIColor
    var isOn:Bool
    let handler: (() -> Void)
}

//Taoj struct setting
struct SettingOptions {
    let title:String
    let icon:UIImage?
    let bacgroundColor: UIColor
    let handler: (() -> Void)
}

class TAMainViewController: BaseViewController {
    //Tạo Table view
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        return table
    }()
    //Tao một model cho phần setting
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        //Add Tableview vao MainView
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        self.models.append(Section(title: "Genaral", options: [
            .switchCell(model: SettingSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), bacgroundColor: .systemOrange, isOn: false, handler: {
                print("Tapped first Cell")
            })),
            .staticCell(model: SettingOptions(title: "Button", icon: UIImage(systemName: "cursorarrow.click.2"), bacgroundColor: .systemBlue, handler: {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TAButtonCustom") as! TAButtonCustom
                self.navigationController?.pushViewController(vc, animated: false)
                
            })),
            .staticCell(model: SettingOptions(title: "Toast Notification", icon: UIImage(systemName: "bell.badge.fill"), bacgroundColor: .systemRed, handler: {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TAToastViewController") as! TAToastViewController
                self.navigationController?.pushViewController(vc, animated: false)
            }))
        ]))
        
        self.models.append(Section(title: "Custom", options: [
            .staticCell(model: SettingOptions(title: "Notification", icon: UIImage(systemName: "bell.badge.fill"), bacgroundColor: .systemPink, handler: {
                print("Tapped first Cell")
            })),
            .staticCell(model: SettingOptions(title: "Sounds", icon: UIImage(systemName: "speaker.wave.3.fill"), bacgroundColor: .systemPink, handler: {
                
            })),
            .staticCell(model: SettingOptions(title: "Focus", icon: UIImage(systemName: "moon.fill"), bacgroundColor: .purple, handler: {
                
            }))
        ]))

    }
}

extension TAMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
               guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                   return UITableViewCell()
               }
               cell.configure(with: model)
               return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    //so luong row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    //so luong section
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    //did tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
                model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}
