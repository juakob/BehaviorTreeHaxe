package  behaviorTree;
import haxe.macro.Expr.ExprOf;

	
/**
 * ...
 * @author joaquin
 */
class Sequence extends Behavior 
{
	public var mChildren:Array<Behavior>;
	private static var FIRST:Int = 0;
	
	public function new(rest:Array<Behavior> ) 
	{
		super();
		mChildren = new Array();
		for (behavior in rest) 
		{
			mChildren.push(behavior);
		}
	}
	public function addChild(behavior:Behavior):Void
	{
		mChildren.push(behavior);
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var result:Int;
		var data:SequenceData = cast(dataContainer.getData(dataID),SequenceData);
		for (i in data.lastRunning...mChildren.length) 
		{
			result = mChildren[i].execute(dataContainer);
			if (result == Behavior.RUNNING)
			{
				data.lastRunning = i;
				return Behavior.RUNNING;
			}
			if (result == Behavior.FAILURE)
			{
				data.lastRunning = Sequence.FIRST;
				return Behavior.FAILURE;
			}
		}
		
		data.lastRunning = Sequence.FIRST;
		resetRunning(dataContainer);
		return Behavior.SUCCES;
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		dataID = dataContainer.addData(new SequenceData());
		for (i in 0...mChildren.length) 
		{
			mChildren[i].createDataInstances(dataContainer);
		}
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		var data:SequenceData =cast( dataContainer.getData(dataID),SequenceData);
		data.lastRunning = Sequence.FIRST;
		for (i in 0...mChildren.length) 
		{
			mChildren[i].resetRunning(dataContainer);
		}
	}
}