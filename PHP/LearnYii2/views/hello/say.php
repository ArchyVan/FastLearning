<?php
/**
 * Created by PhpStorm.
 * User: ios
 * Date: 16/9/6
 * Time: 下午2:59
 */
use yii\helpers\Html;
?>
<h1><?= Html::encode($message) ?></h1>
<?php echo $this->render('about'); ?>

<?php $this->beginBlock('block1');?>
<h1>Index</h1>
<?php $this->endBlock(); ?>
