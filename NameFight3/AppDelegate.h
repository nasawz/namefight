@interface AppDelegate : NSObject <UIApplicationDelegate> {
	NSManagedObjectModel*         _managedObjectModel;
	NSManagedObjectContext*       _managedObjectContext;
	NSPersistentStoreCoordinator* _persistentStoreCoordinator;
	
	// App State
	BOOL                          _modelCreated;
	BOOL                          _resetModel;
    
}

@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, readonly)         NSString*               applicationDocumentsDirectory;

@end
