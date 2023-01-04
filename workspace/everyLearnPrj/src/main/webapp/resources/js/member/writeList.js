function classReview(memberNo){
    let f = document.createElement('form');
    console.log("여기는 강의 후기 : " + memberNo);
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'memberNo');
    obj.setAttribute('value', memberNo);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/el/member/writeListClass');
    document.body.appendChild(f);
    f.submit();
}