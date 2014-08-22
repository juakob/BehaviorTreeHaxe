package  behaviorTree;
import haxe.ds.Vector;
import haxe.macro.Expr.ExprOf;

/**
 * ...
 * @author joaquin
 */
class Paralel extends Behavior 
{
	private var mChildren:Vector<Behavior>;
	
	public function new(rest:ExprOf<Behavior>) 
	{
		mChildren = new Vector<Behavior>();
		for (i in 0...rest.length) 
		{
			mChildren.push(rest[i]);
		}
	}
	public function addChild(br:Behavior):Void
	{
		mChildren.push(br);
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		var running:Bool;
		var state:Int;
		for (i in 0...mChildren.length) 
		{
			state = mChildren[i].execute(dataContainer);
			if (state == RUNNING)
			{
				running = true;
			}
		}
		if (running)
		{
			return RUNNING;
		}
		return SUCCES;
		
	}
	override public function createDataInstances(dataContainer:DataContainer):Void 
	{
		for (i in 0...mChildren.length) 
		{
			mChildren[i].createDataInstances(dataContainer);
		}
	}
	override public function resetRunning(dataContainer:DataContainer):Void 
	{
		for ( i in 0...mChildren.length) 
		{
			mChildren[i].resetRunning(dataContainer);
		}
	}
	
}
