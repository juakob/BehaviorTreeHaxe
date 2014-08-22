package  behaviorTree;
import flash.errors.Error;

/**
 * ...
 * @author joaquin
 */
class Behavior 
{
	inline public static var  INVALID:Int = 0;
	inline public static var SUCCES:Int = 1;
	inline public static var FAILURE:Int = 2;
	inline public static var RUNNING:Int = 3;
	
	private var dataID:Int;
	public function new() 
	{
		
	}
	public function execute(dataContainer:DataContainer):Int
	{
		throw new Error("Override this method");
	}
	public function createDataInstances(dataContainer:DataContainer):Void
	{
		
	}
	public function resetRunning(dataContainer:DataContainer):Void
	{
		
	}
	
}

