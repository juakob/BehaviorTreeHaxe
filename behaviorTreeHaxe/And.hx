package behaviorTree ;

	/**
	 * ...
	 * @author joaquin
	 */
class And extends Behavior 
{
	private var mBr1:Behavior;
	private var mBr2:Behavior;
	
	public function new(br1:Behavior,br2:Behavior) 
	{
		super();
		mBr1 = br1;
		mBr2 = br2;
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		if (mBr1.execute(dataContainer) != Behavior.FAILURE && mBr2.execute(dataContainer) != Behavior.FAILURE)
		{
			return Behavior.SUCCES;
		}
		return Behavior.FAILURE;
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		mBr1.resetRunning(dataContainer);
		mBr2.resetRunning(dataContainer);
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		mBr1.createDataInstances(dataContainer);
		mBr2.createDataInstances(dataContainer);
	}
	
}

