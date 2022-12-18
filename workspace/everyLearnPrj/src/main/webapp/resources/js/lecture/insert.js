function addRow() {

    var objRow;
    objRow = document.all["index-table"].insertRow();

    //숫자
    var objCell_index = objRow.insertCell();
    objCell_index.innerHTML = '<input type="number" name="no" class="table-input"  placeholder="숫자만 입력해주세요">';

    //목차명
    var objCell_name = objRow.insertCell();
    objCell_name.innerHTML = '<input type="text" name="chaper" class="table-input"  placeholder="제목을 입력해주세요">';
    
    
    
}