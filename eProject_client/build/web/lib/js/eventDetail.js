var currentImage;
var currentIndex = -1;
var interval;
function showImage(index) {
    if (index < $('#bigPic img').length) {
        var indexImage = $('#bigPic img')[index]
        if (currentImage) {
            if (currentImage != indexImage) {
                $(currentImage).css('z-index', 2);
                clearTimeout(myTimer);
                $(currentImage).fadeOut(250, function () {
                    myTimer = setTimeout("showNext()", 3000);
                    $(this).css({'display': 'none', 'z-index': 1})
                });
            }
        }
        $(indexImage).css({'display': 'block', 'opacity': 1});
        currentImage = indexImage;
        currentIndex = index;
        $('#thumbs li').removeClass('active');
        $($('#thumbs li')[index]).addClass('active');
    }
}


$(document).ready(function () {
    $("select").change(function () {
        var elementSelect = $('#selected').val();
        if (elementSelect == 1) {
            $('#codeBank').show();
        } else {
            $('#codeBank').hide();
        }
    });
});


function showNext() {
    var len = $('#bigPic img').length;
    var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
    showImage(next);
}

var myTimer;

$(document).ready(function () {
    myTimer = setTimeout("showNext()", 3000);
    showNext(); //loads first image
    $('#thumbs li').bind('click', function (e) {
        var count = $(this).attr('rel');
        showImage(parseInt(count) - 1);
    });
});


$(document).ready(function () {
    $('.a_demo_two').click(function () {
        var modalBox = $(this).attr('href');
        $(modalBox).fadeIn("slow");
        $('body').append('<div id="over"></div>');
        $('#over').fadeIn(300);

        var a = $(this).html();
        $('label[for=price]').html(a);
        $('input[name=price]').val(a);

        var pId = $(this).attr('id');
        $('#pId').val(pId);
        return false;

        var ticketCode = $('#ticketCode').val();
        $('label[for=ticketcode]').html(ticketCode);
    });

    // khi click đóng hộp thoại
    $(document).on('click', "a.close, #over", function () {
        $('#over, .paymentJoin').fadeOut(300, function () {
            $('#over').remove();
        });
        return false;
    });
});
