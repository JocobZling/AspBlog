function UrlSearch() {
    let name, value;
    let str = location.href; //取得整个地址栏
    let num = str.indexOf("?");
    str = str.substr(num + 1); //取得所有参数   stringvar.substr(start [, length ]
    let arr = str.split("&"); //各个参数放到数组里
    for (let i = 0; i < arr.length; i++) {
        num = arr[i].indexOf("=");
        if (num > 0) {
            name = arr[i].substring(0, num);
            value = arr[i].substr(num + 1);
            this[name] = value;
        }
    }
}
let request = new UrlSearch();

$(document).ready(function () {
    //console.log(request);
    $.ajax({
        url: 'articleDetail.aspx`',
        type: 'get',
        success: function (result) {
            loadDataOnHtml(result);
            console.log(result);
        }
    });
});
function loadDataOnHtml(data) {
    $("#title").html(data.title);
    $("#date").html(data.date);
    $("#content").append(`<p> ${data.content}</p>`);
};