var cvals = [-1.1, -1.3, -1.38, -1.395, -1.755, -2, -3];
var DARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);
var LIGHT_GREY = new Color(0.8, 0.8, 0.8, 0.5);

CARTESIAN = new Matrix(200,0,0,-10,view.center.x,view.center.y);

console.log((new Complex(3,2)).multiply(new Complex(3,2)));
console.log(project);
var l1 = new Layer();
// project.addLayer(l1);
l1.transform(CARTESIAN);
var l2 = new Layer();
//project.addLayer(l2);
l2.activate();


var xAxis = new Path({
    strokeWidth: 1,
    strokeColor: LIGHT_GREY
});
xAxis.add(new Point(-100,0));
xAxis.add(new Point(100,0));
var yAxis = new Path({
    strokeWidth: 1,
    strokeColor: LIGHT_GREY
});
yAxis.add(new Point(0,-100));
yAxis.add(new Point(0,100));

var func = function(cval) {
	return function(x) {
		return Math.pow(x, 2) + cval;
	}
}

function labelPoint(point) {
    var text1 = new PointText({
        point: new Point(point.x,-1.5).transform(CARTESIAN),
        justification: 'center',
        content: point.y.toString().substr(0,4),
        fillColor: 'black',
        fontFamily: 'Courier New',
        fontSize: 10
    });
    var text2 = new PointText({
        point: new Point(point.x,1.5).transform(CARTESIAN),
        justification: 'center',
        content: point.x.toString().substr(0,4),
        fillColor: 'black',
        fontFamily: 'Courier New',
        fontSize: 10
    });
    l1.addChild(text2);
    l1.addChild(text1);
    return text1;
}

var func0 = func(cvals[3]);
var xrange = [-2,2];
var domain = numeric.linspace(xrange[0], xrange[1], 20);
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
var labels = [];
_.each(points, function(point) {
	path.add(point);
    var label = labelPoint(point);
    labels.push(label);
})

function iterate() {
	codomain = codomain.map(function(x) {
		var fx = func0(x);
        if (fx > 1000) return 1000;
        if (fx < -1000) return -1000;
        return fx;
	});
	var points = _.zip(domain, codomain).map(function(p) {
		return new Point(p);
	});
	_.each(_.range(points.length), function(i) {
		path.segments[i].point = points[i].transform(CARTESIAN);
        labels[i].content = points[i].y.toString().substr(0,4);
	});
	path.smooth();
}

window.setInterval(function() {
    iterate();
}, 500);

view.onFrame = function(event) {
    if (event.count % 200 == 0) iterate();
}

project.activeLayer.transform(CARTESIAN);
