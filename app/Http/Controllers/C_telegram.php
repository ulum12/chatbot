<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Telegram\Bot\FileUpload\InputFile;

use Telegram\Bot\Laravel\Facades\Telegram;
use App\Http\Controllers\C_telegram;

use App\Models\M_Chatbot;

class C_telegram extends Controller
{
    public function updatedActivity()
     {
        $activity = Telegram::getUpdates();
        dd($activity);
     }


     public function setWebhook(){
        $response = Telegram::setWebhook(['url' => env('TELEGRAM_WEBHOOK_URL')]);
     }

     public function commandHandlerWebHook(){
        $updates = Telegram::commandsHandler(true);
        $chatId = $updates->getChat()->getId();
        $username = $updates->getChat()->getFirstName();
        $message = $updates->getMessage()->getText();
        // $message = 'ready';//$updates->getMessage()->getText();

        if ($message === '/start' || $message === '/help') {
            return Telegram::sendMessage(
                        [
                            'chat_id' => $chatId,
                            'text' => 'Hallo Selamat datang di toko kami '
                        ]
                    );
        }

        //get answer on tbl_bot
        $chatData = M_Chatbot::where('pertanyaan', 'like', '%'.$message.'%') -> first();
        
        // dd($chatData->jawaban);

        // get stok ready or not ready on tbl_produk

        if ($chatData) {
            return Telegram::sendMessage(
                        [
                            'chat_id' => $chatId,
                            'text' => $chatData->jawaban
                        ]
                    );
        }else{
            return Telegram::sendMessage(
                        [
                            'chat_id' => $chatId,
                            'text' => 'Hallo Selamat datang di toko kami '. $username
                        ]
                    );
        }
        

     }

     public function sendMessage()
     {
         return view('telegramView');
     }

     public function storeMessage(Request $request)
     {
         $request->validate([
             'name' => 'required',
             'message' => 'required'
         ]);

         $text =  "<b>Name: </b>\n"
             . "$request->name\n"
             . "<b>Message: </b>\n"
             . $request->message;

         Telegram::sendMessage([
             'chat_id' => '-1001484286124',
             'parse_mode' => 'HTML',
             'text' => $text
         ]);

         return redirect()->back();
     }

     public function storePhoto(Request $request)
     {
         $request->validate([
             'file' => 'file|mimes:jpeg,png,gif'
         ]);

         $photo = $request->file('file');

         Telegram::sendPhoto([
             'chat_id' => '-1001484286124',
             'photo' => InputFile::createFromContents(file_get_contents($photo->getRealPath()), str_random(10) . '.' . $photo->getClientOriginalExtension()),
             'caption' => 'Photo Image'
         ]);

         return redirect()->back();
     }


}
