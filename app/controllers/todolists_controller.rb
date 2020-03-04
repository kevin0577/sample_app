class TodolistsController < ApplicationController
  def new
  	# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
        @list = List.new
  end

  def index
    @lists = List.all
    end

    def show
      @list = List.find(params[:id])
      end

  def create
        # ストロングパラメーターを使用
         list = List.new(list_params)
        # DBへ保存する
         list.save
        # トップ画面へリダイレクト
        redirect_to '/top'
    end
    def create
        list = List.new(list_params)
        list.save # データベースへ保存する

        redirect_to todolist_path(list.id) # 詳細画面へリダイレクト
        end

    private

    def list_params
        params.require(:list).permit(:title, :body)
    end
end
