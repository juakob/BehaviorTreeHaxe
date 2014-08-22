package  behaviorTree;
import behaviorTree.DataContainer;

/**
 * ...
 * @author joaquin
 */
class WaitDeco extends Behavior 
{
	private var mBr:Behavior;
	private var mTotalTime:Float;
	
	public function new(time:Float,br:Behavior) 
	{
		super();
		mBr = br;
		mTotalTime = time;
	}
	override public function execute(data:DataContainer):Int 
	{
		var waitData:WaitDecoData = cast(data.getData(dataID), WaitDecoData);
		if (!waitData.running)
		{
			waitData.startTime = data.time;
			waitData.running = true;
		}
		if (data.time-waitData.startTime >= mTotalTime)
		{
			var result:Int = mBr.execute(data);
			if (result != Behavior.RUNNING)
			{
				waitData.running = false;
			}
			return result;
		}else {
			return Behavior.RUNNING;
		}
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		super.createDataInstances(dataContainer);
		dataID=dataContainer.addData(new WaitDecoData());
		mBr.createDataInstances(dataContainer);
	}
	override public function resetRunning(data:DataContainer):Void 
	{
		mBr.resetRunning(data);
		var waitData:WaitDecoData = cast(data.getData(dataID), WaitDecoData);
		waitData.running = false;
		waitData.startTime = 0;
	}
	
}