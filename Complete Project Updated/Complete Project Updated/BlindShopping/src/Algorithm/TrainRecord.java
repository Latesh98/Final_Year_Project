package Algorithm;
public class TrainRecord extends Record {
	double distance;
	public int classLabel;
	
	TrainRecord(double[] attributes, int classLabel) {
		super(attributes, classLabel);
	}
}