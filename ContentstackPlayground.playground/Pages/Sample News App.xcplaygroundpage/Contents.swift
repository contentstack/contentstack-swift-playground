//: [Previous](@previous)

import Foundation
import Contentstack
import PlaygroundSupport

let AccessToken = "blt0c4300391e033d4a59eb2857"
let APIKEY = "blt920bb7e90248f607"
let EnvironmentName = "production"

PlaygroundPage.current.needsIndefiniteExecution = true

let stack:Stack = Contentstack.stack(withAPIKey: APIKEY, accessToken: AccessToken, environmentName: EnvironmentName)

var allNewsByCategoryQuery:Query! = nil

allNewsByCategoryQuery = stack.contentType(withName: "news").query()

allNewsByCategoryQuery.language(Language.ENGLISH_UNITED_STATES)

allNewsByCategoryQuery.whereKey("top_news", equalTo: NSNumber(value: true))

allNewsByCategoryQuery.includeReferenceField(withKey:["category"])

allNewsByCategoryQuery.order(byAscending:"updated_at")

allNewsByCategoryQuery.includeReferenceField(withKey:["category"])
allNewsByCategoryQuery.order(byAscending:("updated_at"))


private var newsArticles = [Entry]();

class NewsCell: UITableViewCell {
    
    var dateLabel: UILabel! = UILabel(frame: CGRect(x: 210.0, y: 80.0, width: 100, height: 20))
    var categoryLabel: UILabel! = UILabel(frame: CGRect(x: 110.0, y: 80.0, width: 100, height: 20))
    var titleLabel: UILabel! = UILabel(frame: CGRect(x: 110.0, y: 5.0, width: 200.0, height: 20.0))
    var bannerImageView: UIImageView! = UIImageView(frame:  CGRect(x: 5.0, y: 5.0, width: 100, height: 100))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.addSubview(titleLabel)
        dateLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        dateLabel.textAlignment = NSTextAlignment.right
        contentView.addSubview(dateLabel)
        categoryLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        contentView.addSubview(categoryLabel)
        bannerImageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        contentView.addSubview(bannerImageView)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }

    func loadContent(entry:Entry){
        self.titleLabel.text = entry.title
        let categories:[Any] = entry.object(forKey: "category") as! [Any]
        let firstCategory:AnyObject = categories[0] as AnyObject
        let category:String = firstCategory["title"] as! String
        self.categoryLabel.text = category
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.ReferenceType.local
        dateFormatter.dateStyle = DateFormatter.Style.medium
        let dtString = dateFormatter.string(from:entry.updatedAt) as String
        
        self.dateLabel.text = dtString
        let asset:AnyObject = entry.object(forKey: "thumbnail") as AnyObject
        let url:String = asset["url"] as! String
        
        self.bannerImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.bannerImageView.clipsToBounds = true
        self.bannerImageView.downloadedFrom(link:url)
        
    }
}

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 110.0
        
        allNewsByCategoryQuery.find {(responseType, result, error) in
            print("res\(result)")
            
            if(error != nil){
                print("error:\(error)")
            }else {
                
                newsArticles.removeAll(keepingCapacity: false)
                
                for entry:Entry in (result!.getResult() as! [(Entry)]){
                    newsArticles.append(entry)
                }
                print(newsArticles.count)
   
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newsArticles.count > 0 {
            return newsArticles.count
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if newsArticles.count > 0 {
            let entry:Entry! = newsArticles[indexPath.row]
            let newsCell:NewsCell = cell as! NewsCell
            newsCell.loadContent(entry:entry)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let next = TableViewController()
        let entry:Entry! = newsArticles[indexPath.row]
        next.title = entry.title
    navigationController?.pushViewController(next, animated: true)
    }
    
}

let tableViewController = TableViewController()
tableViewController.title = "News..."
let navigationController = UINavigationController(rootViewController: tableViewController)

navigationController.view.frame.size = CGSize(width: 320, height: 400)
navigationController.navigationBar.barTintColor = UIColor.white

PlaygroundPage.current.liveView = navigationController.view

//: [Previous](@previous)
