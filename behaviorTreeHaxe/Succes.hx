package behaviorTree;

/**
 * ...
 * @author joaquin
 */
class Succes extends Behavior 
{
	
	override public function execute(dataContainer:DataContainer):Int 
	{
		return Behavior.SUCCES;
	}
	
}