#!/usr/bin/php
<?php
define('DEV_PATH', '/dev/sdc');
define('SAMPLE_RATE', 48000);
define('SOUND20D01FS', 'sudo ' . __DIR__ . '/dist/Debug/GNU-Linux/sound-20d01-fs -p ' . DEV_PATH);
define('SLICE', __DIR__ . '/../slice/dist/Debug/GNU-Linux/slice');
define('TMP_DIR', '/mnt/hdd/tmp/ramdisk/');
define('AUDIO_DIR', '/mnt/hdd/tmp/audio/');

$list = include AUDIO_DIR . 'config.inc.php';

$output = [];
$result_code = 0;

exec('mountpoint -q ' . TMP_DIR, $output, $result_code);

if ($result_code) {
    exec('sudo mount -t tmpfs -o size=4000M tmpfs ' . TMP_DIR, $output, $result_code);

    if ($result_code) {
        exit(2);
    }
}

foreach ($list as $item) {
    $tmp_file = TMP_DIR . $item['file'] . '.pcm';

    exec('ffmpeg -i ' . AUDIO_DIR . $item['file'] . ' -acodec pcm_s16le -f s16le ' . $tmp_file);

    foreach ($item['index'] as $key => $index) {
        $track_file = TMP_DIR . 'track-' . ($key + 1) . '.pcm';
        $dest = TMP_DIR . 'track_' . SAMPLE_RATE . '-' . ($key + 1) . '.pcm';
        exec(SLICE . ' ' . $tmp_file . ' ' . $track_file . ' ' . $index[0] . ' ' . $index[1]);
        exec('ffmpeg -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -i ' . $track_file . ' -ar ' . SAMPLE_RATE . ' -ac 2 -acodec pcm_s16le -f s16le ' . $dest);
        unlink($track_file);

        exec(SOUND20D01FS . " --add '{$dest}' --title '{$item['dir']}-t{$key}'", $output);

        print_r($output);

        unlink($dest);
    }

    unlink($tmp_file);
}
