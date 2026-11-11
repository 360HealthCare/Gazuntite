package 
{
    
    import flash.display.GradientType;
    import flash.geom.Matrix;
    
    import mx.core.mx_internal;
    
    import spark.components.LabelItemRenderer;
    import spark.components.supportClasses.StyleableTextField;
    
    use namespace mx_internal;
    
    /**
    * An item renderer that looks similar to the iTunes app on an iPad.
    */
    public class MusicLabelItemRenderer extends LabelItemRenderer
    {
        public function MusicLabelItemRenderer()
        {
            super();
            this.setStyle("downColor", 0x0033CC);
            this.setStyle("selectionColor", 0x0033CC);
            this.setStyle("fontSize", 20);
            this.minHeight = 0;
        }
        
        /** Padding variables */
        public var paddingTop:Number    = 14;
        public var paddingBottom:Number = 14;
        public var paddingLeft:Number   = 30;
        public var paddingRight:Number  = 40;
        public var paddingInner:Number  = 9;
        
        /** Keeps track of if this renderer instance is a heading or not */
        private var isHeading:Boolean = false;
        
        /** 
        * An artist area of the renderer to show the artist name 
        */
        private var _artist:String;
        protected var artistDisplay:StyleableTextField;
        
        public function get artist():String
        {
            return _artist;
        }
        
        public function set artist(value:String):void
        {
            if (value == _artist)
                return;
            
            _artist = value;
            
            if (artistDisplay)
            {
                artistDisplay.text = _artist;
                invalidateSize();
            }
        }
        
        /** 
        * Change the look of the renderer depending on if the data is
        * coming in is a heading or not.
        */
        override public function set data(value:Object):void
        {
            super.data = value;
            
            if (!data)
                return;

            var songName:String = data.name as String;
            var artistName:String = data.artist as String;
            
            if (data.isHeading == true)
            {
                isHeading = true;
                artistName = "";
                paddingTop = 5;
                paddingBottom = 5;
                labelDisplay.setStyle("color", "0xFFFFFF")
            } else 
            {
                isHeading = false;
                paddingTop = 14;
                paddingBottom = 14;
                labelDisplay.setStyle("color", "0x000000");
            }
            
            label = songName;
            artist = artistName;
        }
        
        /** 
        * Create the artistDisplay after the labelDisplay is created.
        */
        override protected function createLabelDisplay():void
        {
            super.createLabelDisplay();
            labelDisplay.setStyle("fontWeight", "bold");
            
            // also create an artist display
            artistDisplay = StyleableTextField(createInFontContext(StyleableTextField));
            artistDisplay.styleName = this;
            artistDisplay.editable = false;
            artistDisplay.selectable = false;
            artistDisplay.multiline = false;
            artistDisplay.wordWrap = false;
            artistDisplay.cacheAsBitmap = true;
            
            addChild(artistDisplay);
        }
        
        /**
        * Position the labelDisplay and the artistDisplay elements
        */
        override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
        {
            if (!labelDisplay)
                return;
            
            if (!artistDisplay)
                return;
            
            var viewWidth:Number  = unscaledWidth  - paddingLeft - paddingRight;
            var viewHeight:Number = unscaledHeight - paddingTop  - paddingBottom;
            
            var pieceWidth:Number = Math.floor(viewWidth / 2) - paddingInner;
            
            // measure the label part
            var labelWidth:Number = Math.max(pieceWidth, 0); 
            var labelHeight:Number = 0;
            
            if (label != "")
            {
                labelDisplay.commitStyles();
                
                // reset text if it was truncated before.
                if (labelDisplay.isTruncated)
                    labelDisplay.text = label;
                
                labelHeight = getElementPreferredHeight(labelDisplay);
            }
            
            // size the labelDisplay
            setElementSize(labelDisplay, labelWidth, labelHeight);    
            
            // position the labelDisplay after setting its size
            var labelY:Number = (viewHeight - labelHeight) + paddingTop;
            setElementPosition(labelDisplay, paddingLeft, labelY);
            labelDisplay.truncateToFit();
            
            // measure the artist part
            var artistWidth:Number = Math.max(pieceWidth, 0); 
            var artistHeight:Number = 0;
            
            if (artist != "")
            {
                artistDisplay.commitStyles();
                
                // reset text if it was truncated before.
                if (artistDisplay.isTruncated)
                    artistDisplay.text = artist;
                
                artistHeight = getElementPreferredHeight(artistDisplay);
            }
            
            // size the artistDisplay
            setElementSize(artistDisplay, artistWidth, artistHeight);    
            
            // position the artistDisplay after setting its size
            var artistY:Number = (viewHeight - artistHeight) + paddingTop;
            setElementPosition(artistDisplay, paddingLeft + pieceWidth + paddingInner + paddingInner, labelY);
            artistDisplay.truncateToFit();
        }
        
        /**
        * Consider the artistDisplay when measuring this renderer.
        */
        override protected function measure():void
        {
            super.measure();
            
            if (artistDisplay)
            {
                // reset text if it was truncated before.
                if (artistDisplay.isTruncated)
                    artistDisplay.text = artist;
                
                var horizontalPadding:Number = paddingLeft + paddingRight;
                var verticalPadding:Number = paddingTop + paddingBottom;
                
                // text respects padding right, left, top, and bottom
                artistDisplay.commitStyles();
                measuredWidth = horizontalPadding + getElementPreferredWidth(labelDisplay) + getElementPreferredWidth(artistDisplay) + paddingInner + paddingInner;
                measuredHeight = Math.max(getElementPreferredHeight(labelDisplay), getElementPreferredHeight(artistDisplay)) + verticalPadding; 
            }
        }
        
        /**
        * Draw a different background for a heading than a non-heading.
        */
        override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
        {
            // set the font colors based on if it's a heading or not
            if (!isHeading)
            {
                if (down || selected)
                {
                    labelDisplay.setStyle("color", 0xFFFFFF);
                    artistDisplay.setStyle("color", 0xFFFFFF);
                }
                else
                {
                    labelDisplay.setStyle("color", 0x000000);
                    artistDisplay.setStyle("color", 0x000000);
                }
            }
            
            var backgroundColors:* = [0xFFFFFF, 0xFFFFFF];
            var downColor:* = getStyle("downColor");
            var selectionColor:* = getStyle("selectionColor");
            
            if (isHeading)
            {
                // draw the heading background
                
                var colors:Array = [0x8E949D, 0xB3B5BE];
                var alphas:Array = [1, 1];
                var ratios:Array = [0, 255];
                var matrix:Matrix = new Matrix();
                
                // draw the heading gradient first
                matrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0);
                graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix);
                graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
                graphics.endFill();
                
                // draw the upper top highlight
                graphics.beginFill(0x88919C);
                graphics.drawRect(0, 0, unscaledWidth, 1);
                graphics.endFill();
                
                // draw the lower top highlight
                graphics.beginFill(0x9EA2AD);
                graphics.drawRect(0, 1, unscaledWidth, 1);
                graphics.endFill();  
                
                // draw the bottom highlight
                graphics.beginFill(0x9096A0);
                graphics.drawRect(0, unscaledHeight - 1, unscaledWidth, 1);
                graphics.endFill();
            } 
            else
            {
                // draw the non-heading background
                
                if (down)
                {
                    backgroundColors = [0x058CF5, 0x015FE6];
                } 
                else if (selected)
                {
                    backgroundColors = [0x058CF5, 0x015FE6];
                } 
                else 
                {
                    // use alternating row colors when not selected
                    if (itemIndex % 2 == 0)
                        backgroundColors = [0xF3F4F6, 0xF3F4F6];
                    else
                        backgroundColors = [0xFFFFFF, 0xFFFFFF];
                }
                
                var matrix2:Matrix = new Matrix();
                // draw the background first
                matrix2.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0);
                graphics.beginGradientFill(GradientType.LINEAR, backgroundColors, [1,1], [0,255], matrix2);
                graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
                graphics.endFill();  
                
                // bottom separator
                graphics.beginFill(0xCCCCCC);
                graphics.drawRect(0, unscaledHeight - 1, unscaledWidth, 1);
                graphics.endFill(); 
                
                // draw the vertical separator between the label and artist
                if (!down && !selected){
                    if (itemIndex % 2 == 0)
                        graphics.beginFill(0xE9E9E9);
                    else
                        graphics.beginFill(0xF2F2F2);
                    
                    graphics.drawRect(Math.floor(unscaledWidth / 2) - (paddingRight - paddingLeft), 0, 1, unscaledHeight - 1);
                    graphics.endFill(); 
                }
                
            }
        }
    }
}