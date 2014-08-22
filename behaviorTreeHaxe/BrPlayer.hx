package  behaviorTree;
import haxe.Timer;

/**
 * ...
 * @author joaquin
 */
class BrPlayer 
{
	private var mDataManager:DataContainer;
	private var mBr:Behavior;
	
	public function new()
	{
		
	}
	public function changeBr(brTree:Behavior) :Void
	{
		mDataManager = new DataContainer();
		brTree.createDataInstances(mDataManager);
		mBr = brTree;
	}
	public function update():Void
	{
		mDataManager.time = Timer.stamp();
		mBr.execute(mDataManager);
	}
	public function addGlobalData(id:String, data:Dynamic):Void
	{
		mDataManager.addGlobalData(id, data);
	}
	public function dispose():Void
	{
		mDataManager.dispose();
		mBr = null;
	}
	
}

