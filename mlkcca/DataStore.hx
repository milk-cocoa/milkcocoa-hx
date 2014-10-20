package mlkcca;

typedef DSStatus = { err:String, path:String, id:String, value:Dynamic };

/**
 * データストア
 * @author あるる（きのもと 結衣）
 */
class DataStore
{
	/// データストア本体
	private var ds:Dynamic;

	/**
	 * コンストラクタ
	 * @param	ds	データストア本体
	 */
	public function new( ds:Dynamic )
	{
		this.ds = ds;
	}

	/**
	 * プッシュ
	 * @param	data		データ
	 * @param	callback	コールバック関数
	 */
	public function push( data:Dynamic, ?callback:DSStatus->Void ):Void
	{
		this.ds.push( data, callback );
	}

	/**
	 * セット
	 * @param	id		ID
	 * @param	data	データ
	 */
	public function set( id:String, data:Dynamic ):Void
	{
		this.ds.set( id, data );
	}

	/**
	 * 削除
	 * @param	id	ID
	 */
	public function remove( id:String ):Void
	{
		this.ds.remove( id );
	}

	/**
	 * 送る
	 * @param	data	データ
	 */
	public function send( data:Dynamic ):Void
	{
		this.ds.send( data );
	}

	/**
	 * イベントハンドラ登録
	 * @param	event		イベント文字列
	 * @param	callback	コールバック
	 */
	public function on( event:String, callback:DSStatus->Void ):Void
	{
		this.ds.on( event, callback );
	}

	/**
	 * イベントハンドラ解除
	 * @param	event		イベント文字列
	 */
	public function off( event:String ):Void
	{
		this.ds.off( event )
	}

	/**
	 * 取得
	 * @param	id			ID
	 * @param	callback	コールバック
	 */
	public function get( id:String, callback:Dynamic->Void ):Void
	{
		this.ds.get( id, callback );
	}

	/**
	 * クエリ
	 * @param	condition	条件
	 * @return	クエリ
	 */
	public function query( ?condition:Dynamic ):Query
	{
		return new Query( this.ds.query( condition ) );
	}

	/**
	 * 子ども
	 * @param	path	パス
	 * @return	データストア
	 */
	public function child( path:String ):DataStore
	{
		return new DataStore( this.ds.child( path ) );
	}

	/**
	 * 親取得
	 * @return	データストア
	 */
	public function parent( ):DataStore
	{
		return new DataStore( this.ds.parent( ) );
	}

	/**
	 * ルート取得
	 * @return	データストア
	 */
	public function root( ):DataStore
	{
		return new DataStore( this.ds.root( ) );
	}
}
