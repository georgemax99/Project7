//
//  AppDelegate.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import UIKit
import CoreData
import AWSS3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let userData = UserDefaults.standard.data(forKey: "User") {//Already Logged In
            print("Hello")
            let vc = ItemListViewController()
            vc.user = User().getUser(jsonData: userData)
            UIApplication.shared.windows.first?.rootViewController = vc
            
        } else { //Not logged in so we need to use the title controller
            UIApplication.shared.windows.first?.rootViewController = ViewController()
        }
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        self.initializeS3()
        
        return true
    }
    
    func initializeS3() {
        let poolId = "us-east-2:6c83ab3f-b5b7-4a7e-a524-e277a9584eb4"
        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: .USEast2, //other regionType according to your location.
            identityPoolId: poolId
        )
        let configuration = AWSServiceConfiguration(region: .USEast2, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "RentalApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

