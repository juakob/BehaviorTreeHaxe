package behaviorTree;

/**
 * ...
 * @author joaquin
 */
class Running extends Behavior 
{
	override public function execute(dataContainer:DataContainer):Int 
	{
		return Behavior.RUNNING;
	}
	
}
