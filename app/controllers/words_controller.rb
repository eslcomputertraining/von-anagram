get '/words' do
  @page="home"
  @words = Word.all.order(text: :asc)

  erb :"/words/index"
end

get '/words/new' do
  @page="newword"
  @word = Word.new
    erb :"/words/new"
end

post '/words' do
  @page="newword"
  
    @word = Word.create(text: params[:text])

    if @word.valid?
        @word.save
        redirect "/words/#{@word.id}"
     else
        @errors = "Try another word not already in our dictionary."
    end
  erb :"/words/new"
end

get '/words/:id/edit' do
  @page="answer"
  @word = Word.find(params[:id])
  erb :"/words/edit"
end

put '/words/:id' do
  @page="newword"
  @word = Word.find(params[:id])
  @word.text = params[:text]

 if @word.valid?
     @word.save
     redirect "/words/#{@word.id}"
  else
     @errors = "Try another word not already in our dictionary."
 end
  erb :"/words/edit"
end

get '/words/:id' do
  @page="answer"
  @word = Word.find(params[:id])
  @anagrams = Word.find_anagrams(@word.text)
  erb :"/words/show"
end

delete '/words/:id' do
  word = Word.find(params[:id])
  word.delete
  redirect "/words"
end

