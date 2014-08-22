package  behaviorTree;

/**
 * ...
 * @author joaquin
 */
class Question extends Behavior 
{
	private var mCondition:Behavior;
	private var mThen:Behavior;
	private var alwaysCheck:Bool;
	private var lock:Bool;
	public function new(condition:Behavior, then:Behavior, alwaysCheck:Bool = true ) 
	{
		mCondition = condition ;
		mThen = then;
		this.alwaysCheck = alwaysCheck;
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var data:QuestionNode =QuestionNode( dataContainer.getData(dataID));
		
		if (mCondition.execute(dataContainer)==SUCCES||data.lock)
		{
			var result:Int = mThen.execute(dataContainer);
			if (!alwaysCheck)
			{
				data.lock = result == RUNNING;
			}
			data.running = result == RUNNING;
			return result;
		}
		if (data.running)
		{
			data.running = false;
			mThen.resetRunning(dataContainer);
		}
		return FAILURE;
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		dataID = dataContainer.addData(new QuestionNode);
		mCondition.createDataInstances(dataContainer);
		mThen.createDataInstances(dataContainer);
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		var data:QuestionNode = QuestionNode( dataContainer.getData(dataID));
		data.lock = false;
		mCondition.resetRunning(dataContainer);
		mThen.resetRunning(dataContainer);
	}
}