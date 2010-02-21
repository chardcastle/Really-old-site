<?php
if ($EE_view_disable !== TRUE)
{
	$this->load->view('_shared/header');
	$this->load->view('_shared/main_menu');
	$this->load->view('_shared/sidebar');
	$this->load->view('_shared/breadcrumbs');
}
?>

<div id="mainContent"<?=$maincontent_state?>>
	<?php $this->load->view('_shared/right_nav')?>
	<?php if (isset($new_checksums) && is_array($new_checksums)): ?>
	<div class="contents">
		<div class="notice">
			<p><?=lang('checksum_changed_warning')?></p>
			<?php foreach($new_checksums as $path): ?>
			<?=NBS.NBS.NBS.NBS.NBS.$path; ?><br />
			<?php endforeach; ?>
		</div>
		
		<?php if ($this->session->userdata('group_id') == 1): ?>
		<p><span class="button"><a class="submit" href="<?=BASE.AMP.'C=homepage'.AMP.'M=accept_checksums'?>"><?=lang('checksum_changed_accept')?></a></p>
		<?php endif; ?>
		<div class="clear_left"></div>
	</div>
	<?php endif; ?>

<?php if ($can_access_content == TRUE): ?>

	<div class="contentMenu create">
		<div class="heading"><h2><?=lang('create')?></h2></div>
		<ul class="homeBlocks">
		<?php if ($this->session->userdata['can_access_content'] == 'y'):?>
			<li class="item"><a href="<?=BASE.AMP.'C=content_publish'?>" class="submenu accordion"><?=lang('entry')?></a>
				<ul class="submenu" style="display: none;">
					<?php if (! isset($cp_menu_items['content']['publish'])):?>
						<li><p><?=lang('no_channels_exist'); ?></p></li>
					<?php elseif (! is_array($cp_menu_items['content']['publish'])):?>
						<li><a href="<?=$cp_menu_items['content']['publish']?>" title="<?=lang('nav_publish')?>"><?=lang('nav_publish')?></a></li>
					<?php else:?>
						<li><p><?=$instructions?></p></li>
					<?php foreach($cp_menu_items['content']['publish'] as $channel_name => $uri):?>	   
							<li><a href="<?=$uri?>" title="<?=$channel_name?>"><?=$channel_name?></a></li>
						<?php endforeach; ?>
					<?php endif; ?>
				</ul>
			</li>
		<?php endif;?>
		<?php if ($this->session->userdata['can_admin_templates'] == 'y'):?>
			<li class="item"><a href="<?=BASE.AMP.'C=design'.AMP.'M=new_template'?>" class="submenu accordion"><?=lang('template')?></a>
				<ul class="submenu" style="display:none">
					<?php if (count($cp_menu_items['design']['templates']['edit_templates']) <= 1):?>
						<li><p><?=lang('no_templates_available')?></p></li>
					<?php else:?>
						<?php foreach ($cp_menu_items['design']['templates']['edit_templates'] as $template_group => $url):?>
							<?php if (is_array($url)):?>
							<li><a href="<?=$url[lang('nav_create_template')]?>"><?=lang($template_group)?></a></li>
							<?php endif;?>
						<?php endforeach;?>
					<?php endif;?>
				</ul>
			</li>
			<li class="group"><a href="<?=BASE.AMP.'C=design'.AMP.'M=new_template_group'?>"><?=lang('template_group')?></a></li>
		<?php endif;?>
		<?php if ($show_page_option):?>
			<li class="item"><a href="<?=BASE.AMP.'C=content_publish'?>" class="submenu accordion"><?=lang('page')?></a></li>
		<?php endif;?>
		<?php if ($this->session->userdata['can_admin_channels'] == 'y'):?>
			<li class="group"><a href="<?=BASE.AMP.'C=admin_content'.AMP.'M=channel_add'?>"><?=lang('channel')?></a></li>
		<?php endif;?>
		<?php if ($this->config->item('multiple_sites_enabled') == 'y' && $this->cp->allowed_group('can_admin_sites')):?>
			<li class="site"><a href="<?=BASE.AMP.'C=sites&M=manage_sites'?>"><?=lang('site')?></a></li>
		<?php endif;?>
		</ul>
	
	</div>
<?php endif; ?>
<?php if ($can_access_modify == TRUE): ?>
	<div class="contentMenu modify">
		<div class="heading"><h2><?=lang('modify')?> <span class="subtext"><?=lang('or_delete')?></span></h2></div>
		<ul class="homeBlocks">
			<li class="item"><a href="<?=BASE.AMP.'C=content_edit'?>"><?=lang('entry')?></a></li>
			<?php if ($can_access_templates): ?>
			<li class="item"><a href="<?=BASE.AMP.'C=design'.AMP.'M=manager'?>"><?=lang('template')?></a></li>
			<?php endif; ?>
			<?php if ($this->session->userdata['can_admin_templates'] == 'y'):?>			
			<li class="group"><a href="<?=BASE.AMP.'C=design'.AMP.'M=edit_template_group'?>" class="submenu"><?=lang('template_group')?></a></li>
			<?php endif;?>		
			<?php if ($show_page_option):?>
			<li class="group"><a href="<?=BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=pages'?>"><?=lang('page')?></a></li>
		<?php endif;?>
		<?php if ($cp_recent_ids['entry']): ?>
			<li class="group"><a href="<?=BASE.AMP.'C=content_publish'.AMP.'M=entry_form'.AMP.'channel_id='.$cp_recent_ids['entry']['channel_id'].AMP.'entry_id='.$cp_recent_ids['entry']['entry_id']?>"><?=lang('most_recent_entry')?></a></li>
		<?php endif;?>
		<?php if ($cp_recent_ids['comment']): ?>
			<li class="submission"><a href="<?=BASE.AMP.'C=content_edit'.AMP.'M=view_comment'.AMP.'comment_id='.$cp_recent_ids['comment']?>"><?=lang('most_recent_comment')?></a></li>
		<?php endif;?>
		</ul>
	</div>
	
<?php endif; ?>
	<div class="contentMenu view">
		<div class="heading"><h2><?=lang('view')?></h2></div>
		<ul class="homeBlocks">
			<li class="site"><?=anchor($this->config->item('base_url').$this->config->item('index_page').'?URL='.$this->config->item('base_url').$this->config->item('index_page'), lang('site'))?></li>
			<li class="submission"><a href="<?=BASE.AMP.'C=content_edit'.AMP.'M=show_recent_comments'.AMP.'count=10'?>" class="submenu"><?=lang('recent_comments')?></a></li>
			<li class="item"><a href="<?=BASE.AMP.'C=content_edit'.AMP.'M=show_recent_entries'.AMP.'count=10'?>" class="submenu"><?=lang('recent_entries')?></a></li>
			<li class="resource"><a rel="external" href="<?=config_item('doc_url')?>"><?=lang('user_guide')?></a></li>
			<li class="resource"><a rel="external" href="http://expressionengine.com/wiki/"><?=lang('ee_wiki')?></a></li>
		</ul>
	</div>

</div> <!-- mainContent -->


<?php
if ($EE_view_disable !== TRUE)
{
	$this->load->view('_shared/accessories');
	$this->load->view('_shared/footer');
}

/* End of file homepage.php */
/* Location: ./themes/cp_themes/default/homepage.php */