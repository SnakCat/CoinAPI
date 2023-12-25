import Alamofire

final class NetworkManager {
    
    //MARK: - singlton
    static let instance = NetworkManager()
    
    private init() { }
    // MARK: - enums
    enum Constants {
        static let baseURL = "https://rest.coinapi.io/v1"
    }
    
    enum CoinEndPoint {
        static let assets = "/assets"
        static let exchanges = "/exchanges"
    }
    //MARK: - API key
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "E8C8042C-DA07-4794-9474-190969493BB3",
        "Accept": "application/json"
    ]
    
    //MARK: - request method
    func getAssets(completion: @escaping(Result<[ModelCoin], RequestError>) -> ()) {
        AF.request(Constants.baseURL + CoinEndPoint.assets, headers: header).responseDecodable(of: [ModelCoin].self) { response in
            switch response.result {
            case .success(let coin):
                completion(.success(coin))
            case .failure:
                completion(.failure(.errorRequest))
            }
        }
    }
}
