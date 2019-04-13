<?php

namespace App\Utilities;

class PasswordUtilities {
    public static function preparePasswordField($array) {
        if (array_key_exists('password', $array)) {
            if ($array['password'] == null || $array['password'] == '') {
                unset($array['password']); 
            }
        }
        return $array;
    }
}