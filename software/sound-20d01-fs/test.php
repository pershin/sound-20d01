#!/usr/bin/php
<?php
define('SAMPLE_RATE', 48000);
define('SOUND20D01FS', __DIR__ . '/dist/Debug/GNU-Linux/sound-20d01-fs');
define('TMP_DIR', '/mnt/hdd/tmp/ramdisk/');

if (!file_exists(__DIR__ . '/list.xml')) {
    exit(1);
}

$list = simplexml_load_file(__DIR__ . '/list.xml');
$i = 0;
$prefix = uniqid();
$log = [];
$output = [];
$result_code = 0;

exec('mountpoint -q ' . TMP_DIR, $output, $result_code);

if ($result_code) {
    exec('sudo mount -t tmpfs -o size=4000M tmpfs ' . TMP_DIR, $output, $result_code);

    if ($result_code) {
        exit(2);
    }
}

unlink(TMP_DIR . 'data.bin');

if (!file_exists(TMP_DIR . 'data.bin')) {
    touch(TMP_DIR . 'data.bin');
    exec(SOUND20D01FS . ' --format');
}

foreach ($list->item as $item) {
    $filename = (string) $item->filename;
    $title = addcslashes((string) $item->title, "'");
    $tmp = TMP_DIR . 'tmp_' . $prefix . '-' . $i++ . '.pcm';
    $output = [];

    exec("ffmpeg -i '{$filename}' -ar " . SAMPLE_RATE . " -acodec pcm_s16le -f u16le -ac 2 '{$tmp}'");
    exec(SOUND20D01FS . " --add '{$tmp}' --title '{$title}'", $output);
    exec(SOUND20D01FS . " -o {$output[0]}", $output);

    $tmp_test = TMP_DIR . 'track' . $output[0] . '.pcm';

    echo implode(PHP_EOL, $output);

    $log[] = [
        'track' => $output[0],
        'filename' => $filename,
        'md5_in' => md5_file($tmp),
        'md5_out' => md5_file($tmp_test),
    ];

    unlink($tmp);
    unlink($tmp_test);
}

echo PHP_EOL, PHP_EOL, 'LOG', PHP_EOL, PHP_EOL;

ob_start();

foreach ($log as $log_item) {
    echo 'track:     ', $log_item['track'], PHP_EOL;
    echo 'filename:  ', $log_item['filename'], PHP_EOL;
    echo 'md5 (in):  ', $log_item['md5_in'], PHP_EOL;
    echo 'md5 (out): ', $log_item['md5_out'], PHP_EOL;

    if ($log_item['md5_in'] == $log_item['md5_out']) {
        echo 'OK', PHP_EOL;
    } else {
        echo 'ERROR', PHP_EOL;
    }

    echo PHP_EOL;
}

$log_data = ob_get_clean();

echo $log_data;

file_put_contents(TMP_DIR . date('d-m-Y-His') . '.log', $log_data);

//exec('sudo umount ' . TMP_DIR);
