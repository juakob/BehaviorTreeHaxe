package behaviorTree;

/**
 * ...
 * @author joaquin
 */
class WhileBr extends Behavior 
{
	private var mCondition:Behavior;
	private var mDo:Behavior;
	private var mOnFailReturnFailure:Bool;
	
	public function new(condition:Behavior, aDo:Behavior, onFailReturnFailure:Bool = false ) 
	{
		super();
		mCondition = condition;
		mDo = aDo;
		mOnFailReturnFailure = onFailReturnFailure;
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		if (mCondition.execute(dataContainer)!=Behavior.FAILURE)
		{
			mDo.execute(dataContainer);
			return Behavior.RUNNING;
		}
		if (mOnFailReturnFailure)
		{
			return Behavior.FAILURE;
		}else {
			return Behavior.SUCCES;
		}
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		mCondition.createDataInstances(dataContainer);
		mDo.createDataInstances(dataContainer);
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		mCondition.resetRunning(dataContainer);
		mDo.resetRunning(dataContainer);
	}
}