package  behaviorTree;

/**
 * ...
 * @author joaquin
 */
class Selector extends Behavior 
{
	
	public var mChildren:Array<Behavior>;
	inline private static var FIRST:Int = 0;
	private var mSaveRunningState:Bool;
	
	public function new(saveRunningState:Bool=true) 
	{
		super();
		mChildren = new Array();
		mSaveRunningState = saveRunningState;
	}
	public function addChild(br:Behavior):Void
	{
		mChildren.push(br);
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var result:Int=Behavior.INVALID;
		var data:SelectorData = cast(dataContainer.getData(dataID), SelectorData);
		var startPos:Int=0;
		if (mSaveRunningState)
		{
			startPos = data.lastRunning;
		}
		var counter:Int=startPos;
		for (i in startPos...mChildren.length) 
		{
			result = mChildren[i].execute(dataContainer);
			if (result != Behavior.FAILURE)
			{
				break;
			}
			++counter;
		}
		if (counter < data.lastRunning)
		{
			mChildren[data.lastRunning].resetRunning(dataContainer);
		}
		if (result == Behavior.SUCCES)
		{
			mChildren[counter].resetRunning(dataContainer);
		}
		if (result != Behavior.RUNNING)
		{
			data.lastRunning = FIRST;
		}else {
			data.lastRunning = counter;
		}
		return result;
	}
	
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		dataID = dataContainer.addData(new SelectorData());
		for (i in 0...mChildren.length) 
		{
			mChildren[i].createDataInstances(dataContainer);
		}
	}
	
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		var data:SelectorData = cast(dataContainer.getData(dataID),SelectorData);
		data.lastRunning = FIRST;
		for ( i in 0...mChildren.length) 
		{
			mChildren[i].resetRunning(dataContainer);
		}
	}
	
}