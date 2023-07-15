$(function () {
    debugger;
    $grid = $("#jqGrid").jqGrid({
        url: '../Home/Index?id=1',
        mytype: 'Get',
        datatype: 'json',
        colModel: [
            { label: 'Employee Name', name: 'EmployeeName' },
            { label: 'Employee Age', name: 'EmployeeAge' },
            { label: 'Employee Email', name: 'EmployeeEmail' },
            { label: 'Employee Organisation Name', name: 'EmpOrganisationName' },
            { label: 'Address', name: 'Address' },
            { label: 'Joning Date', name: 'JoningDate' },
            { label: 'Joining Time', name: 'JoiningTime' }
        ],
        loadonce: true
    });
});    