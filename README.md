# CustomTabBar
tabbar bằng tay, sử dụng mảng button

// mở rộng để add param cho url
extension URL {

func appendingParams(_ queryItem: String, value: String?) -> URL {

guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

// Create array of existing query items
var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

// Create query item
let queryItem = URLQueryItem(name: queryItem, value: value)

// Append the new query item in the existing query items array
queryItems.append(queryItem)

// Append updated query items array in the url component object
urlComponents.queryItems = queryItems

// Returns the url from new url components
return urlComponents.url!
}
}

sử dụng
let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php")
let finalURL = url?.appendingParams("s", value: s)

BaseRouter.shared.callAPI(url: finalURL!) { (data: BaseDataModel) in
self.drinks = data.drinks
self.tableView.reloadData()
}
