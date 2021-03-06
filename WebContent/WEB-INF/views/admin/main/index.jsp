<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- top tiles -->
<div class="row tile_count">
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
		<span class="count_top"><i class="fa fa-user"></i> Total Users</span>
		<div class="count">2500</div>
		<span class="count_bottom"><i class="green">4% </i> From last
			Week</span>
	</div>
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
		<span class="count_top"><i class="fa fa-clock-o"></i> Average
			Time</span>
		<div class="count">123.50</div>
		<span class="count_bottom"><i class="green"><i
				class="fa fa-sort-asc"></i>3% </i> From last Week</span>
	</div>
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
		<span class="count_top"><i class="fa fa-user"></i> Total Males</span>
		<div class="count green">2,500</div>
		<span class="count_bottom"><i class="green"><i
				class="fa fa-sort-asc"></i>34% </i> From last Week</span>
	</div>
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
		<span class="count_top"><i class="fa fa-user"></i> Total
			Females</span>
		<div class="count">4,567</div>
		<span class="count_bottom"><i class="red"><i
				class="fa fa-sort-desc"></i>12% </i> From last Week</span>
	</div>
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
		<span class="count_top"><i class="fa fa-user"></i> Total
			Collections</span>
		<div class="count">2,315</div>
		<span class="count_bottom"><i class="green"><i
				class="fa fa-sort-asc"></i>34% </i> From last Week</span>
	</div>
	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
		<span class="count_top"><i class="fa fa-user"></i> Total
			Connections</span>
		<div class="count">7,325</div>
		<span class="count_bottom"><i class="green"><i
				class="fa fa-sort-asc"></i>34% </i> From last Week</span>
	</div>
</div>
<!-- /top tiles -->

<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="dashboard_graph">

			<div class="row x_title">
				<div class="col-md-6">
					<h3>
						Network Activities <small>Graph title sub-title</small>
					</h3>
				</div>
				<div class="col-md-6">
					<div id="reportrange" class="pull-right"
						style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span>June
							9, 2018 - July 8, 2018</span> <b class="caret"></b>
					</div>
				</div>
			</div>

			<div class="col-md-9 col-sm-9 col-xs-12">
				<div id="placeholder33" style="height: 260px; display: none"
					class="demo-placeholder"></div>
				<div style="width: 100%;">
					<div id="canvas_dahs" class="demo-placeholder"
						style="width: 100%; height: 270px; padding: 0px; position: relative;">
						<canvas class="flot-base" width="617" height="270"
							style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 617px; height: 270px;"></canvas>
						<div class="flot-text"
							style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
							<div class="flot-x-axis flot-x1-axis xAxis x1Axis"
								style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
								<div class="flot-tick-label tickLabel"
									style="position: absolute; max-width: 121px; top: 254px; left: 84px; text-align: center;">Jan
									02</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; max-width: 121px; top: 254px; left: 180px; text-align: center;">Jan
									03</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; max-width: 121px; top: 254px; left: 276px; text-align: center;">Jan
									04</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; max-width: 121px; top: 254px; left: 372px; text-align: center;">Jan
									05</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; max-width: 121px; top: 254px; left: 467px; text-align: center;">Jan
									06</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; max-width: 121px; top: 254px; left: 564px; text-align: center;">Jan
									07</div>
							</div>
							<div class="flot-y-axis flot-y1-axis yAxis y1Axis"
								style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 242px; left: 13px; text-align: right;">0</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 223px; left: 7px; text-align: right;">10</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 204px; left: 7px; text-align: right;">20</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 186px; left: 7px; text-align: right;">30</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 167px; left: 7px; text-align: right;">40</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 149px; left: 7px; text-align: right;">50</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 130px; left: 7px; text-align: right;">60</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 112px; left: 7px; text-align: right;">70</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 93px; left: 7px; text-align: right;">80</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 75px; left: 7px; text-align: right;">90</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 56px; left: 1px; text-align: right;">100</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 38px; left: 2px; text-align: right;">110</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 19px; left: 1px; text-align: right;">120</div>
								<div class="flot-tick-label tickLabel"
									style="position: absolute; top: 1px; left: 1px; text-align: right;">130</div>
							</div>
						</div>
						<canvas class="flot-overlay" width="617" height="270"
							style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 617px; height: 270px;"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-12 bg-white">
				<div class="x_title">
					<h2>Top Campaign Performance</h2>
					<div class="clearfix"></div>
				</div>

				<div class="col-md-12 col-sm-12 col-xs-6">
					<div>
						<p>Facebook Campaign</p>
						<div class="">
							<div class="progress progress_sm" style="width: 76%;">
								<div class="progress-bar bg-green" role="progressbar"
									data-transitiongoal="80" aria-valuenow="79" style="width: 80%;"></div>
							</div>
						</div>
					</div>
					<div>
						<p>Twitter Campaign</p>
						<div class="">
							<div class="progress progress_sm" style="width: 76%;">
								<div class="progress-bar bg-green" role="progressbar"
									data-transitiongoal="60" aria-valuenow="59" style="width: 60%;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-6">
					<div>
						<p>Conventional Media</p>
						<div class="">
							<div class="progress progress_sm" style="width: 76%;">
								<div class="progress-bar bg-green" role="progressbar"
									data-transitiongoal="40" aria-valuenow="39" style="width: 40%;"></div>
							</div>
						</div>
					</div>
					<div>
						<p>Bill boards</p>
						<div class="">
							<div class="progress progress_sm" style="width: 76%;">
								<div class="progress-bar bg-green" role="progressbar"
									data-transitiongoal="50" aria-valuenow="49" style="width: 50%;"></div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="clearfix"></div>
		</div>
	</div>

</div>
<br>
