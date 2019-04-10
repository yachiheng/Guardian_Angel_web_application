var kh85 = {
    lat: 22.611639, lng: 120.300210
};   //設定座標(22.611271, 120.300455)為高雄85大樓
var messageWindow;//提示視窗
var rectAttributes = {
    strokeWeight: 0.75,    //框線寬
    strokeOpacity: 0.75,   //框線透明度
    fillColor: "#0066FF",  //覆蓋面積顏色
    fillOpacity: 0.25,     //覆蓋面積透明度
    editable: true,        //是否可編輯大小
    draggable: true        //是否可拖曳
};//矩形的屬性
var collect = {}; //收集矩形
var selectingRect = null;  //指定中的矩形
var LoadOverlay; //從資料庫載入的矩形
var locationWindow; //老人定位的訊息視窗
function initMap() {
//==========地圖基本資料==========//
    var map = new google.maps.Map(document.getElementById('map'), {
        center: kh85,  //地圖中心位置
        zoom: 17,  //地圖放大程度
        streetViewControl: false,
        mapTypeControl: false,
        noClear: true
    });
    messageWindow = new google.maps.InfoWindow();//提示視窗為googleMap的infoWindow
    LoadOverlay = new google.maps.Rectangle();
//==========將元件放入地圖內==========//
    map.controls[google.maps.ControlPosition.TOP_LEFT]
        .push(document.getElementById('pac-input'));//將搜尋框放入地圖內
    map.controls[google.maps.ControlPosition.LEFT_TOP]
        .push(document.getElementById('gpsButtons'));//將按鈕放入地圖內

     //==========繪圖管理員==========//
    var DrawingManager = new google.maps.drawing.DrawingManager({
        drawingControl: true,   //關閉繪圖控制項
        drawingControlOptions: {  //繪圖控制項的屬性
            position: google.maps.ControlPosition.LEFT_BOTTOM,
            drawingModes: [google.maps.drawing.OverlayType.RECTANGLE]//繪圖模式切換顯示矩形
        },
        drawingMode: google.maps.drawing.OverlayType.RECTANGLE,  //繪圖模式:矩形
        rectangleOptions: rectAttributes,  //矩形屬性 為 宣告的矩形屬性
        map: map//放到地圖上
    });
    DrawingManager.setDrawingMode(null);//預設為一般模式
    //==========畫矩形的各種方法==========//
    // 1.(方法)指定矩形
    function selectRect(overlay) {
        if (selectingRect !== overlay) {  //指定中的矩形 不是 參數overlay
            selectRectClear();  //執行 (方法)解除矩形指定狀態
            selectingRect = overlay;
            overlay.set('draggable', true);
            overlay.set('editable', true);
        }
    }
    // 2.(方法) 加入矩形到"collect物件"內
    function rectJoin(e) {
        var overlay = e.overlay;  //宣告 overlay = e參數的疊加層
        overlay.type = e.type; //overlay的type = e參數的type
        overlay.id = new Date().getTime() + '_' + Math.floor(Math.random() * 1000);
        //疊加層的id = 伺服器當前時間+_+math.取整數(math.產生0-1之間的亂數  乘以  1000)
        this.collect[overlay.id] = overlay;  //疊加層 為 "收集陣列"中的疊加層id
        selectRect(overlay);
        //添加googleMap事件監聽器(疊加層上,單擊,以下方法
        google.maps.event.addListener(overlay, 'click', function () {
            selectRect(overlay);  //呼叫"設定選擇"方法
        });
    }
    // 3.(方法)解除矩形指定狀態
    function selectRectClear() {
        if (this.selectingRect) {  //如果 被指定的圖形存在
            this.selectingRect.set('draggable', false);  //該 被指定的圖形 設為不可拖動
            this.selectingRect.set('editable', false);  //該 被指定的圖形 設為不可變更大小
            this.selectingRect = null;
        } 
    }   
    // 4.(方法)刪除矩形
    function deleteRect() {
        if (selectingRect) {
            confirm("是否刪除選取的安全區域?" +
                "(僅暫時刪除，需按下儲存按鈕才會完整刪除此安全區域。)");
            var overlay = selectingRect;
            selectRectClear();  //呼叫 清除指定 方法
            overlay.setMap(null);  //將 覆蓋圖 從地圖上移除
            delete this.collect[overlay.id];  //刪除 收集中的該覆蓋圖的id
        }
    } 
    // 5.(方法)刪除所有矩形
    function deleteAllRect() {
        confirm("確定要清除所有已設定的安全區域??");
        selectRectClear();
        for (var i = 0; i < collect.length;i++) {
            var overlay = collect[i];
            overlay.setMap(null);
            delete this.overlay[overlay.id];
        }           
    }
    // 6.(方法)儲存矩形資料
    function saveRect() {

        selectRectClear();  //執行:(方法)解除矩形指定狀態
        var rectDataArray = [];  //宣告 矩形資料陣列
        for (var rectData in collect) {
            var overlay = collect[rectData];
            var shapeType = google.maps.drawing.OverlayType;  //圖形種類=googleMap的疊加層有的種類

            switch (overlay.type) {  //選擇 overlay的種類
                case shapeType.RECTANGLE: //如果是矩形類型
                    rectDataArray.push({  //rectDataArray中加入以下資料
                        type: overlay.type,  //key=type  value=overlay的種類
                        bounds: overlay.getBounds()  //key=bounds value=獲取overLay的界限值
                    });
                    break;
                default:  //如果不是矩形類型
                    alert('儲存圖形種類錯誤,不得為' + overlay.type)
            }
        }//判斷collect是否為空陣列
        var rectBoundArray = [];  //宣告 矩形界限陣列
        for (var i = 0; i < rectDataArray.length; i++) { //用迴圈將值存入rectBoundArray內，次數為rectDataArray的長度
            var ractNum = i+1 ;
            var neLng = Number(rectDataArray[i].bounds.ga.l); //東北角經度的值
            var neLat = Number(rectDataArray[i].bounds.ma.l); //東北角緯度的值
            var swLng = Number(rectDataArray[i].bounds.ga.j); //西南角經度的值
            var swLat = Number(rectDataArray[i].bounds.ma.j); //西南角緯度的值
            var lngGap = (neLng - swLng) / 2; //經度差值
            var latGap = (neLat - swLat) / 2;  //緯度差值
            var cenLng = (lngGap + swLng); //中心點經度
            var cenLat = (latGap + swLat);  //中心點緯度

            rectBoundArray.push({  //以json格式將值放入rectBoundArray
                gbNumber: ractNum, //key: value,
                cenLng: cenLng,
                cenLat: cenLat,
                neLng: neLng,
                neLat: neLat,
                swLng: swLng,
                swLat: swLat,
            })            
        }
        console.log(rectBoundArray); //測試用 將rectBoundArray內容放到console上

        $.post('/rectSaveAPI.aspx',  
            {
                gpsData: JSON.stringify(rectBoundArray),
                dataUid: Uid,
                dataOid: Oid
            }, //ajax.post  url,data,succes
            function (data) {  //success
                console.log('回傳:', data)
            })
        alert("安全區域儲存成功!!");
    }
    // 7.(方法)切換為一般模式
    function switchGeneralMode () {
        if (DrawingManager.drawingMode = "RECTANGLE") {  //繪圖模式為矩形時
            DrawingManager.setDrawingMode(null);   //切換成一般模式
        }
    }
    // 8.(方法)切換為畫矩形模式
    function switchRectMode() {
        if (DrawingManager.drawingMode != "RECTANGLE") {  //繪圖模式不是矩形時
            DrawingManager.setDrawingMode('rectangle');  //切換成矩形模式
        }
    }
     //9.(方法)從資料庫取得矩形
    function getRectFromSql() {
        DrawingManager.setDrawingMode(null);  //繪圖模式切換為一般模式
        for (var i = 0; i < amount; i++) {
            //console.log(csJsonsData[i].neLng);
            LoadOverlay = new google.maps.Rectangle();  
            LoadOverlay.setOptions(rectAttributes);
            LoadOverlay.setOptions({
                map: map,
                bounds: {
                    north: parseFloat(csJsonsData[i].neLat),
                    south: parseFloat(csJsonsData[i].swLat),
                    east: parseFloat(csJsonsData[i].neLng),
                    west: parseFloat(csJsonsData[i].swLng)
                }
            });
            sqlRectJoin();        
        }
        
              
    }
    // 10.(方法)將資料庫的矩形加入collect物件內
    function sqlRectJoin() {
        var overlay = LoadOverlay;
        var shapeType = google.maps.drawing.OverlayType;  //圖形種類=googleMap的疊加層有的種類
        overlay.type = shapeType.RECTANGLE;
        overlay.id = new Date().getTime() + '_' + Math.floor(Math.random() * 1000);
        //疊加層的id = 伺服器當前時間+_+math.取整數(math.產生0-1之間的亂數  乘以  1000)
        this.collect[overlay.id] = overlay;  //疊加層 為 "收集陣列"中的疊加層id
        selectRect(overlay);
        selectRectClear();
        //添加googleMap事件監聽器(疊加層上,單擊,以下方法
        google.maps.event.addListener(overlay, 'click', function () {
            selectRect(overlay);  //呼叫"設定選擇"方法
        });
    }

    if (amount != "0") {
        getRectFromSql();
    }    
    //==========googleMaps事件監聽器==========//
    // 1.切換為一般模式
    google.maps.event.addDomListener(document.getElementById("gpsGeneral"),//切換一般模式按鈕
        "click",//單擊時
        function () {
            switchGeneralMode()
        });//執行 (方法)切換為一般模式

    // 2.切換為畫矩形模式
    google.maps.event.addDomListener(document.getElementById("gpsRect"),  //切換矩形模式按鈕
        "click",//單擊時
        function () {
            switchRectMode()
        });//執行 (方法)切換為畫矩形模式

    // 3.讓矩形畫完後切換回一般地圖模式，並呼叫"加入"方法
    google.maps.event.addListener(DrawingManager, //繪圖管理員中
        'overlaycomplete', //圖片覆蓋完成時
        function (e) {
            DrawingManager.setDrawingMode(null);
            rectJoin(e);
        });//繪圖管理員的繪圖模式變為null，執行 (方法)加入矩形到"collect物件"內

    // 4.從繪圖模式切換回一般模式，或是從一般模式切換回繪圖模式時，解除地圖上矩形的指定
    google.maps.event.addListener(DrawingManager, //繪圖管理員中
        'drawingmode_changed',//繪圖模式變更時
        function () {
            selectRectClear(); 
        });//執行 (方法)清除指定

    // 5.當滑鼠點在地圖上而非覆蓋層上時，解除指定矩形
    google.maps.event.addListener(map,  //地圖上
        'click',//點擊時
        function () {
            selectRectClear(); 
        });//執行 (方法)清除指定

    // 6.按下刪除按鈕時，呼叫"刪除矩形"方法，刪除指定的矩形
    google.maps.event.addDomListener(document.getElementById('gpsDelete'),  //刪除按鈕上
        'click',//點擊時
        function () {
            deleteRect(); 
        }); //執行 (方法)刪除矩形

    // 7.按下儲存按鈕時，呼叫"儲存圖形資料"方法，儲存地圖上所有矩形
    google.maps.event.addDomListener(document.getElementById('gpsSave'),  //儲存按鈕上
        'click',//點擊時
        function () {
            saveRect(); 
        });//執行 (方法)儲存矩形
    // 8.按下刪除按鈕時，刪除地圖上全部矩形
    google.maps.event.addDomListener(document.getElementById('gpsAllDel'),
        'click',
        function () {
            deleteAllRect();
        });

//============自動定位==============//
    function AutoPosition() {
            //╔══ 自動定位相關function ══╗
            function locationError(browserHasGeolocation, messageWindow, location) {
                messageWindow.setPosition(location);
                messageWindow.setContent(browserHasGeolocation ?
                    '錯誤: 自動定位功能無效' :
                    '錯誤: 你的瀏覽器不支援自動定位功能');
                messageWindow.open(map);
            }
            //╚══ 自動定位相關function ══╝
            //╔══ 地圖上自動定位所在位置 ══╗
            if (navigator.geolocation) {  //航海家.地理位置
                navigator.geolocation.getCurrentPosition(function (location) {  //航海家.地理位置.得到當'前位置
                    var position = {
                        lat: location.coords.latitude,  // key:value   定位.橫縱座標.緯度
                        lng: location.coords.longitude  // key:value   定位.橫縱座標.經度
                    };

                    messageWindow.setPosition(position);
                    messageWindow.setContent('您的位置在:</br>' +
                        '經度' + position.lng.toFixed(3) + '度</br>' +
                        '緯度' + position.lat.toFixed(3) + '度');
                    messageWindow.open(map);
                    map.setCenter(position);
                }, function () {
                    locationError(true, messageWindow, map.getCenter());
                });
            }
            else {
                // Browser doesn't support Geolocation
                locationError(false, messageWindow, map.getCenter());
            }
            //╚══ 地圖上自動定位所在位置 ══╝
    }//自動定位功能
    function AutoPositionOld() {
        var location = {
            lat: xLocation,
            lng: yLocation
        };//定位的座標
        var message = '<div id="content">' +
            '<p>守護對象：' + oldName + '</p>' +
            '</div>' + 
            '<div>' +
            '<p>經度：' +yLocation+ '度</p></div><div><p>緯度：' + xLocation+'度</p></div>';//訊息內容
        map.setCenter(location);//將地圖中心更換為定位的座標
        locationWindow = new google.maps.InfoWindow({
            content: message
        }); //老人定位的訊息視窗

        var marker = new google.maps.Marker({
            position: location,
            map: map,
            title: '張素素的所在位置'
        });
        function openWindow() {
            locationWindow.open(map, marker);
        }
        openWindow();
        //單擊在marker時跳出訊息視窗
        marker.addListener('click', function () {
            openWindow();
        });

    } //自動定位老人位置
    if (amountL == 0) {
        AutoPosition();
    } else {
        AutoPositionOld();
    }//沒有定位老人的話,執行(方法)自動定位,有定位老人的話,執行(方法)老人定位

//============地圖搜尋==============//
    //╔══ 地圖的地點搜尋 ══╗
    var input = document.getElementById('pac-input');  //input為"id是pac-input"的文字輸入框
    var autocomplete = new google.maps.places.Autocomplete(input); //將autocompele功能，放在pac-input文字輸入框內

    // 將地圖的邊界（視口）屬性綁定到autocompele對象，以便自動完成請求使用請求中的bounds選項的當前地圖邊界。
    autocomplete.bindTo('bounds', map);

    //設置要在用戶選擇場所時回傳的的數據字段。
    autocomplete.setFields(
        ['address_components', 'geometry', 'icon', 'name']);  //[地址組,幾何,小圖示,地點名稱]

    //設置標記上的訊息視窗
    var infowindow = new google.maps.InfoWindow();  //new一個訊息視窗
    var infowindowContent = document.getElementById('infowindow-content');    //new一個視窗的連結
    infowindow.setContent(infowindowContent);
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });

    //autocomplete的事件監聽器
    autocomplete.addListener('place_changed', function () {  //autocomplete.事件監聽器('place_改變時',方法(){})
        infowindow.close();  //關閉位置訊息視窗
        marker.setVisible(false);  //刪除標記
        messageWindow.close();  //關閉當前位置訊息視窗
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // 用戶輸入了未建議的地方名稱並按Enter鍵，或者地方詳細信息請求失敗。
            window.alert("沒有詳細信息可供輸入: '" + place.name + "'");
            return;
        }

        // 如果地點有小圖示，則將其顯示在地圖上。
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
            address = [
                (place.address_components[0] && place.address_components[0].short_name || ''),
                (place.address_components[1] && place.address_components[1].short_name || ''),
                (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }

        infowindowContent.children['place-icon'].src = place.icon;
        infowindowContent.children['place-name'].textContent = place.name;
        infowindowContent.children['place-address'].textContent = address;
        infowindow.open(map, marker);
    });
    //╚══ 地圖的地點搜尋 ══╝
    //----------警報系統----------//
    var outRectNotice = null;  //開關警報功能   
    if (amount == 0) {
        outRectNotice = null;
    } else {
        outRectNotice = window.setInterval("outOfRange()", 1000);
    }
    function switchNotice() {
        if (outRectNotice != null) {
            alert('安全區域警報已關閉');
            clearInterval(outRectNotice);
            outRectNotice = null;
            $("#lbStatus").html("尚未開啟偵測功能");
        }
        else if (outRectNotice == null) {
            alert('安全區域警報已開啟');
            outOfRange();
            outRectNotice = window.setInterval("outOfRange()", 1000);
        }
    }//(方法)開關警報功能

    google.maps.event.addDomListener(document.getElementById('gpsNotice'),
        'click',
        function () {
            switchNotice();
        });
}
function outOfRange() {
    selectRectClear();  //執行:(方法)解除矩形指定狀態
    var rectDataArray = [];  //宣告 矩形資料陣列
    for (var rectData in collect) {
        var overlay = collect[rectData];
        var shapeType = google.maps.drawing.OverlayType;  //圖形種類=googleMap的疊加層有的種類

        switch (overlay.type) {  //選擇 overlay的種類
            case shapeType.RECTANGLE: //如果是矩形類型
                rectDataArray.push({  //rectDataArray中加入以下資料
                    type: overlay.type,  //key=type  value=overlay的種類
                    bounds: overlay.getBounds()  //key=bounds value=獲取overLay的界限值
                });
                break;
            default:  //如果不是矩形類型
                alert('儲存圖形種類錯誤,不得為' + overlay.type)
        }
    }//判斷collect是否為空陣列
    var rectBoundArray = [];  //宣告 矩形界限陣列
    for (var i = 0; i < rectDataArray.length; i++) { //用迴圈將值存入rectBoundArray內，次數為rectDataArray的長度
        var ractNum = i + 1;
        var neLng = Number(rectDataArray[i].bounds.ga.l); //東北角經度的值
        var neLat = Number(rectDataArray[i].bounds.ma.l); //東北角緯度的值
        var swLng = Number(rectDataArray[i].bounds.ga.j); //西南角經度的值
        var swLat = Number(rectDataArray[i].bounds.ma.j); //西南角緯度的值
        var lngGap = (neLng - swLng) / 2; //經度差值
        var latGap = (neLat - swLat) / 2;  //緯度差值
        var cenLng = (lngGap + swLng); //中心點經度
        var cenLat = (latGap + swLat);  //中心點緯度

        rectBoundArray.push({  //以json格式將值放入rectBoundArray
            gbNumber: ractNum, //key: value,
            cenLng: cenLng,
            cenLat: cenLat,
            neLng: neLng,
            neLat: neLat,
            swLng: swLng,
            swLat: swLat,
        })
    }//用迴圈將值存入rectBoundArray內，次數為rectDataArray的長度
    console.log(rectBoundArray); //測試用 將rectBoundArray內容放到console上
    var judge = 0;
    for (var i = 0; i < rectBoundArray.length; i++) {
        if ((yLocation < rectBoundArray[i].neLng) &&
            (xLocation < rectBoundArray[i].neLat) &&
            (yLocation > rectBoundArray[i].swLng) &&
            (xLocation > rectBoundArray[i].swLat)) {
            judge = 1;
            console.log(judge);
        } else {
            console.log(rectBoundArray[i].neLng);//東經
            console.log(xLocation);
            console.log(rectBoundArray[i].neLat);//北緯
            console.log(yLocation);
            console.log(judge);
        }
    }//judge為0即超出範圍，為1則在範圍內
    if (judge == 0) {
        $.post('/warningAPI.aspx',
            {
                Data: "守護對象超出安全範圍",
                dataUid: Uid,
                dataOid: Oid
            }, //ajax.post  url,data,succes
            function (data) {  //success
                console.log('回傳:', data)
            })
        $("#lbStatus").html('<span style="color:red;">警告：守護對象超出安全範圍！！</span>');
    }//超出範圍時啟用ajax
    else if (judge == 1) {
        $("#lbStatus").html('<span style="color:green;">守護對象在安全範圍內</span>');
    }

}
//(方法)解除矩形指定狀態
function selectRectClear() {
    if (this.selectingRect) {  //如果 被指定的圖形存在
        this.selectingRect.set('draggable', false);  //該 被指定的圖形 設為不可拖動
        this.selectingRect.set('editable', false);  //該 被指定的圖形 設為不可變更大小
        this.selectingRect = null;
    }
}

