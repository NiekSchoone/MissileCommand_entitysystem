package factories 
{
	import components.DisplayComponent;
	import components.PositionComponent;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class TowerFactory 
	{
		
		public static var TOWER : String = "tower";
		
		public function buildTower(type : String, xLocation : int):Entity
		{
			if (type == TOWER)
			{
				var display : DisplayComponent 	= new DisplayComponent();
				display.view 					= new cannon();
			}
			
			var position : PositionComponent 	= new PositionComponent();
			position.x 							= xLocation;
			position.y 							= 600;
			
			var tower : Entity = new Entity();
			
			tower.add(display);
			tower.add(position);
			
			return tower;
		}
		
	}

}