
var cvals = [-1.1, -1.3, -1.38, -1.395, -1.755, -2, -3];

var DARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);
var LIGHT_GREY = new Color(0.8, 0.8, 0.8, 0.5);
var C = cvals[1];

var x1range = [-1.4,1.4];
var x2range = [-0.5,0.5];

var PRECISION = 50;
var ITERATIONS = 10;

var x1space = numeric.linspace(x1range[0], x1range[1], PRECISION);
var x2space = numeric.linspace(x2range[0], x2range[1], PRECISION);

CARTESIAN = new Matrix(view.size.width/(x1range[1]-x1range[0]),0,0,
    view.size.height/-(x2range[1]-x2range[0]),view.center.x,view.center.y);

var l1 = new Layer();
l1.transform(CARTESIAN);

var l2 = new Layer();
l2.activate();

function flattenOne(list) {
    return _.reduce(list, function(a,b) {
        return a.concat(b);
    }, []);
}

function cartesianProductGrid(set1, set2) {
	return _.map(set1, function(el1) {
		return _.map(set2, function(el2) {
			return [el1, el2];
		})
	});
}

function cartesianProduct(set1, set2) {
	return flattenOne(cartesianProductGrid(set1, set2));
}

var func = function(z) {
	return (z.pow(2)).add(C);
}

function calculateAtPoint(point) {
    var z = new Complex(point.x, point.y);
    var i=0;
    while (i<ITERATIONS) {
        z = func(z);
        i++;
    }
    var val = z.magnitude();
    return val > 20 ? Infinity : val;
}

function colorPoint(point, value) {
    var color = new Color({hue:360 * value/2, saturation:1, brightness:1});
    var rect = new Path.Rectangle(point, new Size((x1range[1]-x1range[0])/PRECISION,
        (x2range[1]-x2range[0])/PRECISION));
    rect.fillColor = color;
    rect.transform(CARTESIAN);
}

var points = _.map(cartesianProduct(x1space, x2space), function(p) { return new Point(p); });



_.each(points, function(point) {
    var val = calculateAtPoint(point);
    if (val < 10) colorPoint(point, val);
})

view.onFrame = function(event) {

}

function onMouseMove(event) {
  mouseVector = view.center - event.point;
}

function onClick(event) {
    console.log(event);
}
