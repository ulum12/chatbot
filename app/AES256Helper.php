<?php
// app/AES256Helper.php

namespace App;

use Illuminate\Support\Facades\Crypt;

class AES256Helper
{
    public static function encrypt($data)
    {
        $encrypted = Crypt::encrypt($data);

        return $encrypted;
    }

    public static function decrypt($encryptedData)
    {
        return Crypt::decrypt($encryptedData);
    }
}
