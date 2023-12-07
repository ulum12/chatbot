<?php

  

namespace App\Http\Controllers;

  

use BotMan\BotMan\BotMan;

use Illuminate\Http\Request;

use BotMan\BotMan\Messages\Incoming\Answer;

use App\Models\M_Chatbot;
  

class BotManController extends Controller

{

    /**

     * Place your BotMan logic here.

     */

    public function handle()

    {

        $botman = app('botman');

  

        $botman->hears('{message}', function($botman, $message) {

            $chatData = M_Chatbot::where('pertanyaan', 'like', '%'.$message.'%') -> first();
            
            if ($message == 'hi') {

                $this->askName($botman);

            }else{

                $botman->reply(json_encode($chatData->jawaban));

            }

  

        });

  

        $botman->listen();

    }

  

    /**

     * Place your BotMan logic here.

     */

    public function askName($botman)

    {

        $botman->ask('Hello! What is your Name?', function(Answer $answer) {

  

            $name = $answer->getText();

  

            $this->say('Nice to meet you '.$name);

        });

    }

}