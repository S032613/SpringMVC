var userpage = {
    upsertData: function() {
        var username = $("#username").val();
        var useremail = $("#useremail").val();
        var userphone= $("#userphone").val();
        var usercity= $("#usercity").val();
       

        var param = {
            "name": username,
            "email": useremail,
            "phone": userphone,
            "city": usercity,
        };

        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(param),
            url: 'insertexceldata',
            method: 'POST',
            beforeSend: function() {
                $("#loading").show();
            },
            statusCode: {
                200: function(data) {
                    $.notify({
                        message: data.responseText
                    }, {
                        type: 'success'
                    });
                    tbl.ajax.reload();
                    ticketPage.reset();
                },
                201: function(data) {
                    $.notify({
                        message: data.responseText
                    }, {
                        type: 'success'
                    });
                  }
            }
        });
    }
};
