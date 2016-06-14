
var cvals = [-1.1, -1.3, -1.38, -1.395, -1.755, -2, -3];
var DARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);
CARTESIAN = new Matrix(100,0,0,-10,view.center.x,view.center.y);

var func = function(cval) {
	return function(x) {
		return Math.pow(x, 2) + cval;
	}
}

var func0 = func(cvals[0]);
var xrange = [-5,5];
var domain = numeric.linspace(xrange[0], xrange[1], 25);
var codomain = domain.map(function(x) {
	return func0(x);
});

var points = _.zip(domain, codomain).map(function(p) {
	return new Point(p);
});
var path = new Path({
	strokeWidth: 1,
	strokeColor: DARK_GREY
});
_.each(points, function(point) {
	path.add(point);
})

function iterate() {
	codomain = codomain.map(function(x) {
		return func0(x);
	});
	var points = _.zip(domain, codomain).map(function(p) {
		return new Point(p);
	});
	_.each(_.range(points.length), function(i) {
		path.segments[i].point = points[i].transform(CARTESIAN);
	});
	path.smooth();
}

setInterval(iterate, 500);

project.activeLayer.transform(CARTESIAN);
