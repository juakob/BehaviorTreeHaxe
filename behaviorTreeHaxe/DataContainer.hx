package  behaviorTree;

/**
 * ...
 * @author joaquin
 */
class DataContainer 
{
	public var time:Float;
	private var mData:Array<Dynamic>;
	private var mGlobalVarDictionary:Map<String,Dynamic>;
	public function new() 
	{
		mData = new Array();
		mGlobalVarDictionary = new Map();
	}
	public function addData(data:Dynamic):Int
	{
		return mData.push(data) - 1;
	}
	public function getData(index:Int):Dynamic
	{
		return mData[index];
	}
	public function addGlobalData(id:String, data:Dynamic):Void
	{
		mGlobalVarDictionary[id] = data;
	}
	public function getGlobalData(id:String):Dynamic
	{
		return mGlobalVarDictionary[id];
	}
	public function removeGlobalData(id:String):Void
	{
		mGlobalVarDictionary[id] = null;
	}
	
	public function dispose():Void 
	{
		mData.splice(0,mData.length);
		mData = null;
		mGlobalVarDictionary = null;
	}
	
}
