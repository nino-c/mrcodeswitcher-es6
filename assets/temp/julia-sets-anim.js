
var cvals = [-1.1, -1.3, -1.38, -1.395, -1.755, -2, -3];

var DARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);
var LIGHT_GREY = new Color(0.8, 0.8, 0.8, 0.5);
var C = cvals[3];



var PRECISION = 60;
var ITERATIONS = 8;


var clarityIndex = 1;

var xrange, yrange, xspace, yspace, radiusX, radiusY;


var initXrange = [-0.8,0.8]; xrange = initXrange;
var initYrange = [-0.25,0.25]; yrange = initYrange;

var initRadiusX = initXrange[1] - initXrange[0]; radiusX = initRadiusX;
var initRadiusY = initYrange[1] - initYrange[0]; radiusY = initRadiusY;

var CARTESIAN = new Matrix(view.size.width/((xrange[1]-xrange[0])/1),0,0,
    view.size.height/-((yrange[1]-yrange[0])/1),view.center.x, view.center.y);


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

function transposeArray(arr) {
    return _.zip.apply(_, arr);
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
    return val > 10 ? Infinity : val;
}


var rects = [];
function colorPoint(point, value) {
    var color = new Color({hue:360 * (value/2), saturation:1, brightness:1});
    var rect = new Path.Rectangle({
        center: point,
        size: new Size(
            (xrange[1]-xrange[0])/(PRECISION*clarityIndex),
            (yrange[1]-yrange[0])/(PRECISION*clarityIndex)
        )
    })

    rect.fillColor = color;
    //console.log(rect);
    //rect.fillAlpha = 0.6;
    rect.strokeWidth = 0;
    rect.originalCoords = [point.x, point.y];
    rect.transform(CARTESIAN);
    rects.push(rect);
    return rect;
}

var cellsGrid = [];

function drawInRect(_xrange, _yrange, _clarityIndex) {

    xrange = _xrange; yrange = _yrange; clarityIndex = _clarityIndex;
    xspace = numeric.linspace(xrange[0], xrange[1], PRECISION*_clarityIndex);
    yspace = numeric.linspace(yrange[0], yrange[1], PRECISION*_clarityIndex);

    CARTESIAN = new Matrix(
        view.size.width/((xrange[1]-xrange[0])/1),0,0,
            view.size.height/-((yrange[1]-yrange[0])/1),
        // (xrange[1]-xrange[0]),
        // (yrange[1]-yrange[0])
        view.center.x, view.center.y
    );

    clearRects();

    cellsGrid = _.map(cartesianProductGrid(xspace, yspace), function(row) {
        return _.map(row, function(p) {
            var point = new Point(p);
            var val = calculateAtPoint(point);
            if (val < 10) { return colorPoint(point, val); } else { return null; }
        })
    });
    //console.log('cellsGrid', cellsGrid);

}



function getBoundaryPoint(colIndex) {
    var index = transposeArray(cellsGrid).length-1;
    var returnCell = null;
    while (index >= 0) {
        _.each(transposeArray(cellsGrid)[colIndex], function(cell) {
            if (cell != null) {
                returnCell = cell;
                return;
            }
        });
        index--;
    }
    return returnCell;
}

function clearRects() {

    if (rects.length > 0) {
        _.each(rects.reverse(), function(rect) { rect.remove(); });
    }
    rects = [];
}

var ZOOM_FACTOR = 1;


function iterateZoom(iteration) {

    ZOOM_FACTOR = 1;// - (1/Math.pow((iteration+4),2));
    C = -1.9 + (Math.pow(Math.sin(iteration/60), 2))*0.5;

    distX[0] *= ZOOM_FACTOR;
    distX[1] *= ZOOM_FACTOR;
    distY[0] *= ZOOM_FACTOR;
    distY[1] *= ZOOM_FACTOR;

    xrange[0] = bpoint.originalCoords[0] - distX[0];
    xrange[1] = bpoint.originalCoords[0] + distX[1];
    yrange[0] = bpoint.originalCoords[1] - distY[0];
    yrange[1] = bpoint.originalCoords[1] + distY[1];

    drawInRect(
        xrange,
        yrange,
        2
        // (center[0] - w/2),
        // (center[1] - h/2),
        // (center[0] + w/2),
        // (center[1] + h/2)
    )

}



drawInRect(xrange, yrange, 2);

var bpoint = getBoundaryPoint(  Math.floor(cellsGrid.length*(3/4))  );
var distX = [
    (bpoint.originalCoords[0] - xrange[0]),
    (xrange[1] - bpoint.originalCoords[0])
];
var distY = [
    (bpoint.originalCoords[1] - yrange[0]),
    (yrange[1] - bpoint.originalCoords[1])
];
console.log('dist', distX, distY);

var N=2;

view.onFrame = function(event) {
    // console.log('frame', event, cellsGrid);
    // if (cellsGrid) {
    //     var bpoint = getBoundaryPoint(cellsGrid.length-15);
    //     console.log('boundary point');
    //     zoomPoint(bpoint.originalCoords);
    // }

    if (cellsGrid) {
        iterateZoom(event.count);
    } else console.log('NO cellsGrid');

    if (clarityIndex < N) {
        //drawInRect(xrange, yrange, clarityIndex);
        clarityIndex++;
    }

    if (clarityIndex == N) {

        //////// shift
        // move toward upper-right always
        //xrange = [xrange[0]*ZOOM_FACTOR, xrange[1]*ZOOM_FACTOR];
        //clarityIndex = 0;
    }
}
