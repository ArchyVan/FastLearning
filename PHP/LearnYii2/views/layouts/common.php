<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<!--    <h1>Hello Common</h1>-->
    <?php if (isset($this->blocks['block1'])):?>
        <?= $this->blocks['block1'];?>
    <?php else:?>
        <h1>hello Common</h1>
    <?php endif;?>
    <?= $content;?>
</body>
</html>
