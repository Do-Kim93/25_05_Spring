$('select[data-value]').each(function(index, el) {
	const $el = $(el);

	defaultValue = $el.attr('data-value').trim();

	if (defaultValue.length > 0) {
		$el.val(defaultValue);
	}
});
$(function(){
    $('#likeBtn').click(function(){
        const $btn = $(this);
        const articleId = $btn.data('article-id');

        $.getJSON('/usr/article/doToggleLike', { id: articleId }, function(data){
            if (data.resultCode.startsWith('S-')) {
                $('#likeCount').html(data.data1);
                // 버튼 텍스트 토글
                if (data.resultCode === 'S-1') {
                    $btn.text('좋아요 취소');
                } else {
                    $btn.text('좋아요');
                }
            } else {
                alert(data.msg);
            }
        });
    });
});