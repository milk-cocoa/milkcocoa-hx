package mlkcca;

typedef MilkUserData = { email:String, option:Dynamic, id:String };

/**
 * MilkCocoa Haxe/JSバインド
 * @author あるる（きのもと 結衣）
 */
class MilkCocoa
{
	/// MilkCocoaのインスタンス
	private var mc:Dynamic;
	/// 接続済みか？
	public var connected:Bool;

	/**
	 * コンストラクタ
	 * @param	id			アプリID
	 * @param	callBack	成功時のコールバック関数
	 */
	public function new( id:String, ?callback:Void->Void ) 
	{
		var f = function( ) {
			this.connected = true;
			if( callback != null ) callback( );
		};
		var url = 'https://' + id + '.mlkcca.com';

		this.connected = false;
		this.mc = untyped __js__("new MilkCocoa( url, f )");
	}

	/**
	 * データストア取得
	 * @param	path	パス
	 * @return	データストア
	 */
	public function dataStore( path:String ):DataStore
	{
		return new DataStore( this.mc.dataStore( path ) );
	}

	/**
	 * アカウント追加
	 * @param	email		メールアドレス
	 * @param	password	パスワード
	 * @param	options		オプション
	 * @param	callback	コールバック
	 */
	public function addAccount( email:String, password:String, ?options:Dynamic, ?callback:Int->MilkUserData->Void ):Void
	{
		this.mc.addAccount( email, password, options, callback );
	}

	/**
	 * ログイン
	 * @param	email		メールアドレス
	 * @param	password	パスワード
	 * @param	callback	コールバック
	 */
	public function login( email:String, password:String, callback:Int->MilkUserData->Void ):Void
	{
		this.mc.login( email, password, callback );
	}

	/**
	 * ログアウト
	 * @param	callback	コールバック
	 */
	public function logout( callback:Int->Void ):Void
	{
		this.mc.logout( callback );
	}

	/**
	 * ユーザー情報取得
	 * @param	callback	コールバック
	 */
	public function getCurrentUser( callback:Int->MilkUserData->Void ):Void
	{
		this.mc.getCurrentUser( callback );
	}
}
