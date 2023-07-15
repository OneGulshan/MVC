$(function () {
    debugger;
    $grid = $("#jqGrid").jqGrid({
        url: '../Home/Index?id=1',
        mytype: 'Get',
        datatype: 'json',
        colModel: [
            { label: 'Employee Name', name: 'EmployeeName' },
            { label: 'Employee Age', name: 'EmployeeAge' },
            { label: 'Employee Email', name: 'EmployeeEmail', width : 200 },
            { label: 'Employee Organisation Name', name: 'EmpOrganisationName' },
            { label: 'Address', name: 'Address' },
            { label: 'Joning Date', name: 'JoningDate' },
            { label: 'Joining Time', name: 'JoiningTime' }
        ],
        loadonce: true,
        pager: '#jqGridPager',
        rowNum: 10,
        rowList: [10, 20, 30, 50],
        viewrecords: true,
        height: 250,
        width: 1200
    });
    $("#jqGrid").jqGrid('navGrid', '#jqGridPager', { edit: false, add: false, del: false })

    var $pager = $grid.closest(".ui-jqgrid").find(".ui-pg-table");
    //replace paging icons
    $pager.find(".ui-pg-button>span.ui-icon-seek-first")
        .removeClass("ui-icon ui-icon-seek-first")
        .addClass("fa fa-fast-backward");
    $pager.find(".ui-pg-button>span.ui-icon-seek-prev")
        .removeClass("ui-icon ui-icon-seek-prev")
        .addClass("fa fa-step-backward");
    $pager.find(".ui-pg-button>span.ui-icon-seek-next")
        .removeClass("ui-icon ui-icon-seek-next")
        .addClass("fa fa-step-forward");
    $pager.find(".ui-pg-button>span.ui-icon-seek-end")
        .removeClass("ui-icon ui-icon-seek-end")
        .addClass("fa fa-fast-forward");

    //replace search and refresh icons
    $pager.find(".ui-pg-div>span.ui-icon-search")
        .removeClass("ui-icon ui-icon-search")
        .addClass("fa fa-search");
    $pager.find(".ui-pg-div>span.ui-icon-refresh")
        .removeClass("ui-icon ui-icon-refresh")
        .addClass("fa fa-refresh");
});