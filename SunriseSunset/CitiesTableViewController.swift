//
//  CitiesTableViewController.swift
//  SunriseSunset
//
//  Created by Іван on 10/14/18.
//  Copyright © 2018 Ivan. All rights reserved.
//

import UIKit


class CitiesTableViewController: UITableViewController {
    
    var localTime = TimeModel.init(sunrise: "", sunset: "", solar_noon: "", nautical_twilight_end: "")
    
    var cityLocation: [City] = [City(name:  "Lviv", location: Location(latitude: "", longitude: "", timeZone: +3))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkDataManager.sharedNetworkDataManager.getAllInfo(complition: {times in
            DispatchQueue.main.async {
                self.localTime = times.results
                self.tableView.reloadData()
            }
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityLocation.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let currentCity = cityLocation[indexPath.row]
        cell.textLabel?.text = currentCity.name + "—" + localTime.sunrise
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
