<anychart>
	<settings>
		<animation enabled="True"/>
	</settings>
	<charts>
		<chart plot_type="CategorizedVertical">
			<data_plot_settings default_series_type="line">
        <line_series point_padding="0.2" group_padding="1">
          <label_settings enabled="true">
            <background enabled="false" />
            <font color="Rgb(45,45,45)" bold="true" size="9">
              <effects enabled="true">
                <glow enabled="true" color="White" opacity="1" blur_x="1.5" blur_y="1.5" strength="3" />
              </effects>
            </font>
            <format enabled="false"></format>
          </label_settings>
          <tooltip_settings enabled="true">
            <format>mLabelFormat</format>
            <background>
              <border type="Solid" color="DarkColor(%Color)" />
            </background>
            <font color="DarkColor(%Color)" />
          </tooltip_settings>
          <marker_settings enabled="true" />
          <line_style>
            <line thickness="3" />
          </line_style>
        </line_series>
      </data_plot_settings>
			<chart_settings>
				<chart_background enabled="false">
	       	<border enabled="True" thickness="1" type="Gradient"></border>
	        <inside_margin  all="0" />
	    </chart_background>
				<title enabled="mTopFlag">
					<text>mTopTitle</text>
				</title>
				<legend enabled="True" position="bottom" align="Center" elements_align="Center">
		          <title enabled="false" />
		          <icon>
		            <marker enabled="true" type="%MarkerType" size="8" />
		          </icon>
		        </legend>
				<axes>
		         <x_axis>
		            <labels align="Inside" enabled="false" rotation="45"></labels>	
		            <title enabled="false">
		            </title>
		          </x_axis>	
		          <y_axis>
		            <title enabled="mYFlag">
		              <text>mYtitle</text>
		              <font color="#135D8C" />
		            </title>
		            <labels align="Inside">
		              <font color="#135D8C" />
		              <format>mFormateYTip</format>
		            </labels>
		          </y_axis>
		        </axes>
			</chart_settings>
			<data>
				mViewData
			</data>
		</chart>
	</charts>
</anychart>
			