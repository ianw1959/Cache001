/// Created using the page template: Column 2
Class IBW.ChartHome Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "IBW.Chart";

/// Displayed name of this page.
Parameter PAGENAME = "Homepage";

/// Domain used for localization.
Parameter DOMAIN;

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
/* style for title bar */
#title {
	background: #C5D6D6;
	color: black;
	font-family: Verdana;
	font-size: 1.5em;
	font-weight: bold;
	padding: 5px;
	border-bottom: 1px solid black;
	text-align: center;
}
 
/* group on left-hand side */
#groupLeft {
	border-right: 1px solid black;
	background: #E0E0FF;
	height: 600px;
	width: 300px;
	overflow: auto;
}
 
/* group on right-hand side */
#groupRight {
	border-right: 1px solid black;
	background: #E0FFE0;
	height: 600px;
	overflow: auto;
}
    #mynetwork {
      width: 100%;
      height: 600px;
      border: 1px solid lightgray;
    }
    p {
      max-width:600px;
    } 
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Homepage">
<html id="title">Charting Home Page</html>
<hgroup id="hgroup" width="100%">
<vgroup id="groupLeft" width="10%">
<!-- put contents of left column here -->
<html>Menu will go here</html>
</vgroup>
<vgroup id="groupRight" width="90%">
<!-- put contents of right column here -->
<html>Main
  <script type="text/javascript" src="./vis/dist/vis.js"></script>
  <link href="./vis/dist/vis-network.min.css" rel="stylesheet" type="text/css"></link>
  <div id="mynetwork" width="100%" height="100%"></div>
<script type="text/javascript">
  // create an array with nodes
  var nodes = [
    {id: 1, label: 'Owner\nPerson\nIan B Wood', shape: 'box', color: 'pink'},
    {id: 2, label: 'Case\nIan B Wood\nCo 1 Case', shape: 'box', color: 'lightblue'},
    {id: 3, label: 'Fund\nIan B Wood\nMain Co 1', shape: 'box', color: 'lightgreen'},
    {id: 4, label: 'Fund\nIan B Wood\nISA', shape: 'box', color: 'lightgreen'},
    {id: 5, label: 'Linked Person\nLiverpool Compliance', shape: 'box', color: 'yellow'},
    {id: 6, label: 'Linked Person\nVision IFA', shape: 'box', color: 'yellow'},
    {id: 11, label: 'Client\nIan B Wood', shape: 'box', color: 'pink'},
    {id: 12, label: 'Portfolio\nIan B Wood', shape: 'box', color: 'lightblue'},
    {id: 13, label: 'SubPortfolio\nMain Co 1', shape: 'box', color: 'lightgreen'},
    {id: 14, label: 'SubPortfolio\nISA', shape: 'box', color: 'lightgreen'},
    {id: 15, label: 'Contact\nIan B Wood', shape: 'box', color: 'yellow'},
    {id: 16, label: 'Linked Person\nLiverpool Compliance', shape: 'box', color: 'yellow'},
    {id: 17, label: 'Linked Person\nVision IFA', shape: 'box', color: 'yellow'}
];

  nodes[0]["level"] = 0;
  nodes[1]["level"] = 1;
  nodes[2]["level"] = 2;
  nodes[3]["level"] = 2;
  nodes[4]["level"] = 3;
  nodes[5]["level"] = 3;

  nodes[6]["level"] = 0;
  nodes[7]["level"] = 1;
  nodes[8]["level"] = 2;
  nodes[9]["level"] = 2;
  nodes[10]["level"] = 1;
  nodes[11]["level"] = 3;
  nodes[12]["level"] = 3;

  // create an array with edges
  var edges = [
    {from: 1, to: 2, label: 'RWO'},
    {from: 1, to: 3, label: 'Owner'},
    {from: 1, to: 4, label: 'Owner'},
    {from: 2, to: 3},
    {from: 2, to: 4},
    {from: 6, to: 3, label: 'Advisor'},
    {from: 6, to: 4, label: 'Advisor'},
    {from: 5, to: 3},
    {from: 5, to: 4},
    {from: 11, to: 12},
    {from: 12, to: 13},
    {from: 12, to: 14},
    {from: 15, to: 12},
    {from: 16, to: 13},
    {from: 16, to: 14},
    {from: 17, to: 13, label: 'Advisor'},
    {from: 17, to: 14, label: 'Advisor'}
];

  // create a network
  var container = document.getElementById('mynetwork');
  var data = {
    nodes: nodes,
    edges: edges
  };
  var options = {
  	layout: {hierarchical: {direction: "UD"}},
  	edges:  {smooth: true, arrows: {to : true }}
  };
  var network = new vis.Network(container, data, options);
</script>
</html>
</vgroup>
</hgroup>
</page>
}

/// This method is called when this page is resized.
/// In response to a resize, we use JavaScript to dynamically
/// resize the 2 main groups on this page.
/// You can modify this method to meet your needs.
ClientMethod onlayoutHandler(load) [ Language = javascript ]
{
	// find enclosing div for the title (if present) and get its height
	var title = zenPage.getComponentById('title');
	var divTitle = title ? title.getEnclosingDiv() : null;
	var hgtTitle = divTitle ? parseInt(divTitle.offsetHeight) : 0;
	// find the enclosing divs for the 2 groups
	var groupLeft = zenPage.getComponentById('groupLeft');
	var groupRight = zenPage.getComponentById('groupRight');
	var divgroupLeft = groupLeft ? groupLeft.getEnclosingDiv() : null;
	var divgroupRight = groupRight ? groupRight.getEnclosingDiv() : null;
	// find height of window
	var winHeight = zenGetWindowHeight();
	var winWidth = zenGetWindowWidth();
	// adjust the size of groups
	var widLeft = divgroupLeft ? parseInt(divgroupLeft.offsetWidth) : 0;
	var widRight = winWidth - widLeft;
	var hgt = winHeight - hgtTitle - 20;
	if (divgroupLeft) {
		divgroupLeft.style.height = hgt + 'px';
	}
	if (divgroupRight) {
		divgroupRight.style.height = hgt + 'px';
		divgroupRight.style.width = widRight + 'px';
	}
}

}
