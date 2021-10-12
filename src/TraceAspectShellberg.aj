
public aspect TraceAspectShellberg {

	pointcut classToTrace(): within(*App);
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSignature() + ", " 
	+ thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("[BGN] " + info);
	}
	
	after(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("[END] " + info);
	}
}
