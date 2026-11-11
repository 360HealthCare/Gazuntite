package qs.ipeControls
{
	
	import qs.ipeControls.classes.IPEBase;
	
	import spark.components.Label;
	import spark.components.NumericStepper;
	

public class IPENumericStepper extends IPEBase
{
	public function IPENumericStepper():void
	{
		super();
		nonEditableControl = new Label();
		editableControl = new NumericStepper();
	}
	
	override protected function commitEditedValue():void
	{
		Label(nonEditableControl).text = NumericStepper(editableControl).value.toString();
	}

	public function set value(value:Number):void
	{
		NumericStepper(editableControl).value = value;
		Label(nonEditableControl).text = value.toString();
	}		
	public function get value():Number { return NumericStepper(editableControl).value }
}
}