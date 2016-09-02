<?php
 
$type = $_POST['type'];
$data = '';
 
if (isset($type) && is_numeric($type) && $type >= 0) {
    if ($type == 1) {
        $data = array(
            'type' => $type, 
            'name' => '标哥的技术博客',
            'site' => 'www.huangyibiao.com');
    } else if ($type == 2) {
        $data = array(
            'type' => $type, 
            'name' => '公众号：标哥的技术博客',
            'site' => 'weixin search: biaogedejishuboke');
    } 
 
    $response = array(
        'code'    => 200, 
        'message' => 'success for request',
        'data'    => $data,
        );
 
    echo json_encode($response);
    return;
} 
 
$response = array(
    'code'    => 999, 
    'message' => 'argument error for request',
    'data'    => $data,
    );
 
echo json_encode($response);