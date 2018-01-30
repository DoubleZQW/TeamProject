<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>商品列表</title>
    </head>
        <div class="col-xs-12 column text-center">
			<button class="btn btn-info" onclick="importMealSolr();">导入Solr索引库</button>
		</div>

		<script type="text/javascript">
			function importMealSolr() {
				$.get('meal/importSolr', null, function(rm) {
					if (rm.bool)
						swal(rm.message, {buttons: false, timer: 1500});
				});
			}
		</script>
    </body>
</html>
