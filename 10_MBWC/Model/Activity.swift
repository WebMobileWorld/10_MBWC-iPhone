import Foundation

struct Activity {
    var activity_id: Int64?
    var activity_date: String
    var activity_type: String
    var activity_total_cycles: Int64
    var activity_finish_cycles: Int64
    var activity_cycle_string: String
    
    init() {
        self.activity_id = 0
        self.activity_date = ""
        self.activity_type = ""
        self.activity_total_cycles = 0
        self.activity_finish_cycles = 0
        self.activity_cycle_string = ""
    }
    
    init(activity_id: Int64) {
        self.activity_id = activity_id
        self.activity_date = ""
        self.activity_type = ""
        self.activity_total_cycles = 0
        self.activity_finish_cycles = 0
        self.activity_cycle_string = ""
    }
    
    init(_ activity_id: Int64,
         _ activity_date: String,
         _ activity_type: String,
         _ activity_total_cycles: Int64,
         _ activity_finish_cycles: Int64,
         _ activity_cycle_string: String) {
        self.activity_id = activity_id
        self.activity_date = activity_date
        self.activity_type = activity_type
        self.activity_total_cycles = activity_total_cycles
        self.activity_finish_cycles = activity_finish_cycles
        self.activity_cycle_string = activity_cycle_string
    }
}
