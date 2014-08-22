package behaviorTree;

/**
 * ...
 * @author joaquin
 */
class FilterFailureDeco extends Behavior 
{
	private var mBr:Behavior;
	public function FilterFailureDeco(br:Behavior ) 
	{
		mBr = br;
	}
	override public function new(dataContainer:DataContainer):Int 
	{
		var result:Int = mBr.execute(dataContainer);
		if (result == FAILURE)
		{
			result = SUCCES;
		}
		return result;
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		mBr.resetRunning(dataContainer);
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		mBr.createDataInstances(dataContainer);
	}
	
}

