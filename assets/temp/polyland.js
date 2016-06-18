var seed = {"x^1y^1": {"type": "number", "value": 0}, "x^1": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "zEnd": {"type": "number", "value": -3}, "y^3": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": 0}, "y^5": {"type": "number", "value": 0}, "y^1": {"type": "number", "value": 0}, "x^1y^2": {"type": "number", "value": 0}, "x^1y^3": {"type": "number", "value": 0}, "rotationFactor": {"type": "number", "value": 1}, "x^2y^1": {"type": "number", "value": 1}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "Z_DEPTH": {"type": "number", "value": 15}, "rotationChangeOrder": {"type": "number", "value": -2}, "radiusX": {"type": "number", "value": 6}, "zStart": {"type": "number", "value": 0}, "x^1y^4": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^3y^1": {"type": "number", "value": 0}, "x^4y^1": {"type": "number", "value": -5}, "projection_e": {"type": "number", "value": -10}, "projection_f": {"type": "number", "value": 30}, "x^4": {"type": "number", "value": 0}};


var Globals = {
    coeffObj: {},
	originalCoeffObj: {},
	animationFrame: 0,
	adjustY: 0,
	coeffObj: {},
	frameInterval: 1
};

var Seed = {};

var regexp1 = /([a-z])\^([0-9])/g;
var regexp2 = /(Math\.pow\([^\)]+\))(Math\.pow\([^\)]+\))/g;

for (var key in seed) {
  	if (_.includes(key, '^')) {
        newkey = key.replace(regexp1, "Math.pow($1, $2)");
        newkey = newkey.replace(regexp2, "$1 * $2");
	  	Globals.coeffObj[newkey] = seed[key].value;
		Globals.originalCoeffObj[newkey] = seed[key].value;
    } else {
        Seed[key] = seed[key].value;
    }
}


var horizontalExpansionCoeff = 1.1;
var primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113];






DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);
LIGHT_GREY = new Color(0.85, 0.85, 0.85, 0.5);

x_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });
x_axis.add(new Point(-view.size.width/2, 0));
x_axis.add(new Point(view.size.width/2, 0));
x_axis.closed = true;
//project.activeLayer.insertChild(0,x_axis)

y_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });
y_axis.add(new Point(0, -view.size.height/2));
y_axis.add(new Point(0, view.size.height/2));

x_lines = [];
_.each(_.range(-10,10), function(n) {
	line = new Path({strokeColor: LIGHT_GREY });
	line.add( new Point(n, view.size.height/2) );
	line.add( new Point(n, -view.size.height/2) );
	line.closed = true;
	//project.activeLayer.insertChild(0, line);
	x_lines.push( line );
});

y_lines = [];
_.each(_.range(-10,10), function(n) {
	line = new Path({strokeColor: LIGHT_GREY });
	line.add( new Point(view.size.width/2, n) );
	line.add( new Point(-view.size.width/2, n) );
	line.closed = true;
	//project.activeLayer.insertChild(0, line);
	y_lines.push( line );
});


function trans(lay, scale) {
	if (scale === undefined) scale = 1;
	lay.transform( new Matrix((view.size.width * scale),0,0,(view.size.height * -scale),
		view.center.x, view.center.y) );
}

trans(project.activeLayer, 0.1);



GraphLayer = new Layer();

// define formal mathematical function
MFunction = function(func, extrema) {
	//console.log(func.length);
	this.func = func;
	if (!extrema) { extrema = [-5,5]; }

	this.domain = {
		elements: [],
		min: (extrema[0] || -5),
		max: (extrema[1] || 5)
	};

	this.codomain = {
		elements: [],
		min: null,
		max: null
	};

	this.mapping = null;
}

MFunction.prototype = {

	compute: function(delta) {
		if (!delta) { delta = 30; }
		this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);
		this.codomain.elements = _.map(this.domain.elements, this.func);
		this.codomain.min = _.min(this.codomain.elements);
		this.codomain.max = _.max(this.codomain.elements);
		this.mapping = _.zip(this.domain.elements, this.codomain.elements);
		this.mapObject = _.object(this.domain.elements, this.codomain.elements);

		this._w = Math.abs(this.domain.max - this.domain.min);
		this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );

		this.transformation_matrix = new Matrix(
			(view.size.width / this._w)*horizontalExpansionCoeff, 0,
			0, (view.size.height / (-1*this._h)),
			view.center.x, view.center.y);

		// adjust to keep x=0 in vertical middle
		//console.log(this.transformation_matrix);

		if (this.zindex == 0) {
			Globals.adjustY =  -1 * this.getValueAt(0);
			//console.log('Globals.adjustY', Globals.adjustY);
		}
		Globals.adjustY = 0;

		this.computed = true;
	},

	getValueAt: function(x) {
		if (_.includes(this.domain.elements, x)) {
			return this.mapObject[x];
		} else {
			var elementsBefore = _.filter(this.domain.elements, function(element) {
				return (element <= x);
			})
			//console.log('elementsBefore', elementsBefore);
			var r = this.mapObject[elementsBefore[elementsBefore.length-1]];
			//console.log(r);
			return r;
		}
	},

	// "flattens" mapping
	// i.e. [[1,2],3] -> [1,2,3]
	getPoints: function() {
		if (!this.computed) { this.compute(); }
		this.points = _.map(this.mapping, function(pair) {
			return _.flatten([pair[0], pair[1]+Globals.adjustY]);
		});
		return this.points;
	},


	draw: function(path, tmatrix) {

		if (!this.computed) { this.compute(); }

		this.path = path;
		this.path.removeSegments();
		this.tmatrix = tmatrix;

		this.points.push(new Point(this.domain.max*1.5, Math.abs(this.codomain.min)*-1.7
			+ Math.abs(this.codomain.max)*-1.7));
		this.points.push(new Point(this.domain.min*1.5, Math.abs(this.codomain.min)*-1.7
			+ Math.abs(this.codomain.max)*-1.7));

		var self = this;
		_.each(this.points, function(p) {
			self.path.add(new Point(p));
		});

		this.path.closed = true;

		if (tmatrix) {
			this.path.transform(tmatrix);
		} else {
			this.path.transform(this.transformation_matrix);
		}
		//this.path.smooth();

	},

	project: function(z) {
		var shrinkage = (this.zindex % Z_DEPTH) / Z_DEPTH;
		var shrunk = 1 - shrinkage * 0.3;
		//console.log('effZ', shrinkage, shrunk);
		//this.path.scale(shrunk, shrunk, view.center)
		this.path.rotate(-Seed.rotationFactor * Math.pow(this.zindex, Seed.rotationChangeOrder), view.center);
		this.path.translate( new Point(Seed.projection_e, Seed.projection_f) )

		// check on key points to keep path's bottom edges off page
		// this.path.segments[0].point = new Point(this.domain.max*1.5, Math.abs(this.codomain.min)*-1.7
		//	 + Math.abs(this.codomain.max)*-1.7).transform(Globals.global_matrix);
		//
		// this.path.segments[this.path.segments.length-3].point = new Point(this.domain.min*1.5, Math.abs(this.codomain.min)*-1.7
		//	 + Math.abs(this.codomain.max)*-1.7).transform(Globals.global_matrix);

		// console.log('xx', this.path.segments[0].point.x);
		// this.path.segments[0].point.x = -10;
		// this.path.segments[this.path.segments.length-1].point.x = -10;
		//
		// this.path.segments[this.path.segments.length-2].point.x = view.bounds.right;
		// this.path.segments[this.path.segments.length-3].point.x = view.bounds.right;
		//this.path.segments[this.path.segments.length-1].point.y = view.height*1.2*(1/shrinkage);
		// = new Point(-10,-view.height);


		//
		// this.path.segments[this.path.segments.length-2].point.x = view.width*1.3;
		// this.path.segments[this.path.segments.length-2].point.y = -view.height*1.3;
		//
		// this.path.segments[this.path.segments.length-1].point.x = -10;
		// this.path.segments[this.path.segments.length-1].point.y = -view.height*1.3;

	}

}




var PolynomialSurfaceSlice = function(x, y, cf) {
	fn = _.reduce(_.mapObject(cf, function(value, key) {
		return value.toString() + '*' + key.toString()
	}), function(a,b) {
		return a+'+'+b;
	});
	//console.log(fn);
	eval("var r = " + fn + ";");
	return r;
}


function changeCoeffs() {
	Globals.coeffObj = _.object(_.map(_.pairs(Globals.coeffObj), function(pair, index) {
		pair[1] = Globals.originalCoeffObj[pair[0]] * 10 * Math.cos(  Globals.animationFrame/(primes[index]) );
		return pair;
	}))
}

var Z_DEPTH = Seed.Z_DEPTH;

xrange = [-Seed.radiusX, Seed.radiusX];
zrange = [Seed.zStart, Seed.zEnd];

var slices = [];
var sliceFunctions = [];

var alphaCoeffs = _.map(_.range(Z_DEPTH), function(z) {
	return 0.6-((z/Z_DEPTH)*0.4);
});

var sliceColors = _.map(_.range(Z_DEPTH), function(n) {
	clr = new Color(0.1,1,0.1,0.4*alphaCoeffs[n]);
	clr.hue += 60 * Math.sin(n);
	clr.brightness = 1 - (Math.sin(n)/2 + 1/2)/6;
	return clr;
});

var zrange_index = 0;
function drawZRange(a,b) {

	zspace = numeric.linspace(a, b, Z_DEPTH);
	zindex = 0;

	//console.log('zrange_index = '+zrange_index, zspace[0]);

	_.each(zspace, function(z) {

		var path, sliceFunction;
		if (zrange_index == 0) {
			path = new Path({
				strokeColor: new Color(0.3, 0.3, 0.3, 0.6*alphaCoeffs[zindex]),
				strokeWidth: 1,
				fillColor: sliceColors[zindex],
			});
			sliceFunction = new MFunction(function(x) {
				return PolynomialSurfaceSlice(x,z,Globals.coeffObj);
			}, [xrange[0],xrange[1]]);

			sliceFunction.zindex = zindex;
			sliceFunction.zrange_index = zrange_index;
			sliceFunction.compute();

			Globals.transformation_matrix = sliceFunction.transformation_matrix;
			//console.log(Globals.transformation_matrix);
			//Globals.transformation_matrix.f += Globals.adjustY;
			//console.log(Globals.transformation_matrix);

		} else {
			path = slices[zindex];
			sliceFunction = new MFunction(function(x) {
				return PolynomialSurfaceSlice(x,z,Globals.coeffObj);
			}, [xrange[0],xrange[1]]);
			sliceFunction.zindex = zindex;
			sliceFunction.zrange_index = zrange_index;
		}

		sliceFunction.z = z;
		sliceFunction.getPoints();
		sliceFunction.draw(path, Globals.transformation_matrix);
		sliceFunction.project(z);

		if (zrange_index == 0) {
			slices.push(path);
			sliceFunctions.push(sliceFunction);
			project.activeLayer.insertChild(0,path);
		}
		//path.smooth();

		zindex++;

	})

	zrange_index++;
}

drawZRange(zrange[0], zrange[1]);

function zMove2(n) {

	//slices = [];
	//sliceFunctions = [];
	//delta = -0.01
	//delta = -0.05;
	//delta = (Math.cos(n/100));
	//console.log('del', delta);
	//theta = n/10;
	//zrange2 = [zrange[0]*Math.cos(theta), zrange[1]*Math.cos(theta)];
	//zrange = [zrange[0]+delta, zrange[1]+delta];
	//console.log(zrange2);
	//project.activeLayer.removeChildren();


	changeCoeffs();

	drawZRange(zrange[0], zrange[1]);
}



function onResize(event) {
	project.activeLayer.position = view.center;
}

var framecount = 0;
function onFrame(event) {
    //console.log(framecount);
	if (framecount % Globals.frameInterval !== 0) return;
	Globals.animationFrame = framecount/Globals.frameInterval;
	zMove2(Globals.animationFrame);
    framecount++;
}

//window.requestAnimationFrame(framefunc);
