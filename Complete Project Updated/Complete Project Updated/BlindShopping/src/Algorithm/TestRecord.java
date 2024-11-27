package Algorithm;
public class TestRecord extends Record{
	public static final int classLabel = 0;
	int predictedLabel;
	
	TestRecord(double[] attributes, int classLabel) {
		super(attributes, classLabel);
	}
}