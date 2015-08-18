// Copyright: Jetty, 2015
// License: Creative Commons:  Attribution, Non-Commercial, Share-alike: CC BY-NC-SA

manifoldCorrection = 0.01;

// Print with longest dimensions parallel to the bed (with raft / support)

// Top down view, W, L, H
formerThickness			= 0.6;			// Make in multiple of layer thickness
formerInternalDimensions = [3.25, 38.1, 3.25];	// Make a multiple of layer thickness

flangeThickness			= 1;
flangeHeight				= 1;

formerIDimensions 		= [formerInternalDimensions[0],
						   formerInternalDimensions[1] + formerThickness * 2 + manifoldCorrection * 2,
						   formerInternalDimensions[2]];

formerExtenalDimensions  = [formerInternalDimensions[0] + formerThickness * 2,
						   formerInternalDimensions[1] + formerThickness * 2,
						   formerInternalDimensions[2] + formerThickness * 2];
flangeDimensions			= [formerExtenalDimensions[0] + flangeHeight * 2,
						   flangeThickness,
						   formerExtenalDimensions[2] + flangeHeight * 2];
flangeOffset				= [0, ( formerExtenalDimensions[1] - flangeThickness ) / 2, 0]; 

difference()
{
	union()
	{
		cube(formerExtenalDimensions, center=true);
		translate( flangeOffset )
			cube(flangeDimensions, center = true);
		translate( -flangeOffset )
			cube(flangeDimensions, center = true);
	}
	cube(formerIDimensions, center=true);
}