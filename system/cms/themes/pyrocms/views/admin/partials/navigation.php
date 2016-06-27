<style>
.top-link{
	font-size: 27px !important;
	color:#333333;
}

.c_custom{
	font-size:17px !important;
	color: #333333 !important;
}
.c_custom:hover{
	color: #FFFFFF !important;
}
.c_main_back{
	background-color:#ffffff !important;
	color: #333333 !important;
	
}
</style>
<ul class="primary-nav">
	
	<li id="dashboard-link"><?php echo anchor('admin', lang('global:dashboard'), 'class="top-link '.( ! $this->module ? 'current ' : '').'"') ?></li>

		<?php 

		// Display the menu items.
		// We have already vetted them for permissions
		// in the Admin_Controller, so we can just
		// display them now.
		foreach ($menu_items as $key => $menu_item)
		{
			if (is_array($menu_item))
			{
				if($key == 'Reports' || $key == 'Lists' )
					$style = 'style="width:450px !important;"'; 
				else
					$style = '';
					
				
				echo '<li><a href="'.current_url().'#" class="top-link">'.lang_label($key).'</a><ul class="c_main_back" '.$style.' >';

				foreach ($menu_item as $lang_key => $uri)
				{
					echo '<li><a href="'.site_url($uri).'" class="c_custom">'.lang_label($lang_key).'</a></li>';

				}

				echo '</ul></li>';

			}
			elseif (is_array($menu_item) and count($menu_item) == 1)
			{
				foreach ($menu_item as $lang_key => $uri)
				{
					echo '<li><a href="'.site_url($menu_item).'" class="top-link no-submenu">'.lang_label($lang_key).'</a></li>';
				}
			}
			elseif (is_string($menu_item))
			{
				echo '<li><a href="'.site_url($menu_item).'" class="top-link no-submenu">'.lang_label($key).'</a></li>';
			}

		}
	
		?>

</ul>