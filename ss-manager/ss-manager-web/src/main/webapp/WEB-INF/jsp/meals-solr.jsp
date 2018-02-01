<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>商品列表</title>
    </head>
        <div class="col-xs-12 column text-center">
			<button class="btn btn-info" onclick="importMealsSolr();">导入Solr索引库</button>
			<button class="btn btn-danger" onclick="cleanMealsSolr();">清空Solr索引库</button>
		</div>

		<script type="text/javascript">
			<%-- 导入meals的Solr索引库 --%>
			function importMealsSolr() {
				$.get('meals/importSolr', null, function(rm) {
					if (rm.bool)
						swal(rm.message, {buttons: false, timer: 1500});
				});
			}

			//清空meals的solr的索引库
			function cleanMealsSolr() {
				$.get('meals/cleanSolr', null, function(rm) {
					if (rm.bool)
						swal(rm.message, {buttons: false, timer: 1500});
				});
			}
		</script>
    </body>
</html>
