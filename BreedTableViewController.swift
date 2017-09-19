//
//  BreedTableViewController.swift
//  FoodTracker
//
//  Created by Cristina Curcelli on 9/17/17.
//
//

import UIKit
import os.log

class BreedTableViewController: UITableViewController {

    // MARK: Properties
    
    var breeds = [Breed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load any saved breeds, otherwise load sample data.
        if let savedBreeds = loadBreeds() {
            breeds += savedBreeds
        } else {
            // Load the sample data.
            loadSampleBreeds()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        breeds.sort { $0.rating > $1.rating }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BreedTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BreedTableViewCell else{
                fatalError("The dequeued cell is not an instance of BreedTableViewCell.")
            }

        // Fetches the appropriate breed for the data source layout
        let breed = breeds[indexPath.row]
        
        cell.nameLabel.text = breed.name
        cell.photoImageView.image = breed.photo
        cell.ratingControl.rating = breed.rating
        
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            breeds.remove(at: indexPath.row)
            saveBreeds()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new breed.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            
            guard let breedDetailViewController = segue.destination as? BreedViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedBreedCell = sender as? BreedTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedBreedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedBreed = breeds[indexPath.row]
            breedDetailViewController.breed = selectedBreed
        
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func unwindToBreedList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? BreedViewController, let breed = sourceViewController.breed {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                // Update an existing breed.
                breeds[selectedIndexPath.row] = breed
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            else {
                // Add a new breed.
                breeds.append(breed)
                breeds.sort { $0.rating > $1.rating }
                let breedIndex = breeds.index(of: breed)
                let newIndexPath = IndexPath(row: breedIndex!, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            // Save the breeds.
            saveBreeds()
        }
    }
    
    // MARK: Private Methods
    
    private func loadSampleBreeds(){
        let photo1 = UIImage(named: "breed1")
        let photo2 = UIImage(named: "breed2")
        let photo3 = UIImage(named: "breed3")
        
        guard let breed1 = Breed(name: "Chocolate Lab", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate breed1")
        }
        
        guard let breed2 = Breed(name: "Labradoodle", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate breed2")
        }
        
        guard let breed3 = Breed(name: "Huskie", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate breed3")
        }
        
        breeds += [breed1, breed2, breed3]
    }
    
    private func saveBreeds() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(breeds, toFile: Breed.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Breeds successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save breeds...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadBreeds() -> [Breed]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Breed.ArchiveURL.path) as? [Breed]
    }

}
