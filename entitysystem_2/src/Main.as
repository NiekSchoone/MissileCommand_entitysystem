package 
{
	import adobe.utils.CustomActions;
	import components.CollisionComponent;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	import factories.ArtilleryFactory;
	import factories.CarFactory;
	import factories.TowerFactory;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import systems.CollisionSystem;
	import systems.GravitySystem;
	import systems.MovementSystem;
	import systems.RenderSystem;

	public class Main extends Sprite
	{
		private var _engine	:	Engine;
		
		public function Main()
		{
			
			// we maken als eerste de engine aan. Deze is het belangrijkste
			_engine	=	new Engine();
			
			// vervolgens initieren wij de systemen
			// dit doen we door ze toe te voegen aan de engine
			_engine.addSystem(new GravitySystem());
			_engine.addSystem(new MovementSystem());
			_engine.addSystem(new CollisionSystem());
			_engine.addSystem(new RenderSystem());			
			
			var _towerFactory : TowerFactory = new TowerFactory();
			
			for (var i:int = 0; i < 3; i++) 
			{
				var _tower : Entity = _towerFactory.buildTower(TowerFactory.TOWER, 300 * i + 100);
				addChild(_tower.get(DisplayComponent).view)
				
				_engine.addEntity(_tower);
			}
			
			var _artilleryFactory : ArtilleryFactory = new ArtilleryFactory();
			
			var _shell : Entity = _artilleryFactory.buildShell(ArtilleryFactory.BOMB);
			addChild(_shell.get(DisplayComponent).view);
			
			_engine.addEntity(_shell);
			
			// start het updaten van het spel
			stage.addEventListener(Event.ENTER_FRAME, updateEngine);
			
		}

		private function updateEngine(e : Event) : void
		{
			_engine.update();
		}
	}
}
