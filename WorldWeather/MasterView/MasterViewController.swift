/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class MasterViewController: UITableViewController {
  
  var detailViewController: DetailViewController? = nil
  let weatherData = WeatherData()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
      self.clearsSelectionOnViewWillAppear = false
      self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
    }
    prepareNavigationBarAppearance()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let split = self.splitViewController {
      let controllers = split.viewControllers
      detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
      if let detailViewController = detailViewController {
        detailViewController.cityWeather = weatherData.cities[0]
      }
    }
    self.title = "Cities"
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
  }
  
  
  // MARK: - Segues
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow() {
        let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
        controller.cityWeather = weatherData.cities[indexPath.row]
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
      }
    }
  }
  
  // MARK: - Table View
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weatherData.cities.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath) as CityTableViewCell
    
    let city = weatherData.cities[indexPath.row]
    cell.cityWeather = city
    return cell
  }
  
    private func prepareNavigationBarAppearance() {
        let font = UIFont(name: "HelveticaNeue-Light", size: 30)!
        
        let regulatVertical = UITraitCollection(verticalSizeClass: .Regular)
        UINavigationBar.appearanceForTraitCollection(regulatVertical).titleTextAttributes = [NSFontAttributeName:font]
        You covered a huge amount of material in this chapter by starting with more fundamental concepts of Adaptive Layout, and then exploring ways to use these concepts to great effect in your app. You've also gained more experience with Auto Layout, and hopefully some appreciation of its power.
        Adaptive Layout is a fundamental part of iOS 8. As you progress through the rest of the Adaptive Layout chapters in this section, you’ll soon realize that the future of app design is adaptive, and the historical way of building layouts will become increasingly untenable.
        With the introduction of the iPhone 6 and iPhone 6 Plus, you now need to support a total of 10 screen sizes (4 iPhone, 1 iPad; each in both portrait and landscape). The size class architecture abstracts these away from device specifics and allows you to design for the future – safe in the knowledge that your designs will look great – no matter what Apple throws at you.
        The first two chapters of this section on adaptive UI have concentrated on adaptive layout – i.e. updating the positions and sizes of the UI components. Adaptive UI doesn’t stop there though – you might want to completely alter the view controller hierarchy based on the current size class. In the next chapter you’ll learn how UIKit gives you the power to do just that with adaptive view controller hierarchies – paying particular attention to the split view controller.
        let compactVertical = UITraitCollection(verticalSizeClass: .Compact)
        UINavigationBar.appearanceForTraitCollection(compactVertical).titleTextAttributes = [NSFontAttributeName:font.fontWithSize(20)]
    }
}

