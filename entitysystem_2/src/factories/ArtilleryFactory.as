package factories 
{
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class ArtilleryFactory 
	{
		
		public static var MISSILE : String = "missile";
		public static var ENEMY_BOMB    : String = "enemybomb";
		
		public function buildShell(type : String, locX:int, locY:int):Entity
		{
			var display : DisplayComponent 	= new DisplayComponent();
			
			var velocity : VelocityComponent = new VelocityComponent();
			velocity.velocityX 				 = 0;
			
			
			var position : PositionComponent = new PositionComponent();
			position.x 						 = locX;
			position.y						 = locY;
			position.rotation = 90;
			
			if (type == MISSILE)
			{
				display.view 					= new missile();
				velocity.velocityY 				 = -1;
			}
			else if (type == ENEMY_BOMB)
			{
				display.view 					= new CarImage();
				velocity.velocityY 				 = 1;
			}
			
			var shell : Entity = new Entity();
			
			shell.add(display);
			shell.add(position);
			shell.add(velocity);
			
			return shell;
		}
	}

}