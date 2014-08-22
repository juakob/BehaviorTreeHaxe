package behaviorTree;

/**
 * ...
 * @author Joaquin
 */
class Failure extends Behavior
{
	
	public function new() 
	{
		super();
	}
	override public function execute(dataContainer:DataContainer):Int 
	{
		return Behavior.FAILURE;
	}
}

