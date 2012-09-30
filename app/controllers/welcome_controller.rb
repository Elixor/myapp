# encoding: UTF-8

# COMMENT
# 1. Kontrolery se pojmenovavaji v mnoznem cislo, napr. UsersController, ContactsController
# 2. Nauc se pouzivat respond_to blok
#
#   respond_to do |format|
#     format.html { kod nebo zadny kod }
#   end
#
#   doc: http://api.rubyonrails.org/classes/ActionController/MimeResponds.html#method-i-respond_to
#
#   Mozna ti ted bude trochu unikat smysl, ale jakmile zacnes pridavat ajax, json, js apod. Bude se to hodit.
#   Prihodil jsem priklad
#
#   3. uvazuj REST! Kazdy kotroler ma svou ulohu a stara se pouze o jeden model (v idealnim pripade)
#     priklad. kontroller, ktery bude mit na starosti registrace bude RegistrationsController, 
#     kontroller pro prihlasovani bude SessionsController apod.
#
#     Vubec nevadi, kdyz ma kontroler jenom jednu akci, dulezite je udrzet kontrolery prehledne, tzv. jsou "dry"
#
#   4. na radku 1. jsem pridal tzv. "magic comment". Rika ruby, pomoci jakeho kodovani ma tento soubor cist.
#     kdyby tam nebyl, stacil byl jediny non-ASCII symbol a interpreter by tento soubor neprecetl. Doporucuju pouzivat,
#     protoze jsme v cechach a pouzivame hacky carky, tzv. accents. Mimo to, mame ceskou klavesnici a i nedopatrenim
#     (pouzitim klavesove zkratky) muzeme vlozit neviditelny znak, ktery je taky non-ASCII. UTF vi, ze je neviditelny,
#     tak ho ignoruje, ASCII ho nezna a vyhodi chybu

class WelcomeController < ApplicationController
  def index
#   respond_to do |format|
#     format.html
#   end
  end

  # viz poznamka o 3.
  def registration
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
    
#   respond_to do |block|
#     if @user.save
#       format.html { redirect_to root_url, :notice => "Signed up!" }
#     else
#       format.html { render "new" }
#     end
#   end

  end

end
