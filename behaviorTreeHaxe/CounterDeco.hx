package behaviorTree;

/**
 * ...
 * @author joaquin
 */
class CounterDeco extends Behavior 
{
	private var mBr:Behavior;
	private var mCount:Int;
	private var mReset:Bool;
	
	public function new(count:Int, br:Behavior, reset:Bool = true ) 
	{
		super();
		mBr = br;
		mCount = count;
		mReset = reset;
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var data:CounterDecoNode = cast(dataContainer.getData(dataID),CounterDecoNode) ;
		var result:Int = Behavior.FAILURE;
		if (data.counter > 0)
		{
			result=mBr.execute(dataContainer);
		}
		if (result != Behavior.RUNNING)
		{
			--data.counter;
		}
		return result;
		
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		var data:CounterDecoNode = new CounterDecoNode();
		data.counter = mCount;
		dataID = dataContainer.addData(data);
		mBr.createDataInstances(dataContainer);
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		mBr.resetRunning(dataContainer);
		if(mReset){
		var data:CounterDecoNode = cast(dataContainer.getData(dataID),CounterDecoNode);
		data.counter = mCount;
		}
	}
}