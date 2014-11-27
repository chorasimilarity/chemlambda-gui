// based on http://bl.ocks.org/mbostock/3037015

function  moleculewithtricks(filee){



var width = 900,
    height = 600;


var radius = d3.scale.sqrt()
    .range([0, 4]);

var svg = d3.select("body").append("svg:svg")
    .attr("width", width)
    .attr("id", "gugu")
    .attr("height", height);


var force = d3.layout.force()
    .size([width, height])
    .charge(-10)
    .gravity(.05)
    .linkDistance(function(d) { return ((radius(d.source.size) + radius(d.target.size) + 3)/(1000*d.bond)); });
//     .linkDistance(1);


d3.json(filee, function(graph) {
  force
      .nodes(graph.nodes)
      .links(graph.links)
      .on("tick", tick)
      .start();

  var link = svg.selectAll(".link")
      .data(graph.links)
    .enter().append("g")
      .attr("class", "link");


  link.append("line")
      .style("stroke-width", function(d) { return (d.bond * 2 - 1) * 2 + "px"; });


  link.filter(function(d) { return d.bond > 1; }).append("line")
      .attr("class", "separator");


  var node = svg.selectAll(".node")
      .data(graph.nodes)
    .enter().append("g")
      .attr("class", "node")
      .call(force.drag);

node.on("dblclick", function(d) { d.fixed = false; });

node.on("mousedown", function(d) { d.fixed = true; });



  node.append("circle")
      .attr("r", function(d) { return radius(d.size); })
      .style("fill", function(d) { return d.colour; });



// un-comment the next 4 lines to have the ports and nodes names in the graph

//  node.append("text")
//      .attr("dy", ".35em")
//      .attr("text-anchor", "middle")
//      .text(function(d) { return d.atom; });

  function tick() {
    link.selectAll("line")
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });




    node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  }
});
}

