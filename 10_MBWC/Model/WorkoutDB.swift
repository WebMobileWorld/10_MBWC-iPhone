import SQLite

class WorkoutDB {

    // workouts table
    let workouts = Table("workouts")
    let workout_id              = Expression<Int64>("workout_id")
    let workout_type            = Expression<String>("workout_type")
    let workout_order           = Expression<Int64>("workout_order")
    let workout_purchased       = Expression<Bool>("workout_purchased")
    let workout_title           = Expression<String>("workout_title")
    let workout_video_name      = Expression<String>("workout_video_name")
    let workout_video_extension = Expression<String>("workout_video_extension")
    let workout_voice_name      = Expression<String>("workout_voice_name")
    let workout_voice_extension = Expression<String>("workout_voice_extension")
    let workout_introduction    = Expression<String>("workout_introduction")
    let workout_done            = Expression<Bool>("workout_done")
    
    // activities table
    let activities = Table("activities")
    let activity_id            = Expression<Int64>("activity_id")
    let activity_date          = Expression<String>("activity_date")
    let activity_type          = Expression<String>("activity_type")
    let activity_total_cycles  = Expression<Int64>("activity_total_cycles")
    let activity_finish_cycles = Expression<Int64>("activity_finish_cycles")
    let activity_cycle_string  = Expression<String>("activity_cycle_string")
    
    // results table
    let results = Table("results")
    let result_id   = Expression<Int64>("result_id")
    let result_date = Expression<String>("result_date")
    let result_kg   = Expression<Double>("result_kg")
    let result_lbs  = Expression<Double>("result_lbs")
    let result_sts  = Expression<Double>("result_sts")
    
    static let instance = WorkoutDB()
    let db: Connection?
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/Workout.sqlite3")
            createTable()
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createTable() {
        do {
            // workouts
            try db!.run(workouts.drop(ifExists: true))
            try db!.run(workouts.create(ifNotExists: true) { table in
                table.column(workout_id, primaryKey: true)
                table.column(workout_type)
                table.column(workout_order)
                table.column(workout_purchased)
                table.column(workout_title)
                table.column(workout_video_name, unique: true)
                table.column(workout_video_extension)
                table.column(workout_voice_name, unique: true)
                table.column(workout_voice_extension)
                table.column(workout_introduction)
                table.column(workout_done)
            })
            
            // activities
//            try db!.run(activities.drop(ifExists: true))
            try db!.run(activities.create(ifNotExists: true) { table in
                table.column(activity_id, primaryKey: true)
                table.column(activity_date)
                table.column(activity_type)
                table.column(activity_total_cycles)
                table.column(activity_finish_cycles)
                table.column(activity_cycle_string)
            })
            
            // results
//            try db!.run(results.drop(ifExists: true))
            try db!.run(results.create(ifNotExists: true) { table in
                table.column(result_id, primaryKey: true)
                table.column(result_date)
                table.column(result_kg)
                table.column(result_lbs)
                table.column(result_sts)
            })
            
        } catch {
            print("Unable to create table")
        }
    }
   
    //////////////////////////////////     workouts start       //////////////////////////////////
    func insertWorkout(_ cworkout_type: String,
                       _ cworkout_order: Int64,
                       _ cworkout_purchased: Bool,
                       _ cworkout_title: String,
                       _ cworkout_video_name: String,
                       _ cworkout_video_extension: String,
                       _ cworkout_voice_name: String,
                       _ cworkout_voice_extension: String,
                       _ cworkout_introduction: String,
                       _ cworkout_done: Bool) -> Int64? {
        do {
            let insert = workouts.insert(workout_type <- cworkout_type,
                                         workout_order <- cworkout_order,
                                         workout_purchased <- cworkout_purchased,
                                         workout_title <- cworkout_title,
                                         workout_video_name <- cworkout_video_name,
                                         workout_video_extension <- cworkout_video_extension,
                                         workout_voice_name <- cworkout_voice_name,
                                         workout_voice_extension <- cworkout_voice_extension,
                                         workout_introduction <- cworkout_introduction,
                                         workout_done <- cworkout_done)
            let workout_id = try db!.run(insert)
            
            return workout_id
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func selectWorkout(workoutType: String) -> [Workout] {
        var result = [Workout]()
        do {
            let query = workouts
                .filter(workout_type == workoutType)
                .order(workout_order.asc)
            for workout in try db!.prepare(query) {
                result.append(Workout(workout[workout_id],
                                      workout[workout_type],
                                      workout[workout_order],
                                      workout[workout_purchased],
                                      workout[workout_title],
                                      workout[workout_video_name],
                                      workout[workout_video_extension],
                                      workout[workout_voice_name],
                                      workout[workout_voice_extension],
                                      workout[workout_introduction],
                                      workout[workout_done]))
            }
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func deleteWorkout(_ cworkout_id: Int64) -> Bool {
        do {
            let workout = workouts.filter(workout_id == cworkout_id)
            if try db!.run(workout.delete()) > 0 {
                return true
            }
            else {
                return false
            }
        } catch {
            
            print("Delete failed")
        }
        return false
    }
    
    func updateWorkout(_ cworkout_id:Int64, newWorkout: Workout) -> Bool {
        let workout = workouts.filter(workout_id == cworkout_id)
        do {
            let update = workout.update([workout_type <- newWorkout.workout_type,
                                         workout_order <- newWorkout.workout_order,
                                         workout_purchased <- newWorkout.workout_purchased,
                                         workout_title <- newWorkout.workout_title,
                                         workout_video_name <- newWorkout.workout_video_name,
                                         workout_video_extension <- newWorkout.workout_video_extension,
                                         workout_voice_name <- newWorkout.workout_voice_name,
                                         workout_voice_extension <- newWorkout.workout_voice_extension,
                                         workout_introduction <- newWorkout.workout_introduction,
                                         workout_done <- newWorkout.workout_done])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
    //////////////////////////////////     workouts end       //////////////////////////////////
   
    //////////////////////////////////     activities start       //////////////////////////////////
    func insertActivity(_ cactivity_date: String,
                        _ cactivity_type: String,
                        _ cactivity_total_cycles: Int64,
                        _ cactivity_finish_cycles: Int64,
                        _ cactivity_cycle_string: String) -> Int64? {
        do {
            let insert = activities.insert(activity_date <- cactivity_date,
                                           activity_type <- cactivity_type,
                                           activity_total_cycles <- cactivity_total_cycles,
                                           activity_finish_cycles <- cactivity_finish_cycles,
                                           activity_cycle_string <- cactivity_cycle_string)
            let activity_id = try db!.run(insert)
            
            return activity_id
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func selectActivity(activityDate: String) -> [Activity] {
        var result = [Activity]()
        do {
            let query = activities
                .filter(activity_date == activityDate)
                .order(activity_id.asc)
            for activity in try db!.prepare(query) {
                result.append(Activity(activity[activity_id],
                                       activity[activity_date],
                                       activity[activity_type],
                                       activity[activity_total_cycles],
                                       activity[activity_finish_cycles],
                                       activity[activity_cycle_string]))
            }
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func selectActivityScalar(activityDate: String, activityType: String) -> Int {
        var result = 0
        do {
            let query = activities
                .filter(activity_date == activityDate && activity_type == activityType).count
            result = try db!.scalar(query)
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func selectActivityId(activityDate: String, activityType: String) -> Int64 {
        var result: Int64 = 0
        do {
            let query = activities
                .select(activity_id)
                .filter(activity_date == activityDate && activity_type == activityType)
            for activity in try db!.prepare(query) {
                result = activity[activity_id]
            }
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func deleteActivity(activityDate: String) -> Bool {
        do {
            let activity = activities
                .filter(activity_date == activityDate)
            if try db!.run(activity.delete()) > 0 {
                return true
            }
            else {
                return false
            }
        } catch {
            
            print("Delete failed")
        }
        return false
    }
    
    func updateActivity(_ cactivity_id:Int64, newActivity: Activity) -> Bool {
        let activity = activities.filter(activity_id == cactivity_id)
        do {
            let update = activity.update([activity_date <- newActivity.activity_date,
                                          activity_type <- newActivity.activity_type,
                                          activity_total_cycles <- newActivity.activity_total_cycles,
                                          activity_finish_cycles <- newActivity.activity_finish_cycles,
                                          activity_cycle_string <- newActivity.activity_cycle_string])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
    //////////////////////////////////     done end       //////////////////////////////////
    
    //////////////////////////////////     results start       //////////////////////////////////
    func insertResult(_ cresult_date: String,
                      _ cresult_kg: Double,
                      _ cresult_lbs: Double,
                      _ cresult_sts: Double) -> Int64? {
        do {
            let insert = results.insert(result_date <- cresult_date,
                                        result_kg <- cresult_kg,
                                        result_lbs <- cresult_lbs,
                                        result_sts <- cresult_sts)
            let result_id = try db!.run(insert)
            
            return result_id
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func selectResult() -> [Result] {
        var result = [Result]()
        do {
            let query = results
                .order(result_id.desc)
                .limit(7)
            for myresult in try db!.prepare(query) {
                result.append(Result(myresult[result_id],
                                     myresult[result_date],
                                     myresult[result_kg],
                                     myresult[result_lbs],
                                     myresult[result_sts]))
            }
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func selectResultByDate(resultDate: String) -> [Result] {
        var result = [Result]()
        do {
            let query = results
                .filter(result_date == resultDate)
                .order(result_id.asc)
            for myresult in try db!.prepare(query) {
                result.append(Result(myresult[result_id],
                                     myresult[result_date],
                                     myresult[result_kg],
                                     myresult[result_lbs],
                                     myresult[result_sts]))
            }
        } catch {
            print("Select failed")
        }
        
        return result
    }
   
    func selectResultScalar(resultDate: String) -> Int {
        var result = 0
        do {
            let query = results
                .filter(result_date == resultDate).count
            result = try db!.scalar(query)
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func selectResultId(resultDate: String) -> Int64 {
        var result: Int64 = 0
        do {
            let query = results
                .select(result_id)
                .filter(result_date == resultDate)
            for myresult in try db!.prepare(query) {
                result = myresult[result_id]
            }
        } catch {
            print("Select failed")
        }
        
        return result
    }
    
    func deleteResult(_ cresult_id: Int64) -> Bool {
        do {
            let result = results.filter(result_id == cresult_id)
            if try db!.run(result.delete()) > 0 {
                return true
            }
            else {
                return false
            }
        } catch {
            
            print("Delete failed")
        }
        return false
    }
    
    func updateResult(_ cresult_id:Int64, newResult: Result) -> Bool {
        let result = results.filter(result_id == cresult_id)
        do {
            let update = result.update([result_date <- newResult.result_date,
                                        result_kg <- newResult.result_kg,
                                        result_lbs <- newResult.result_lbs,
                                        result_sts <- newResult.result_sts])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
    //////////////////////////////////     done end       //////////////////////////////////
}
