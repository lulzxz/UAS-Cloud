<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Member;
use Illuminate\Contracts\Session\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session as FacadesSession;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{

    public function index()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {

        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $credentials = request(['email', 'password']);


        if (auth()->attempt($credentials)) {
            $token = Auth::guard('api')->attempt($credentials);
            return response()->json([
                'success' => true,
                'message' => 'Login Berhasil'
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Email Atau Password Salah'
        ]);
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_member' => 'required',
            'no_hp' => 'required',
            'email' => 'required|email',
            'password' => 'required|same:konfirmasi_password',
            'konfirmasi_password' => 'required|same:password',

        ]);

        if ($validator->fails()) {
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input = $request->all();
        $input['password'] = bcrypt($request->password);
        unset($input['konfirmasi_password']);
        $Member = Member::create($input);

        return response()->json([
            'message' => 'success',
            'data' => $Member
        ]);
    }

    public function login_member()
    {
        return view('auth.login_member');
    }

    public function login_member_action(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            Session()->flash('errors', $validator->errors()->toArray());
            return redirect('/login_member');
        }

        $credentials = $request->only('email', 'password');
        $member = Member::where('email', $request->email)->first();

        if ($member) {
            if (Auth::guard('webmember')->attempt($credentials)) {
                $request->session()->regenerate();
                return redirect('/');
            } else {
                Session()->flash('failed', "Password salah");
                return redirect('/login_member');
            }
        } else {
            Session()->flash('failed', "Email Tidak ditemukan");
            return redirect('/login_member');
        }
    }

    public function register_member()
    {
        return view('auth.register_member');
    }

    public function register_member_action(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_member' => 'required',
            'no_hp' => 'required',
            'email' => 'required|email',
            'password' => 'required|same:konfirmasi_password',
            'konfirmasi_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            session()->flash('errors', $validator->errors()->toArray());
            return redirect('/register_member');
        }

        $input = $request->all();
        $input['password'] = bcrypt($request->password);
        unset($input['konfirmasi_password']);
        Member::create($input);
        session()->flash('success', 'Akun Berhasil Dibuat');

        return redirect('/login_member');
    }

    public function logout()
    {
        FacadesSession::flush();
        return redirect('/login');
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */

    public function logout_member()
    {
        FacadesSession::flush();
        return redirect('/login_member');
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
}
