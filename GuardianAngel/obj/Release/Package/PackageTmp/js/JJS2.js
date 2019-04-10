$.datepicker.regional['zh-TW'] = {
    dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
    dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
    monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
};

$.datepicker.setDefaults($.datepicker.regional["zh-TW"]);

$(function () {
    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {

        $("#tbxBirth").datepicker({
            changeMonth: true,
            changeYear: true,
            showMonthAfterYear: true,
            dateFormat: "yy/mm/dd",
            yearSuffix: "年",
            yearRange: "1900:now",
            maxDate: "+0"
        });

        $("#txtStartDate").datepicker({
            changeMonth: true,
            changeYear: true,
            showMonthAfterYear: true,
            dateFormat: "yy/mm/dd",
            yearSuffix: "年",
            yearRange: "2017:2030",
            maxDate: "+3650"
        });

        $("#txtEndDate").datepicker({
            changeMonth: true,
            changeYear: true,
            showMonthAfterYear: true,
            dateFormat: "yy/mm/dd",
            yearSuffix: "年",
            yearRange: "2017:2030",
            maxDate: "+3650"
        });

        $("#txtConDate").datepicker({
            changeMonth: true,
            changeYear: true,
            showMonthAfterYear: true,
            dateFormat: "yy/mm/dd",
            yearSuffix: "年",
            yearRange: "2017:2030",
            maxDate: "+3650"
        });
    });
    
});
