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
		public static var BOMB    : String = "bomb";
		
		public function buildShell(type : String):Entity
		{
			if (type == MISSILE)
			{
				var display : DisplayComponent 	= new DisplayComponent();
				display.view 					= new missile();
			}
			else if (type == BOMB)
			{
				var display : DisplayComponent 	= new DisplayComponent();
				display.view 					= new CarImage();
			}
			
			var position : PositionComponent = new PositionComponent();
			position.x 						 = Math.random() * 600;
			position.y						 = 0;
			
			var velocity : VelocityComponent = new VelocityComponent();
			velocity.velocityX 				 = 0;
			velocity.velocityY 				 = 1;
			
			var shell : Entity = new Entity();
			
			shell.add(display);
			shell.add(position);
			shell.add(velocity);
			
			return shell;
		}
	}

}