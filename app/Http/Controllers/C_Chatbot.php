<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\File; 

use App\Models\M_Chatbot;

class C_Chatbot extends Controller
{
    public function dataChatbotPage()
    {
        $dataChatbot = M_Chatbot::all();
        $dr = ['dataChatbot' => $dataChatbot];
        return view('main.chatbot.index', $dr);
    }

    public function prosesTambahChatbot(Request $request)
    {
        // {'nama':nama, 'harga':harga, 'kategori':kategori}
        $chatbot = new M_Chatbot();
        $chatbot -> nama_bot = $request -> nama;
        $chatbot -> pertanyaan = $request -> pertanyaan;
        $chatbot -> jawaban = $request -> jawaban;
        $chatbot -> jawaban_salah = $request -> jawaban_salah;
        $chatbot -> active = "1";
        $chatbot -> save();
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }
    public function getDataChatbotRes(Request $request)
    {
        $dataChatbot = M_Chatbot::where('id', $request -> idChatbot) -> first();
        return \Response::json($dataChatbot);
    }
    public function prosesUpdateChatbot(Request $request)
    {
        M_Chatbot::where('id', $request -> kdChatbot) -> update([
            'nama_bot' => $request -> nama,
            'pertanyaan' => $request -> pertanyaan,
            'jawaban' => $request -> jawaban,
            'jawaban_salah' => $request -> jawaban_salah,
        ]);
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }
    public function prosesHapusChatbot(Request $request)
    {
        M_Chatbot::where('id', $request -> idChatbot) -> delete();
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }
}
