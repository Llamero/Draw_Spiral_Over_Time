nTurnsInitial = 0;
nTurnsFinal = 2;
xDim = 256;
yDim = 256;
zDim = 256;
tDim = 256;	
cDim = 1;
lineWidth = 8;
newImage("HyperStack", "8-bit color-mode", xDim, yDim, cDim, zDim, tDim);	
	
				
run("physics");
getLut(reds, greens, blues);
reds[0] = 0;
greens[0] = 0;
blues[0] = 0;
setLut(reds, greens, blues);	
				
for (a=1; a<=tDim; a++){
	nTurns = nTurnsInitial + (a/tDim)*(nTurnsFinal-nTurnsInitial);
	slicesPerTurn = zDim/nTurns;							
	for	(b=1; b<=zDim; b++){
		Stack.setPosition(cDim, b, a);
		setColor(round(254*(b/slicesPerTurn)/nTurnsFinal)+1);
		setLineWidth(lineWidth);
		thetaRadians = (2 * PI) * ((b-1)/slicesPerTurn);
		x1 = round((xDim - xDim*cos(thetaRadians))/2);
		x2 = round((xDim + xDim*cos(thetaRadians))/2);
		y1 = round((yDim - yDim*sin(thetaRadians))/2);
		y2 = round((yDim + yDim*sin(thetaRadians))/2);
		drawLine(x1, y1, x2, y2);
	}
}
							
