var baseUrl = "http://221.122.119.63:15555", eventFlag = false, lnglatlabel=null, drawOverlays = {lines:[], polygons:[], points:[]},popup=null,disflag={flag:false, pointColor: '#000', lineColor: '#000', layers: [], disLabels: []},areaflag={flag:false, pointColor: '#000', fillColor: "#000", outLineColor: "#000", layers: [],  areaLabel: null, areaLabels: []},drawPointFlag=false, geojson, linestring, drawNum = 0,isDragging, dragMarker,lastSeqID=0,polylines=[],polygons=[],sectors=[],localMarkers=[];
//地图操作密钥（必填项）
vmapx.accessToken = 'pk.eyJ1Ijoic3BpZGVyejciLCJhIjoiY2lxYXBweWQwMDJhaWZubTFhOW1hNmJraCJ9.NUgEOOc-qxaL52ghK2ic4Q';
var start = [120.3812143, 36.2667893];
var end = [114.288959, 30.560116];
//2.5D地图初始化
var mapbounds = [
    [120.37997,36.266539], // Southwest coordinates
    [120.38271, 36.26705]  // Northeast coordinates
];
var map = window.map = new vmapx.Map({
	container: 'map',
	zoom: 21,
	center: start,
	style: baseUrl+'/vmapx/day',
	hash: true,
	pitch: 60, // 倾斜度
    bearing: 0, // 旋转度
	minZoom: 19//, //设置地图最小级别
	//maxBounds: mapbounds // 设置地图显示范围，拖拽无法超出范围
}); 

/**
 * 
 * 2D地图初始化
 * 
 */
/*var map2;

function initMap(){
	
	map2=new MQ.Map("map2", {
		zoom:17,//初始化级别
		minZoom:15,//最小地图级别
		center:new MQ.LngLat(120.388092,36.266694),//中心点坐标
	});
	 map2.addEventListener(MQ.Constants.ZOOM_END, toggleZoomend, map2);
	 //设置地图范围
	 map2.setLimitBounds(new MQ.LngLatBounds(new MQ.LngLat(120.34715, 36.23329), new MQ.LngLat(120.426801, 36.291389)))
	 toggleAddMarker();
}

var marker2;
//2D地图  添加点标记，并使用自己的icon

function toggleAddMarker() {
	if(map2){
		var opts=new MQ.MarkerOptions();
		opts.anchor = MQ.Constants.BOTTOM_CENTER;
		opts.icon=new MQ.Icon("/qdsodb/img/gis/map/anjiantongd.png",{"size":new MQ.Size(37, 35)});
		var lnglat=new MQ.LngLat(120.388118,36.266642);
		if(lnglat){
			marker2=new MQ.Marker(lnglat, opts);
			map2.getOverlayLayer().addOverlay(marker2, true);
		}
		marker2.addEventListener(MQ.Constants.CLICK,function markerClick(){
			$("#map").show();
			$("#map2").hide();
			map.setZoom(21);
			$("#changeAddress").text("国际安检中心");
			map.setCenter(start);
			map.resize();
		}, marker2);
		marker2.openInfoWindow('<div style="padding:10px 0px 0px 4px;font-weight: bold;">国际安检通道</div>',{"size":new MQ.Size(90,70),"offset":new MQ.Pixel(-5,-35),visible:true});
	}
}
*/



function toggleZoomend(event) {
	if(event.zoom > 17){
		$("#map").show();
		$("#map2").hide();
		map.resize();
		if ($("#changeAddress").length > 0){
			$("#changeAddress").text("国际安检中心");
		}
	}
}
//initMap();

//创建一个唯一的标识
function createUniqueID(){
	lastSeqID += 1;
	return lastSeqID;
}

//鼠标取点应用
addEvent("mousemove", function(e) {
	
	/*//通过事件获取经纬度坐标
	var lnglat = e.lngLat.lng+", "+e.lngLat.lat;
	//创建显示DOM
	labeldom = getLabelDom(lnglat, true);
	if (lnglatlabel)
	{
		//已经存在则直接修改坐标位置
		//lnglatlabel.setLngLat(e.lngLat);
		lnglatlabel.remove();
	} 
	//未存在则创建新label对象
	lnglatlabel = new vmapx.Marker(labeldom, {offset: new vmapx.Point(135, 10)})
		.setLngLat(e.lngLat)
		.addTo(map);*/
	
	
	var features = map.queryRenderedFeatures(e.point);
	for (var i = 0; i < features.length; i++)
	{
		var f = features[i];
		var p = f.properties;
		if (p)
		{
			var content = "";
			if (p.KIND == "SCANBOX")
			{
				content = "<strong>安检机</strong>";
			} 
			/*else if (p.KIND == "CHAIR")
			{
				content = "<strong>椅子</strong>";
			} */
			else if (p.KIND == "TRANSFORM")
			{
				content = "<strong>安检机传送带</strong>";
			} else if (p.KIND == "TABLE1")
			{
				content = "<strong>验证柜台</strong>";
			} else if (p.KIND == "TBALE2")
			{
				content = "<strong>开包台</strong>";
			} else if (p.KIND == "DOOR")
			{
				content = "<strong>安全门</strong>";
			}
			if (content)
			{
				addPopup(content, e.lngLat);
			}
		}
	}
});

//画覆盖物工具实例
var draw = new MapboxDraw({
	displayControlsDefault: false,
	controls: {
		polygon: false,
		trash: false
	}
});
//78map.addControl(new vmapx.NavigationControl());
map.addControl(draw);

function createGeojson(){
	var geojson = {
		"type": "FeatureCollection",
		"features": []
	};
	return geojson;
}


function createLineJson() {
	var linestring = {
		"type": "Feature",
		"geometry": {
			"type": "LineString",
			"coordinates": []
		}
	};
	return linestring;
}

function createPolygonJson() {
	var polygon = {
		"type": "Feature",
        "geometry": {
			"type": "Polygon",
            "coordinates": []
		}
	}
	return polygon;
}

//add 2.5d layer
function add25DLayer(lid, fname) {
	if (typeof(sfilter)=="undefined")
		sfilter = ['all'];
	if (!map.getLayer(lid)) {
		map.addLayer({
			'id': lid,
			'type': 'fill-extrusion',
			'source': {
				'type': 'geojson',
				'data': '/qdsodb/js/airport/' + fname + '.geojson'
			 },
			 'filter': sfilter,
			 'label': 'id',
			'paint': {
				'fill-extrusion-color': {
                'property': 'color',
                'type': 'identity'
            },
            'fill-extrusion-height': {
                'property': 'HEIGHT',
                'type': 'identity'
            },
            'fill-extrusion-base': {
                'property': 'base_height',
                'type': 'identity'
            },
            'fill-extrusion-opacity': 1
        }
		});
	}
}

//add 2d layer
function add2DLayer(lid, fname, scolor, sfilter) {
	if (typeof(sfilter)=="undefined")
		sfilter = ['all'];
	if (map.getLayer(lid))
		return;
	map.addLayer({
		'id': lid,
		'type': 'fill',
		'source': {
			'type': 'geojson',
			'data': '/qdsodb/js/airport/' + fname + '.geojson'
		},
		'filter': sfilter,
		'paint': {
			'fill-color': scolor,
		}
	});
}

//add all of layers
function addLayers() {
	//add channel background
	add2DLayer('background21','BACKGROUND2','#C9CBBB', ['in','id',1,3,5,7,9]);
	add2DLayer('background22','BACKGROUND2','#A3B5BB', ['in','id',2,4,6,8]);
	add2DLayer('background23','BACKGROUND2','#5E8578', ['==','id',0]);
	
	add25DLayer('security-rectangle-TABLE2','all');
	
	
	//table1 layer 验证柜台
	/*add25DLayer('security-region','SECURET1','#ccffff',1,["==","KIND", "TABLE1"]);
                        
    //table2 layer 开包台
	add25DLayer('security-rectangle-TABLE2','SECURET3','#7E8950',0.8,["==","KIND", "TBALE2"]);
	
	//chair layer 椅子
	add25DLayer('security-rectangle-CHAIR','SECURET3','#7E8950',0.8,["==","KIND", "CHAIR"]);

	//door layer				
	//add25DLayer('security-rectangle-DOOR','SECURET3','#c0c0c0',1,["==","KIND", "DOOR"]);
	//add25DLayer('security-rectangle-DOORIN','SECURET3','#ccffff',0.5,["==","KIND", "DOORIN"]);

    //transform layer 安检机-长条
	add25DLayer('security-rectangle-TRANSFORM','SECURET3','#1F262E',1,["==","KIND", "TRANSFORM"]);
                
	//scanbox layer 安检机-机台
	add25DLayer('security-rectangle-SCANBOX','SECURET3','#E6EEF1',0.8,["==","KIND", "SCANBOX"]);

	//pillar layer 柱子
	add25DLayer('wall-ellipse','WALL_ellipse','#C0C0C0',1);

	//wall layer 通道隔断墙
	add25DLayer('wall-polyline','WALL_polyline','#3068AB',1);*/
}

function addPopup(content, lnglat) {
	removePopup();
	popup = new vmapx.Popup({
		offset : new vmapx.Point(-5, -20)	
	})
	.setLngLat(lnglat)
	.setHTML(content)
	.addTo(map);
}
function removePopup() {
	if (popup)
	{
		popup.remove();
		popup = null;
	}
}

//add marker
function addMarker(lngLat,imageUrl,iwidth,iheigh,isdrag) {
	var el = document.createElement('div');
	el.id = createUniqueID();
	el.className = 'marker';
	el.style.backgroundImage = 'url(' + imageUrl + ')';
	el.style.position = 'absolute';
	el.style.width = iwidth;
	el.style.height = iheigh;

	var marker = new vmapx.Marker(el)
		.setLngLat([lngLat.lng, lngLat.lat])
		.addTo(map);

	el.addEventListener('click', function(e) {
		if (marker)
		{
			if (e && e.stopPropagation)  
				e.stopPropagation();
			else 
				window.event.cancelBubble=true;
					
			var content = "<strong>Marker LngLat</strong><p>lnglat："+marker.getLngLat()+"</p>"
			if (popup)
			{
				popup.remove();
				popup = null;
			}
			popup = new vmapx.Popup({
				offset : new vmapx.Point(-5, -20)	
			})
			.setLngLat(marker.getLngLat())
			.setHTML(content)
			.addTo(map);
		}
	}, false);

	if (isdrag)
	{
		el.addEventListener('mousedown', mouseDown);
	}

	function mouseDown() {
		isDragging = true;

		// Mouse events
		addEvent('mousemove', onMove);
		el.addEventListener('mouseup', onUp);
		map.dragPan.disable();
	}

	function onMove(e) {
		if (!isDragging) return;
		var coords = e.lngLat;
		
		var overlayId = e.originalEvent.srcElement.id;
		for (var i = 0; drawOverlays.points.length; i++)
		{
			if (drawOverlays.points[i].getElement().id == overlayId)
			{
				var marker = drawOverlays.points[i];
				marker.setLngLat(coords);
			}
		}
	}

	function onUp(e) {
		map.dragPan.enable();
		if (!isDragging) return;
		isDragging = false;
		offEvent('mousemove', onMove);
		el.removeEventListener('mouseup', this);
		
	}
	return marker;
}


//安检通道标记
function markerIcon(lngLat,imageUrl,iwidth,iheigh,isdrag) {
	var el = document.createElement('div');
	el.id = createUniqueID();
	el.className = 'marker';
	el.style.backgroundImage = 'url(' + imageUrl + ')';
	el.style.position = 'absolute';
	el.style.width = iwidth;
	el.style.height = iheigh;
	
	var marker = new vmapx.Marker(el)
		.setLngLat([lngLat.lng, lngLat.lat])
		.addTo(map);

	el.addEventListener('mouseover', function(e) {
		if (marker)
		{
			if (e && e.stopPropagation)  
				e.stopPropagation();
			else 
				window.event.cancelBubble=true;
					
			if (popup)
			{
				popup.remove();
				popup = null;
			}
			popup = new vmapx.Popup({
				offset : new vmapx.Point(-5, -20)	
			})
			.setLngLat(marker.getLngLat())
			.addTo(map);
		}
	}, false);
	
	if (isdrag)
	{
		el.addEventListener('mousedown', mouseDown);
	}

	function mouseDown() {
		isDragging = true;

		// Mouse events
		addEvent('mousemove', onMove);
		el.addEventListener('mouseup', onUp);
		map.dragPan.disable();
	}

	function onMove(e) {
		if (!isDragging) return;
		var coords = e.lngLat;
		
		var overlayId = e.originalEvent.srcElement.id;
		for (var i = 0; drawOverlays.points.length; i++)
		{
			if (drawOverlays.points[i].getElement().id == overlayId)
			{
				var marker = drawOverlays.points[i];
				marker.setLngLat(coords);
			}
		}
	}

	function onUp(e) {
		map.dragPan.enable();
		if (!isDragging) return;
		isDragging = false;
		offEvent('mousemove', onMove);
		el.removeEventListener('mouseup', this);
		
	}
	return marker;
}




/**
 * param path:坐标组 [[lng, lat], [lng, lat], [lng, lat]……]
 * param options:样式对象，其中包含color:颜色；width:宽度
 * param fitBounds:是否自适应到地图
 **/
function addPolyline(path, options, fitBounds) {
	if (!options)
	{
		options = {
			color: "blue",
			width: "5"
		}
	}
	var id = "polyline"+createUniqueID()
	polylines.push(id);
	map.addLayer({
        "id": id,
        "type": "line",
        "source": {
            "type": "geojson",
            "data": {
                "type": "Feature",
                "properties": {},
                "geometry": {
                    "type": "LineString",
                    "coordinates": path
                }
            }
        },
        "layout": {
            "line-join": "round",
            "line-cap": "round"
        },
        "paint": {
            "line-color": options.color || "blue",
            "line-width": options.width || 5
        }
    });
	if (fitBounds)
	{
		var bounds = path.reduce(function(bounds, coord) {
			return bounds.extend(coord);
		}, new vmapx.LngLatBounds(path[0], path[0]));

		map.fitBounds(bounds, {
			padding: 20
		});
	}
}

function removePolylines() {
	for (var i=0; i < polylines.length; i++)
	{
		map.removeLayer(polylines[i]);
	}
	polylines = [];
}

/**
 * 
 * param path:坐标组 [[lng, lat], [lng, lat], [lng, lat]……]
 * param options:样式对象，其中包含color:颜色；width:宽度
 * param fitBounds:是否自适应到地图
 **/
function addPolygon(path, options, fitBounds) {
	if (!options)
	{
		options = {
			color: "blue",
			opacity: 0.5
		}
	}
	var id = "polygon"+createUniqueID();
	polygons.push(id);
	map.addLayer({
        'id': id,
        'type': 'fill',
        'source': {
            'type': 'geojson',
            'data': {
                'type': 'Feature',
                'geometry': {
                    'type': 'Polygon',
                    'coordinates': path
                }
            }
        },
        'layout': {},
        'paint': {
            'fill-color': options.color,
            'fill-opacity': options.opacity
        }
    });
	if (fitBounds)
	{

		var bounds = path[0].reduce(function(bounds, coord) {
			return bounds.extend(coord);
		}, new vmapx.LngLatBounds(path[0][0], path[0][0]));

		map.fitBounds(bounds, {
			padding: 20
		});
	}
}

function removePolygons() {
	for (var i=0; i < polygons.length; i++)
	{
		map.removeLayer(polygons[i]);
	}
	polygons = [];
}


//获取标签元素
function getLabelDom(content, isBorder, isRadius) {
	var el = document.createElement('div');
	el.style.position = 'absolute';
	el.style.fontSize = '12px';
	el.style.height = 'auto';
	el.style.color = "#333333";
	el.style.textShadow = "0px 1px 1px #FFFFFF,2px 1px 1px #FFFFFF";
	if (isBorder)
	{
		el.style.border = "1px solid #000000";
		el.style.backgroundColor = "#ffffff";
		if (isRadius)
		{
			el.style.border = "1px solid #ffffff";
			el.style.borderRadius = "100%";
			el.style.textAlign = "center";
			el.style.backgroundColor = "#f99450";
			el.style.color = "#ffffff";
			el.style.textShadow = "0px 1px 1px #000000";
		}
		
	}
							
	if(content) {
		if (content.length == 3)
		{
			el.style.width = '37px';
		} else if (content.length == 4) {
			el.style.width = '49px';
		} 
		else if (content.length == 6) {
			el.style.width = '49px';
		} 
		else {
			if (isRadius)
			{
				el.style.width = "25px";
			} else {
				el.style.width = 'auto';
			}
		}
		el.innerHTML = content;
	}
	return el;
}

//获取标签元素    国际安检通道标签
function anjianLabel(content, isRadius) {
	var el = document.createElement('div');
	el.style.position = 'absolute';
	el.style.fontSize = '45px';
	el.style.height = 'auto';
	el.style.color = "#67809f";
	el.style.marginTop = "-25px";
	el.style.marginLeft = "-120px";
	el.style.float = "left";
	el.style.textShadow = "0px 1px 1px #FFFFFF,2px 1px 1px #FFFFFF";
	/*if (isBorder)
	{
		el.style.border = "1px solid #000000";
		el.style.backgroundColor = "#ffffff";
		if (isRadius)
		{
			el.style.border = "1px solid #ffffff";
			el.style.borderRadius = "100%";
			el.style.textAlign = "center";
			el.style.backgroundColor = "#f99450";
			el.style.color = "#ffffff";
			el.style.textShadow = "0px 1px 1px #000000";
		}
		
	}*/
							
	if(content) {
		if (content.length == 3)
		{
			el.style.width = '37px';
		} else if (content.length == 4) {
			el.style.width = '49px';
		} 
		else {
			if (isRadius)
			{
				el.style.width = "20px";
			} else {
				el.style.width = 'auto';
			}
		}
		el.innerHTML = content;
	}
	return el;
}




//地图单击事件回调函数
function mapclickFun(e) {
	if (drawPointFlag)
	{
		var m = addMarker(e.lngLat,'/qdsodb/img/gis/tool/maker.png','17px','17px', true);
		drawPointFlag = false;
		drawOverlays.points.push(m);	
	} 
	
	if (disflag.flag || areaflag.flag)
	{
		var features = map.queryRenderedFeatures(e.point, { layers: ['measure-points'+drawNum] });

		if (geojson.features.length > 1) geojson.features.pop();

		if (features.length) {
			var id = features[0].properties.id;
			geojson.features = geojson.features.filter(function(point) {
				return point.properties.id !== id;
			});
		} else {
			var point = {
				"type": "Feature",
				"geometry": {
					"type": "Point",
					"coordinates": [
						e.lngLat.lng,
						e.lngLat.lat
					]
				},
				"properties": {
					"id": String(new Date().getTime())
				}
			};
			geojson.features.push(point);
		}
		
		if (geojson.features.length > 1) {
			if (disflag.flag)
			{
				linestring.geometry.coordinates = geojson.features.map(function(point) {
					return point.geometry.coordinates;
				});
			} else {
				var arr = []
				arr.push(geojson.features.map(
					function(point) {
						return point.geometry.coordinates
				}));
				linestring.geometry.coordinates = arr;
			}
			
			geojson.features.push(linestring);
			if (disflag.flag)
			{
				var dis = distanceByLngLat(linestring);
			
				var labellnglat = linestring.geometry.coordinates[linestring.geometry.coordinates.length-1];
				var disLabel = getLabelDom(dis>1000?(dis/1000).toFixed(2)+"公里":dis+"米", true);
				var disLabelObj = new vmapx.Marker(disLabel, {offset: new vmapx.Point(33, 0)})
					.setLngLat(labellnglat)
					.addTo(map);
				disflag.disLabels.push(disLabelObj);
			} else if (areaflag.flag)
			{
				var area = calculateArea(linestring.geometry.coordinates[0]);
				var areaLabelDom = getLabelDom(area<1?(area*1000000).toFixed(2)+"平方米":area.toFixed(2)+"平方公里", true);
				var labellnglat = linestring.geometry.coordinates[0][linestring.geometry.coordinates[0].length-1];
				if (areaflag.areaLabels.length > 0)
				{
					var oldlabel = areaflag.areaLabels[areaflag.areaLabels.length -1];
					if (oldlabel.id == "label"+drawNum)
					{
						oldlabel.remove();
						areaflag.areaLabels.pop();
					}
				}
					
				var areaLabel = new vmapx.Marker(areaLabelDom, {offset: new vmapx.Point(33, 0)})
					.setLngLat(labellnglat)
					.addTo(map);
				areaLabel.id = "label"+drawNum;
				areaflag.areaLabels.push(areaLabel);
				
			}
		}
		map.getSource('geojson'+drawNum).setData(geojson);
	}
}

//添加地图事件
function addEvent(type, callback) {
	map.on(type, callback);
}

//注销地图事件
function offEvent(eventType, callback){
	map.off(eventType, callback);
}

/**
 * 求两个经纬度之间的实地距离
 * @param lnglat1 {LngLat} 开始点
 * @param lnglat2 {LngLat} 结束点
 * @return {Number} 以米做单位的距离
 */
function distanceByLngLat(linestring) {
	var dis = 0, points = linestring.geometry.coordinates;
	for (var i = 0; i < points.length; i++)
	{
		var lnglat1 = points[i];
		var lnglat2 = points[i+1];
		if (lnglat2)
		{
			var c = lnglat1[1] * Math.PI / 180.0;
			var d = lnglat2[1] * Math.PI / 180.0;
			var a = c - d;
			var b = (lnglat1[0] - lnglat2[0]) * Math.PI / 180.0;
			var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
					+ Math.cos(c) * Math.cos(d) * Math.pow(Math.sin(b / 2), 2))) * 6378137.0;
			dis += s;
		}
	}
	
	return parseFloat(dis.toFixed(2));
}

/**
 * 计算面积
 * @param lnglats {Array<LngLat>}
 */
function calculateArea(lnglats){
	var getLineSQR = function(lnglats1, lnglats2) {
   		return (lnglats2[0]-lnglats1[0])*(lnglats2[1]+lnglats1[1])/2.0;
   	}
    var s = 0;
    var num = lnglats.length;
    for (var i = 1; i < num; i++) {
	    s += getLineSQR(lnglats[i - 1], lnglats[i]);
    }
    s += getLineSQR(lnglats[num - 1], lnglats[0]);
    return Number(parseFloat(Math.abs(s)*10000,10));
}

/**
 * 画扇形
 */
function addSector(path, options, fitBounds) {
	if (!options)
	{
		options = {
			color: "blue",
			opacity: 0.5
		}
	}

	var id = "sector"+createUniqueID();
	sectors.push(id);
	map.addLayer({
        'id': id,
        'type': 'fill',
        'source': {
            'type': 'geojson',
            'data': {
                'type': 'Feature',
                'geometry': {
                    'type': 'Polygon',
                    'coordinates': path
                }
            }
        },
        'layout': {},
        'paint': {
            'fill-color': options.color,
            'fill-opacity': options.opacity
        }
    });
	/*if (fitBounds)
	{

		var bounds = path[0].reduce(function(bounds, coord) {
			return bounds.extend(coord);
		}, new vmapx.LngLatBounds(path[0][0], path[0][0]));

		map.fitBounds(bounds, {
			padding: 20
		});
	}*/
}

addEvent('styledata', function () {
	addLayers();
});

function closeBtn() {
	offEvent("click", mapclickFun);
	drawPointFlag = false;
	disflag.flag = false;
	areaflag.flag = false;
}

addEvent('load', function () {
	getJson('BACKGROUND2');//
	getJson('SECURET3');//添加设备文字描述
	getJson('BKCHANNELID');//添加通道文字描述

	var drawPoint = document.getElementById('drawmarker');
	var drawLine = document.getElementById('drawpolyline');
	var drawPolygon = document.getElementById('drawpolygon');
	var clearoverlay = document.getElementById('clearoverlay');
	var dis = document.getElementById('dis');
	var apl = document.getElementById('addPolyline');
	var apn = document.getElementById('addPolygon');
	var area = document.getElementById('area');
	var as = document.getElementById("addSector");
	if (drawPoint)
	{
		drawPoint.onclick = function() {
			drawNum++;
			//draw.changeMode('draw_point');//画点按钮初始化
			closeBtn();
			drawPointFlag = true;
			addEvent("click", mapclickFun);
			//drawNum++;
		};
	}
	
	if (drawLine)
	{
		drawLine.onclick = function() {
			closeBtn();
			draw.changeMode('draw_line_string');//画线按钮初始化
		};
	}
	
	if (drawPolygon)
	{
		drawPolygon.onclick = function() {
			closeBtn();
			draw.changeMode('draw_polygon');//画多边形按钮初始化
		};
	}

	if(clearoverlay)
	{
		//清除地图上所有覆盖物
		clearoverlay.onclick = function(){
			closeBtn();
			draw.deleteAll();
			removePolylines();
			for (var i = 0; i < drawOverlays.points.length; i++)
			{
				var marker = drawOverlays.points[i];
				marker.remove();
			}
			//清除所有测距
			for (var i = 0; i < disflag.layers.length; i++)
			{
				map.removeLayer(disflag.layers[i].point);
				map.removeLayer(disflag.layers[i].line);
			}
			//清除所有测距label
			for (var j = 0; j < disflag.disLabels.length; j++)
			{
				disflag.disLabels[j].remove();
			}
			disflag.disLabels = [];
			//清除所有测面
			for (var i = 0; i < areaflag.layers.length; i++)
			{
				map.removeLayer(areaflag.layers[i].point);
				map.removeLayer(areaflag.layers[i].polygon);
			}
			//清除所有测面label
			for (var j = 0; j < areaflag.areaLabels.length; j++)
			{
				areaflag.areaLabels[j].remove();
			}
			areaflag.areaLabels = [];
			drawOverlays = {lines:[], polygons:[], points:[]}
			//清除所有扇形
			for (var i = 0; i < sectors.length; i++)
			{
				map.removeLayer(sectors[i]);
			}
			sectors = [];
		}
	}
	
	if (dis)
	{
		dis.onclick = function() {
			drawNum++;
			//debugger
			closeBtn();
			disflag.flag = true;
			
			geojson = createGeojson();
			disflag.layers.push({'point':'measure-points'+drawNum, 'line': 'measure-lines'+drawNum});
			map.addSource('geojson'+drawNum, {
				"type": "geojson",
				"data": geojson
			});
			map.addLayer({
				id: 'measure-points'+drawNum,
				type: 'circle',
				source: 'geojson'+drawNum,
				paint: {
					'circle-radius': 5,
					'circle-color': disflag.pointColor
				},
				filter: ['in', '$type', 'Point']
			});
			linestring = createLineJson();
			

			map.addLayer({
				id: 'measure-lines'+drawNum,
				type: 'line',
				source: 'geojson'+drawNum,
				layout: {
					'line-cap': 'round',
					'line-join': 'round'
				},
				paint: {
					'line-color': disflag.lineColor,
					'line-width': 2.5
				},
				filter: ['in', '$type', 'LineString']
			});
			addEvent('click', mapclickFun);
			//drawNum++;
		}
	}
	
	if (area)
	{
		area.onclick = function() {
			drawNum++;
			closeBtn();
			areaflag.flag = true;
			
			geojson = createGeojson();
			areaflag.layers.push({'point':'measure-points'+drawNum, 'polygon': 'measure-polygon'+drawNum});
			map.addSource('geojson'+drawNum, {
				"type": "geojson",
				"data": geojson
			});
			map.addLayer({
				id: 'measure-points'+drawNum,
				type: 'circle',
				source: 'geojson'+drawNum,
				paint: {
					'circle-radius': 5,
					'circle-color': areaflag.pointColor
				},
				filter: ['in', '$type', 'Point']
			});
			linestring = createPolygonJson();
			
			map.addLayer({
				"id": "measure-polygon"+drawNum,
				"type": "fill",
				"source": 'geojson'+drawNum,
				"paint": {
					"fill-color": areaflag.fillColor,
					"fill-opacity": 0.4,
					"fill-outline-color": areaflag.outLineColor
				},
				"filter": ["==", "$type", "Polygon"]
			});
			addEvent('click', mapclickFun);
			//drawNum++;
		}
	}

	if (apl)
	{
		apl.onclick = function() {
			closeBtn();
			
			addPolyline([[120.386826,36.267338],[120.386856,36.267258],[120.38699,36.266888],[120.38714,36.266632],[120.38729,36.266384],[120.3874,36.266235],[120.38746,36.266163],[120.387535,36.26607],[120.38763,36.26597],[120.38772,36.2659],[120.38781,36.26582],[120.38792,36.265755],[120.38804,36.26569],[120.38827,36.265575],[120.3886,36.2654],[120.3888,36.26531],[120.389046,36.265205],[120.38922,36.26514],[120.38941,36.265076],[120.38963,36.264996],[120.39049,36.26477],[120.39049,36.264767],[120.39094,36.264683],[120.391266,36.264637],[120.39137,36.264618],[120.39151,36.264606],[120.39177,36.264572],[120.3925,36.264526],[120.39272,36.26451],[120.39323,36.2645],[120.39382,36.2645],[120.39403,36.264496],[120.39421,36.264492],[120.394615,36.264492],[120.39465,36.26449],[120.39501,36.26449],[120.39501,36.26449],[120.39515,36.264515],[120.39547,36.26452],[120.39629,36.26452],[120.39658,36.264515],[120.39716,36.264515],[120.397835,36.264515],[120.398544,36.264515],[120.39908,36.264503],[120.399376,36.264503],[120.39948,36.264503],[120.40001,36.2645],[120.40038,36.264496],[120.40073,36.264496],[120.4012,36.264496],[120.4012,36.264492],[120.40158,36.26443],[120.40173,36.264374],[120.40188,36.264305],[120.401955,36.26424],[120.40202,36.26417],[120.40205,36.26412],[120.402084,36.26407],[120.4021,36.264],[120.402115,36.263927],[120.40213,36.263863],[120.40213,36.2638],[120.40213,36.263737],[120.40211,36.26367],[120.402084,36.263607],[120.40204,36.263546],[120.40199,36.263485],[120.40194,36.263428],[120.40184,36.263363],[120.40174,36.26332],[120.40165,36.263283],[120.40155,36.263256],[120.40146,36.26324],[120.4013,36.26324],[120.40115,36.26327],[120.401024,36.263325],[120.40091,36.263397],[120.40082,36.26349],[120.40075,36.26361],[120.400696,36.263706],[120.40065,36.263824],[120.400536,36.2641],[120.400536,36.265114],[120.40056,36.26601],[120.400566,36.267544],[120.400566,36.26796],[120.40057,36.268585],[120.40057,36.269592],[120.40057,36.2699],[120.40059,36.270283],[120.40059,36.27048],[120.400604,36.2707],[120.40068,36.271046],[120.40076,36.2713],[120.40085,36.271545],[120.400955,36.271774],[120.40114,36.27207],[120.4014,36.272404],[120.40165,36.272675],[120.40189,36.272873],[120.40214,36.273067],[120.40214,36.273067],[120.402306,36.273182],[120.40255,36.27333],[120.40276,36.27344],[120.40322,36.273663],[120.40372,36.273888],[120.404045,36.27404],[120.40465,36.27432],[120.40465,36.27432],[120.40488,36.274258],[120.405,36.274227],[120.405106,36.274166],[120.40526,36.27407],[120.40543,36.27396],[120.40562,36.27388],[120.40574,36.273834],[120.40592,36.273785],[120.40612,36.273746],[120.40632,36.27373],[120.406525,36.273743],[120.406685,36.27376],[120.406815,36.27379],[120.406906,36.273815],[120.40708,36.273884],[120.40724,36.273968],[120.40741,36.274067],[120.40753,36.27416],[120.407585,36.274185],[120.40769,36.274223],[120.4078,36.27425],[120.407875,36.274254],[120.40799,36.274254],[120.40807,36.274254],[120.40825,36.27423],[120.40864,36.274055],[120.40919,36.27381],[120.40969,36.273598],[120.40969,36.273594],[120.40987,36.27352],[120.410484,36.27325],[120.410934,36.27303],[120.41118,36.272896],[120.41158,36.27263],[120.41166,36.272575],[120.41182,36.272552],[120.41203,36.272552],[120.41223,36.272564],[120.41321,36.272648],[120.413506,36.27268],[120.41401,36.272736],[120.41451,36.27279],[120.414665,36.272804],[120.41533,36.272877],[120.41605,36.272953],[120.41673,36.273018],[120.416885,36.273026],[120.41702,36.27304],[120.41864,36.273148],[120.41891,36.27315],[120.41929,36.27318],[120.41937,36.273182],[120.41937,36.27327],[120.41884,36.27325],[120.41839,36.273216],[120.41795,36.273186],[120.41748,36.273148],[120.41734,36.273136],[120.41711,36.273125]], {color:'red', width:5}, true);
		}
	}

	if (apn)
	{
		apn.onclick = function() {
			debugger
			addPolygon([
						[
							[120.38174,36.266960],
							[120.38266,36.268915],
							[120.38199,36.266719],
							[120.381689,36.266812]
						]
					   ], {color:'red', opacity:0.5}, true);
		}	
	}
	
	if (as)
	{
		as.onclick = function() {
			var center = turf.point([120.38180975040706, 36.26673847915788]);
			var radius = 10/1000;
			var bearing1 = -75;//扇形第一夹角度数
			var bearing2 = 0;//扇形第二夹角度数
			
			var sector = turf.sector(center, radius, bearing1, bearing2);
			addSector(sector.geometry.coordinates, {color:'red', opacity:0.5}, true);
		}
	}

	//监听TIP打开事件
	var mapdom = document.getElementById('map');
	mapdom.addEventListener("DOMNodeInserted", function(e){
		if (e.target.firstElementChild && e.target.firstElementChild.getAttribute("aria-label") == "Close popup")
		{
			//alert("TIP已经创建！");
		}
	})
	
	map.on("zoomend", function(e){
		if(map.getZoom()<=19){
			//initMap(); 
			$("#map").hide();
			$("#map2").show();
			map.resize();
			if ($("#changeAddress").length > 0){
				$("#changeAddress").text("机场全貌");
			}
		}
	});
	
	$("#bglayer").hide();

	//drawRsector();
	
	addEvent('contextmenu', function(e) {
		closeBtn();
	});

	//双击地图获取画线、画面结果或删除多余测量label
	addEvent("dblclick", function(e) {
		if (disflag.flag)
		{
			var disLabels = disflag.disLabels;
			disLabels.pop();
			var lastLabel = disLabels[disLabels.length - 1];
			lastLabel.remove();
			disLabels.pop();
		} else {
			var overlay = draw.getSelected().features[0];
			if (overlay)
			{
				var type = overlay.geometry.type;
				if (type == "LineString")
				{
					drawOverlays.lines.push(overlay);
				} else if (type == "Polygon")
				{
					drawOverlays.polygons.push(overlay);
				}
			}
		}
	});
});

//label 
//read jsonfile
function getJson(fname) {
	var xmlHttp = null;
	try {
		xmlHttp = new XMLHttpRequest();
	}catch (e) {
		try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("your browser not support ajax!");
				return;
			}
		}
	}
	xmlHttp.open("GET",'/qdsodb/js/airport/' + fname + '.geojson');
	xmlHttp.send();
	xmlHttp.onreadystatechange = doResult; 

	function doResult() {
		var html='';
		if ((xmlHttp.readyState == 4)&&(xmlHttp.status == 200)) {
			var data = JSON.parse(xmlHttp.responseText);
			var f = data.features;
			var number = false;
			if (f && f.length > 0)
			{
				for (var i = 0; i < f.length; i++)
				{
					var name = f[i].properties.NAME;
					if (f[i].geometry.coordinates[0].length > 2)//线、面相关数据读取
					{
						var lnglat = f[i].geometry.coordinates[0][2];
					} else {//点数据读取
						
						var lnglat = [f[i].geometry.coordinates[0], f[i].geometry.coordinates[1]];
						number = true;
					}
						
					if(name) {
						if (number)
						{
							var el = getLabelDom(name, true, true);
							new vmapx.Marker(el)
							.setLngLat(lnglat)
							.addTo(map);
						}
						/*else{
							if (name == "安全门")
							{
								var m = markerIcon({"lng":lnglat[0], "lat":lnglat[1]},'/qdsodb/img/gis/tool/anquanmen.jpg','19px','23px', false);
							} else if (name == "验证柜台")
							{
								var m = markerIcon({"lng":lnglat[0], "lat":lnglat[1]},'/qdsodb/img/gis/tool/jianyantai.jpg','17px','18px', false);
							} else if (name == "安检机")
							{
								var m = markerIcon({"lng":lnglat[0], "lat":lnglat[1]},'/qdsodb/img/gis/tool/jianyantai.jpg','17px','18px', false);
							} else if (name == "开包台")
							{
								var m = markerIcon({"lng":lnglat[0], "lat":lnglat[1]},'/qdsodb/img/gis/tool/anquanmen.jpg','19px','23px', false);
							}
						}
						localMarkers.push(m);*/
						var labLnglat = [120.38121951857386, 36.26700557192447];
						labeldom = anjianLabel("国际安检通道", false);
						if (lnglatlabel) {
							// 已经存在则直接修改坐标位置
							// lnglatlabel.setLngLat(e.lngLat);
							lnglatlabel.remove();
						}
						// 未存在则创建新label对象
						lnglatlabel = new vmapx.Marker(labeldom, {
							offset : new vmapx.Point(135, 10)
						}).setLngLat(labLnglat).addTo(map);
						 
					}
				}
			}
		}
	}
}