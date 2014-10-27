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
		
		public function TowerFactory() 
		{
			
		}
		
		public function buildTower(type = String):
		{
			if (type == TOWER)
			{
				var display : DisplayComponent = new DisplayComponent();
				display.view = 
			}
			
			var tower : Entity = new Entity();
			
			tower.add(display);
			tower.add(position);
		}
		
	}

}