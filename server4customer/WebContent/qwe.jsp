<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
 <title></title>
 <script>
     $(document).ready(function(){
         //<tr/>居中
        $("#tab tr").attr("align","center");
        
        //增加<tr/>
        $("#but").click(function(){
            var _len = $("#tab tr").length;        
            $("#tab").append("<tr id="+_len+" align='center'>"
                                +"<td>"+_len+"</td>"
                                +"<td>Dynamic TR"+_len+"</td>"
                                +"<td><input type='text' name='desc"+_len+"' id='desc"+_len+"' /></td>"
                                +"<td><a href=\'#\' onclick=\'deltr("+_len+")\'>删除</a></td>"
                            +"</tr>");            
        })    
    })
    
    //删除<tr/>
    var deltr =function(index)
    {
        var _len = $("#tab tr").length;
        $("tr[id='"+index+"']").remove();//删除当前行
        for(var i=index+1,j=_len;i<j;i++)
        {
            var nextTxtVal = $("#desc"+i).val();
            $("tr[id=\'"+i+"\']")
                .replaceWith("<tr id="+(i-1)+" align='center'>"
                                +"<td>"+(i-1)+"</td>"
                                +"<td>Dynamic TR"+(i-1)+"</td>"
                                +"<td><input type='text' name='desc"+(i-1)+"' value='"+nextTxtVal+"' id='desc"+(i-1)+"'/></td>"
                                +"<td><a href=\'#\' onclick=\'deltr("+(i-1)+")\'>删除</a></td>"
                            +"</tr>");
        }    
        
    }
</script>
</head>
<body>
    
    <table id="tab" border="1" width="60%" align="center" style="margin-top:20px">
        <tr>
            <td width="20%">序号</td>
            <td>标题</td>
            <td>描述</td>
            <td>操作</td>
       </tr>
    </table>
    <div style="border:2px; 
                border-color:#00CC00; 
                margin-left:20%;
                margin-top:20px">
        <input type="button" id="but" value="增加"/>
    </div>
</body>
</html>