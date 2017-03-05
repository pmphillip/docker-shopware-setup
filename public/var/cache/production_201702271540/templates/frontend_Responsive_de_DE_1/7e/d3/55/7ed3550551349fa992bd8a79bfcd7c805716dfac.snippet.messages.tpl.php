<?php /* Smarty version Smarty-3.1.12, created on 2017-03-05 11:09:45
         compiled from "/var/www/html/themes/Frontend/Bare/frontend/_includes/messages.tpl" */ ?>
<?php /*%%SmartyHeaderCode:144777821958bbe3e9147708-05633246%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7ed3550551349fa992bd8a79bfcd7c805716dfac' => 
    array (
      0 => '/var/www/html/themes/Frontend/Bare/frontend/_includes/messages.tpl',
      1 => 1488206436,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '144777821958bbe3e9147708-05633246',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'type' => 0,
    'icon' => 0,
    'borderRadius' => 0,
    'bold' => 0,
    'visible' => 0,
    'hasBorderRadius' => 0,
    'isVisible' => 0,
    'iconCls' => 0,
    'isBold' => 0,
    'content' => 0,
    'list' => 0,
    'entry' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_58bbe3e91cc831_94876421',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58bbe3e91cc831_94876421')) {function content_58bbe3e91cc831_94876421($_smarty_tpl) {?>



    <?php $_smarty_tpl->tpl_vars['iconCls'] = new Smarty_variable('icon--check', null, 0);?>
    <?php if ($_smarty_tpl->tpl_vars['type']->value=='error'){?>
        <?php $_smarty_tpl->tpl_vars['iconCls'] = new Smarty_variable('icon--cross', null, 0);?>
    <?php }elseif($_smarty_tpl->tpl_vars['type']->value=='success'){?>
        <?php $_smarty_tpl->tpl_vars['iconCls'] = new Smarty_variable('icon--check', null, 0);?>
    <?php }elseif($_smarty_tpl->tpl_vars['type']->value=='warning'){?>
        <?php $_smarty_tpl->tpl_vars['iconCls'] = new Smarty_variable('icon--warning', null, 0);?>
    <?php }else{ ?>
        <?php $_smarty_tpl->tpl_vars['iconCls'] = new Smarty_variable('icon--info', null, 0);?>
    <?php }?>

    
    <?php if (isset($_smarty_tpl->tpl_vars['icon']->value)&&count($_smarty_tpl->tpl_vars['icon']->value)){?>
        <?php $_smarty_tpl->tpl_vars['iconCls'] = new Smarty_variable($_smarty_tpl->tpl_vars['icon']->value, null, 0);?>
    <?php }?>




    <?php $_smarty_tpl->tpl_vars['hasBorderRadius'] = new Smarty_variable(true, null, 0);?>
    <?php if (isset($_smarty_tpl->tpl_vars['borderRadius']->value)){?>
        <?php $_smarty_tpl->tpl_vars['hasBorderRadius'] = new Smarty_variable($_smarty_tpl->tpl_vars['borderRadius']->value, null, 0);?>
    <?php }?>




    <?php $_smarty_tpl->tpl_vars['isBold'] = new Smarty_variable(false, null, 0);?>
    <?php if (isset($_smarty_tpl->tpl_vars['bold']->value)){?>
        <?php $_smarty_tpl->tpl_vars['isBold'] = new Smarty_variable($_smarty_tpl->tpl_vars['bold']->value, null, 0);?>
    <?php }?>




    <?php $_smarty_tpl->tpl_vars['isVisible'] = new Smarty_variable(true, null, 0);?>
    <?php if (isset($_smarty_tpl->tpl_vars['visible']->value)){?>
        <?php $_smarty_tpl->tpl_vars['isVisible'] = new Smarty_variable($_smarty_tpl->tpl_vars['visible']->value, null, 0);?>
    <?php }?>




    <div class="alert is--<?php echo $_smarty_tpl->tpl_vars['type']->value;?>
<?php if ($_smarty_tpl->tpl_vars['hasBorderRadius']->value&&$_smarty_tpl->tpl_vars['hasBorderRadius']->value===true){?> is--rounded<?php }?><?php if ($_smarty_tpl->tpl_vars['isVisible']->value===false){?> is--hidden<?php }?>">

        
        
            <div class="alert--icon">
                <i class="icon--element <?php echo $_smarty_tpl->tpl_vars['iconCls']->value;?>
"></i>
            </div>
        

        
        
            <div class="alert--content<?php if ($_smarty_tpl->tpl_vars['isBold']->value){?> is--strong<?php }?>">
                <?php if ($_smarty_tpl->tpl_vars['content']->value&&!$_smarty_tpl->tpl_vars['list']->value){?>
                    <?php echo $_smarty_tpl->tpl_vars['content']->value;?>

                <?php }else{ ?>
                    <ul class="alert--list">
                        <?php  $_smarty_tpl->tpl_vars['entry'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['entry']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['entry']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['entry']->iteration=0;
 $_smarty_tpl->tpl_vars['entry']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['entry']->key => $_smarty_tpl->tpl_vars['entry']->value){
$_smarty_tpl->tpl_vars['entry']->_loop = true;
 $_smarty_tpl->tpl_vars['entry']->iteration++;
 $_smarty_tpl->tpl_vars['entry']->index++;
 $_smarty_tpl->tpl_vars['entry']->first = $_smarty_tpl->tpl_vars['entry']->index === 0;
 $_smarty_tpl->tpl_vars['entry']->last = $_smarty_tpl->tpl_vars['entry']->iteration === $_smarty_tpl->tpl_vars['entry']->total;
?>
                            <li class="list--entry<?php if ($_smarty_tpl->tpl_vars['entry']->first){?> is--first<?php }?><?php if ($_smarty_tpl->tpl_vars['entry']->last){?> is--last<?php }?>"><?php echo $_smarty_tpl->tpl_vars['entry']->value;?>
</li>
                        <?php } ?>
                    </ul>
                <?php }?>
            </div>
        
    </div>
<?php }} ?>