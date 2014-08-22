package behaviorTree; 

/**
 * ...
 * @author joaquin
 */
class Not extends Behavior 
{
	private var mBr:Behavior;
	
	public function new(br:Behavior) 
	{
		super();
		mBr = br;
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var result:Int = mBr.execute(dataContainer);
		if (result == Behavior.FAILURE)
			return Behavior.SUCCES;
		if (result == Behavior.SUCCES)
			return Behavior.FAILURE;
		return result;
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		mBr.createDataInstances(dataContainer);
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		mBr.resetRunning(dataContainer);
	}
}

