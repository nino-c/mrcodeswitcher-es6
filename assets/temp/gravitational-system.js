var l1 = new Layer();
l1.activate();

var primes = [2,2,2,2,2];
//var objects = [[2,[100,100]],[3,[200,5]],[5,[300,500]],[7,[600,360]]];
var objects = _.map(primes, function(p) {
    return [p, Point.random()*view.size];
})
var masses = _.map(objects, function(obj) {

    var color = new Color({hue: Math.random()*360, saturation:1, brightness: 1});
    return new Path.Circle({
        center: new Point(obj[1]),
        radius: obj[0]*5,
        mass: obj[0],
        velocity: new Point(0,0),
        acceleration: 0,
        fillColor: color
    });
});
//masses[masses.length-1].mass *= 100;

_.each(masses, function(m) { l1.addChild(m); });

function computeForces() {

    _.each(masses, function(m1) {
        var forces = _.map(masses, function(m2) {
            //console.log(m2.position);
            if (m1 == m2) return new Point(0,0);
            var magnitude = (m1.mass * m2.mass * 10000) /
                (Math.pow((m2.position - m1.position).length, 3));
            return (m2.position - m1.position).normalize() * magnitude;
        });

        var force = _.reduce(forces, function(a,b) { return a+b }, new Point(0,0));
        m1.acceleration = force / m1.mass;
    });

    // check for collisions
    _.each(masses, function(m1) {
        if (m1.mass == 0) {
            console.log('0 mass', m1);
        }
        _.each(masses, function(m2) {
            if (m1 == m2) { return; }
            if (m1.intersects(m2)) {
                console.log('COLLISION');




                m1.momentum = m1.mass * m1.velocity;
                m2.momentum = m2.mass * m2.velocity;
                var combinedMass = m1.mass + m2.mass;
                var combinedMomentum = m1.momentum + m2.momentum;
                m1.velocity = combinedMomentum / combinedMass;
                m1.scale(combinedMass/m1.mass)
                m1.mass = combinedMass;
                m2.mass = 0;


            }
        })
    });

    // remove swallowed bodies
    _.each(masses, function(m) {
        if (m.mass == 0) {
            console.log('removing 0 mass', m);
            masses = _.pull(masses, m);
        }
    });

    console.log('length masses', masses.length);
}

function move() {
    _.each(masses, function(m) {
        m.velocity += m.acceleration;
        m.position += m.velocity;

    })
}

view.onFrame = function(event) {
    computeForces();
    move();
}
