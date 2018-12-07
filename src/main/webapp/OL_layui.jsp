<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>OL首页</title>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="layui/layui.js"></script>
    <script type="text/javascript" src="js/ol-debug.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link href="css/ol.css" rel="stylesheet" type="text/css" />
    <link href="css/popup.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<style>
    .layui-layout-admin .layui-body {
        top: 60px;
        bottom: 0px;
        /*left: 0px;*/
    }
    .mapTree.checkbox{
        margin-left: 18px;
        margin-right: 10px;
        width: 16px;
        height: 16px;
    }
    .layui-layout-admin .layui-side {
        top: 60px;
        width: 300px;
        overflow-x: hidden;
    }
    .layui-nav-tree {
        width: 300px;
        padding: 0;
    }
    .layui-side-scroll {
        width: 300px;
        height: 100%;
        overflow-x: hidden;
    }
    .layui-body {
        position: absolute;
        left: 300px;
        right: 0;
        top: 0;
        bottom: 0;
        z-index: 998;
        width: auto;
        overflow: hidden;
        overflow-y: auto;
        box-sizing: border-box;
    }
    .layui-layout-admin .layui-logo {
        position: absolute;
        left: 0;
        top: 0;
        width: 400px;
        height: 100%;
        line-height: 60px;
        text-align: center;
        color: #fff;
        font-size: 22px;
    }
</style>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">inSAR技术沉降变形分析数据管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">建筑物</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">最大形变速率</a></dd>
                    <dd><a href="javascript:;">最大近期形变速率</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">统计分析</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">PS点一张表</a></dd>
                    <dd><a href="javascript:;">风险源一张表</a></dd>
                    <dd><a href="javascript:;">预警一张表</a></dd>
                    <dd><a href="javascript:;">点选区域统计</a></dd>
                    <dd><a href="javascript:;">建筑物区域查询统计</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">后台管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">用户管理</a></dd>
                    <dd><a href="javascript:;">图层管理</a></dd>
                    <dd><a href="javascript:;">地图管理</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">地图选择</a>
                <dl class="layui-nav-child">

                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    admin
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">基本资料</a></dd>
                    <dd><a href="javascript:;">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:;">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">基础图</a>
                    <dl class="layui-nav-child">
                        <dd><input class="mapTree checkbox" type="radio" name="layerSwitcher" id="TianDiTuVLayer" checked>天地图矢量图</dd>
                        <dd><input class="mapTree checkbox" type="radio" name="layerSwitcher" id="TianDiTuILayer" >天地图卫星图</dd>
                        <dd><input class="mapTree checkbox" type="radio" name="layerSwitcher" id="TianDiTuTLayer" >天地图地形图</dd>
                        <%--<dd><input class="mapTree checkbox" type="checkbox" id="TianDiTuVLayer" lay-skin="primary">天地图矢量图</dd>
                        <dd><input class="mapTree checkbox" type="checkbox" id="TianDiTuILayer" lay-skin="primary">天地图卫星图</dd>
                        <dd><input class="mapTree checkbox" type="checkbox" id="TianDiTuTLayer" lay-skin="primary">天地图地形图</dd>--%>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">专题图</a>
                    <dl class="layui-nav-child" id="layer-child">
                        <dd><input class="mapTree checkbox" type="checkbox" lay-skin="primary">天地图矢量图</dd>
                        <dd><input class="mapTree checkbox" type="checkbox" lay-skin="primary">天地图卫星图</dd>
                        <dd><input class="mapTree checkbox" type="checkbox" lay-skin="primary">天地图地形图</dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div id="mapDiv" style="width: 100%; height: 100%"></div>

        <div id="popup" class="ol-popup">
            <a href="#" id="popup-closer" class="ol-popup-closer"></a>
            <div id="popup-title" class="popup-title"></div>
            <div id="popup-content" class="popup-content"></div>
        </div>
    </div>

</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    debugger

    //初始化地图
    var map = new ol.Map({
        controls: ol.control.defaults({
            attribution: false
        }),
        target: 'mapDiv',
        layers: [new TianDiTuVLayer(),new TianDiTuAnnVLayer()],
        view: new ol.View({
            center: [114.041005,22.610339],
            zoom: 12,
            projection: 'EPSG:4326'
        })
    });

    //加载geoserver的wfs
    //参数字段
    var wfsParams = {
        service : 'WFS',
        version : '1.0.0',
        request : 'GetFeature',
        typeName : 'myWorkspaces:JiangXiBOU_1',  //图层名称
        outputFormat : 'text/javascript',  //重点，不要改变
        format_options : 'callback:loadFeatures'  //回调函数声明
    };

    //使用jsonp，可以解决跨域的问题，GeoServer中的web.xml文件关于jsonp的注释要去掉，就可以支持跨域了
    var vectorSource = new ol.source.Vector({
        format: new ol.format.GeoJSON(),
        loader: function(extent, resolution, projection) {  //加载函数
            var url = 'http://localhost:8081/geoserver/myWorkspaces/ows';
            //var url = 'http://localhost:8080/geoserver/wfs';
            $.ajax({
                url: url,
                data : $.param(wfsParams),   //传参
                type : 'GET',
                dataType: 'jsonp',   //解决跨域的关键
                jsonpCallback:'loadFeatures'  //回调

            });
        },
        /*strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({
            maxZoom: 25
        })),*/
        projection: 'EPSG:4326'
    });
    //回调函数使用
    window.loadFeatures = function(response) {
        vectorSource.addFeatures((new ol.format.GeoJSON()).readFeatures(response));  //载入要素
        //坐标转换，将返回的数据的坐标转换到当前使用地图的坐标系，否则，无法正常显示
        /*vectorSource.addFeatures((new ol.format.GeoJSON()).readFeatures(response,{
            dataProjection: 'EPSG:4326',    // 设定JSON数据使用的坐标系
            featureProjection: 'EPSG:3857' // 设定当前地图使用的feature的坐标系
        }));  //载入要素*/

    };
    var vectorLayer = new ol.layer.Vector({
        source: vectorSource
    });
    map.addLayer(vectorLayer);

    //popup
    var projection = new ol.proj.Projection({
        code: 'EPSG:4326',
        units: 'degrees'
    });
    var bounds = [73.4510046356223, 18.1632471876417,134.976797646506, 53.5319431522236];
    var container = document.getElementById('popup');
    var content = document.getElementById('popup-content');
    var title = document.getElementById('popup-title');
    var closer = document.getElementById('popup-closer');
    closer.onclick = function(){
        container.style.display = 'none';
        closer.blur();
        return false;
    };
    var overlay = new ol.Overlay({
        element: container
    });
    map.addOverlay(overlay);

    //map.getView().fitExtent(bounds, map.getSize());

    map.on('click', function(evt) {
        var selectFeature = map.forEachFeatureAtPixel(evt.pixel,function(feature) {
            return feature;
        });
        if(selectFeature){
            var coordinate = evt.coordinate;
            var hdms = ol.coordinate.toStringHDMS(ol.proj.transform(
                coordinate, 'EPSG:4326', 'EPSG:4326'));
            overlay.setPosition(coordinate);
            content.innerHTML = '<p>You clicked here:</p><code>' + selectFeature.values_.NAME +
                '</code>';
            container.style.display = 'block';
            title.innerHTML = "提示信息";
            title.style.display = 'block';
            map.getView().setCenter(coordinate);
        }

    });




</script>
</body>
</html>