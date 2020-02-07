class MyObject {
	int field1;
	boolean field2;

	public MyObject() {
		field1 = 0;
		field2 = true;
	}

	public int foo() {
		field2 = !field2;
		return field1++;
	}
}
