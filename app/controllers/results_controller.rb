class ResultsController < ApplicationController
  # GET /results
  # GET /results.json
  def index
    @results = Result.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /resultsedit
  # GET /resultsedit.json
  def indexedit
    @results = Result.all

    respond_to do |format|
      format.html # indexedit.html.erb
      format.json { render json: @results }
    end
  end
  
  # GET /results/1
  # GET /results/1.json
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = Result.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
  end

  # POST /results
  # POST /results.json
  
  def create
    resultexists = Result.exists?(:encode => params[:payload])
    
    @result = Result.new
    @result.patient_id = params[:patient_id]
    @result.encode = params[:payload]

    if resultexists 
      @result.errors.add(:base, 'THANKS: The result was already transmitted and stored!')
    end
        
    require 'base64'

    aes = Aes.new('256', 'ecb')
    iv = '0123456789012345'
   
    begin
      key =  @result.patient.key
    rescue Exception
      @result.errors.add(:base, 'ERROR: The patient ID does not exist!')
    end
    
    encoded = @result.encode
    
    begin
      decoded = Base64.urlsafe_decode64(encoded)
    rescue Exception
      @result.errors.add(:base, 'ERROR: Something went wrong with decoding!')
    end  
    
    begin
      decrypted = aes.decrypt(decoded, key, iv)
    rescue Exception  
        @result.errors.add(:base, 'ERROR: Something went wrong with decryption!')
    end
    
    if not(decrypted.nil?)
      if not(decrypted.ascii_only?)
        @result.errors.add(:base, 'ERROR: Decryption result is not an ASCII text!')
      else
        @result.decode = decrypted         
      end
    end

    #return render :text => "Some errors occured: #{@result.errors.full_messages}"    
    #return render :text => "No errors occured: #{@result.errors.empty?}"    
    #return render :text => "Decrypted: #{@result.decode}"    
      
    #return render :text => "The decoded data is #{decoded.each_byte.map{|b| b.to_s(16)}.join(' ')}"    
    #return render :text => "The decrypted output is #{decrypted.each_byte.map{|b| b.to_s(16)}.join(' ')}"
        
    respond_to do |format|
      if not(@result.errors.empty?) 
        #format.html { redirect_to results_url }
        format.html { render action: "errord" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      elsif @result.save 
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "errord" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # ERRORD
  def errord
    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end
end
