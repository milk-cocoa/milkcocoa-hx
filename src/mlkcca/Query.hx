package mlkcca;

/**
 * クエリ
 * @author あるる（きのもと 結衣）
 */
class Query
{
	/// クエリ本体
	private var q:Dynamic;

	/**
	 * コンストラクタ
	 * @param	q	クエリ
	 */
	public function new( q:Dynamic )
	{
		this.q = q;
	}

	/**
	 * データ取得開始
	 * @param	callback	コールバック
	 */
	public function done( callback:Array<Dynamic>->Void ):Void
	{
		this.q.done( callback );
	}

	/**
	 * 取得数制限
	 * @param	number	数
	 * @return	条件を付加したクエリ
	 */
	public function limit( number:Int ):Query
	{
		return new Query( this.q.limit( number ) );
	}

	/**
	 * 指定数だけ読み飛す
	 * @param	index	数
	 * @return	条件を付加したクエリ
	 */
	public function skip( index:Int ):Query
	{
		return new Query( this.q.skip( index ) );
	}

	/**
	 * ソート
	 * @param	mode	モード asc/desc
	 * @return	クエリ
	 */
	public function sort( mode:String ):Query
	{
		return new Query( this.q.sort( mode ) );
	}
}
