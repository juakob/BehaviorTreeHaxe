package  behaviorTree;

/**
 * ...
 * @author joaquin
 */
class RunningDeco extends Behavior 
{
	private var mBr:Behavior;
	public function new(br:Behavior ) 
	{
		super();
		mBr = br;
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var result:Int = mBr.execute(dataContainer);
		if (result == Behavior.SUCCES)
		{
			return Behavior.RUNNING;
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
