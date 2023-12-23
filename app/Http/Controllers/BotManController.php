<?php

  

namespace App\Http\Controllers;

  

use BotMan\BotMan\BotMan;

use Illuminate\Http\Request;

use BotMan\BotMan\Messages\Incoming\Answer;
use BotMan\BotMan\Messages\Outgoing\Actions\Button;
use BotMan\BotMan\Messages\Outgoing\Question;
use Symfony\Component\Cache\Adapter\FilesystemAdapter;

use App\Models\M_Chatbot;
use App\Models\M_Total_Pertanyaan;
use DB;


class BotManController extends Controller

{

    /**

     * Place your BotMan logic here.

     */
    public $id;

    public function handle()

    {

        $botman = app('botman');


        $botman->hears('{message}', function($botman, $message) {
            
            $productName = explode(':', $message);

            $isProduk = strpos($message, 'Nama Produk');

            // Use preg_match_all to find all occurrences of strings within parentheses
            preg_match_all("/\((.*?)\)/", $message, $matches);

            // Extract the matched strings from the result
            if($matches[1]){
                $this->id = $matches[1][0];
            }

            $chatData = M_Chatbot::where('pertanyaan', 'like', '%'.$message.'%') -> first();

            if ($message == 'hi') {

                $this->askName($botman);

            }else if ($isProduk) {

                $this->askProduk($botman);

            }else{
                if($chatData){
                    $botman->reply($chatData['jawaban']);
                }
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


    public function askProduk($botman)

    {
        $question = Question::create("Apakah anda tertarik dengan produk /  barang ini?")
                    ->fallback("Unable to help at this time, please try again later")
                    ->callbackId("choose_query")
                    ->addButtons([
                        Button::create("Iya")->value("1_".$this->id),
                        Button::create("Tidak")->value("0_".$this->id),
                    ]);

        $botman->ask($question, function (Answer $answer, $botman) {
            // Detect if button was clicked:
            if ($answer->isInteractiveMessageReply()) {
                $q = explode('_', $answer->getValue()) ;
                $answer = $q[0];
                $id = $q[1];
                if ($answer == '1') {

                    // Create Total
                    $Nquestion = new M_Total_Pertanyaan();
                    $Nquestion -> barang_id = $id;
                    $Nquestion -> liked = $answer;
                    $Nquestion -> save();

                    $question = Question::create("ingin menanyakan sesuatu ?")
                        ->fallback("Unable to ask question")
                        ->callbackId("I can not understand this")
                        ->addButtons([
                            Button::create('Stok')->value('Stok'),
                            Button::create('Lokasi')->value('Location'),
                            Button::create('Cara Packing')->value('Packaging'),
                        ]);

                    $botman->ask($question, function (Answer $answer, $botman) {
                        if ($answer->isInteractiveMessageReply()) {
                            $botName = $answer->getText();
                            $chatData = M_Chatbot::where('nama_bot', 'like', '%'.$botName.'%') -> first();

                            if($chatData){
                                $botman->say($chatData['jawaban']);
                            }
                        }

                    });
                } else if ($answer == '0') {
                    // Create Total
                    $Nquestion = new M_Total_Pertanyaan();
                    $Nquestion -> barang_id = $id;
                    $Nquestion -> liked = $answer;
                    $Nquestion -> save();

                    $botman->say('Baik Terimakasih');
                }

            } else {
                $chatData = M_Chatbot::where('pertanyaan', 'like', '%'.$message.'%') -> first();
                if($chatData){
                    $botman->reply($chatData['jawaban']);
                }
            }
        });
    }
}