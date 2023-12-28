struct ModelCoin: Codable {
    let name: String
    let volumeDayUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case volumeDayUsd = "volume_1day_usd"
    }
}
