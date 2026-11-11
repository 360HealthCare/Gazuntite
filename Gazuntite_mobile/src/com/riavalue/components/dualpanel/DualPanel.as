package com.riavalue.components.dualpanel
{
    import flash.events.MouseEvent;
    
    import mx.core.UIComponent;
    
    import spark.components.Button;
    import spark.components.Group;
    import spark.components.supportClasses.SkinnableComponent;

    [SkinState("front")]
    [SkinState("back")]
    public class DualPanel extends SkinnableComponent
    {

        private static const FRONT_STATE:String = "front";

        private static const BACK_STATE:String = "back";

        [SkinPart(required="true")]
        public var prefsButton:Button;

        [SkinPart(required="true")]
        public var backContainerHolder:Group;

        [SkinPart(required="true")]
        public var frontContainerHolder:Group;

        private var skinState:String = FRONT_STATE;

        private var _frontView:UIComponent;

        private var frontViewChange:Boolean;

        private var _backView:UIComponent;

        private var backViewChange:Boolean;

        [Bindable]
        public var transitionDuration:int = 200;


        public function get frontView():UIComponent
        {
            return _frontView;
        }

        public function set frontView(value:UIComponent):void
        {
            _frontView = value;
            frontViewChange = true;
            invalidateProperties();
        }

        public function get backView():UIComponent
        {
            return _backView;
        }

        public function set backView(value:UIComponent):void
        {
            _backView = value;
            backViewChange = true;
            invalidateProperties();
        }

        override protected function partAdded(partName:String, instance:Object):void
        {
            super.partAdded(partName, instance);

            if (instance == prefsButton)
            {
                prefsButton.addEventListener(MouseEvent.CLICK, toggleStateHandler);
            }
            else if (instance == frontContainerHolder)
            {
                frontViewChange = true;
                invalidateProperties();
            }
            else if (instance == backContainerHolder)
            {
                backViewChange = true;
                invalidateProperties();
            }
        }

        override protected function partRemoved(partName:String, instance:Object):void
        {
            super.partRemoved(partName, instance);

            if (instance == prefsButton)
            {
                prefsButton.removeEventListener(MouseEvent.CLICK, toggleStateHandler);
            }
        }


        public function toggleStateHandler(event:MouseEvent = null):void
        {
            if (skinState == FRONT_STATE)
            {
                skinState = BACK_STATE;
            }
            else
            {
                skinState = FRONT_STATE;
            }

            invalidateSkinState();
        }

        override protected function getCurrentSkinState():String
        {
            return skinState;
        }

        override protected function commitProperties():void
        {
            super.commitProperties();

            if (backViewChange && backContainerHolder)
            {
                backContainerHolder.addElement(_backView);
                backViewChange = false;
            }

            if (frontViewChange && frontContainerHolder)
            {
                frontContainerHolder.addElement(_frontView);
                frontViewChange = false;
            }
        }
    }
}