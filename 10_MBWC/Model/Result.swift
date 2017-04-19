import Foundation

struct Result {
    var result_id: Int64?
    var result_date: String
    var result_kg: Double
    var result_lbs: Double
    var result_sts: Double
    
    init() {
        self.result_id = 0
        self.result_date = ""
        self.result_kg = 0
        self.result_lbs = 0
        self.result_sts = 0
    }
    
    init(result_id: Int64) {
        self.result_id = result_id
        self.result_date = ""
        self.result_kg = 0
        self.result_lbs = 0
        self.result_sts = 0
    }
    
    init(_ result_id: Int64,
         _ result_date: String,
         _ result_kg: Double,
         _ result_lbs: Double,
         _ result_sts: Double) {
        self.result_id = result_id
        self.result_date = result_date
        self.result_kg = result_kg
        self.result_lbs = result_lbs
        self.result_sts = result_sts
    }
}
