class VictimUrlsController < ApplicationController
  # GET /victim_urls
  # GET /victim_urls.xml
  def index
    @victim_urls = current_user.victim_urls

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @victim_urls }
    end
  end

  # GET /victim_urls/1
  # GET /victim_urls/1.xml
  def show
    @victim_url = current_user.victim_urls.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @victim_url }
    end
  end

  def preview
    @victim_url = current_user.victim_urls.build(params[:victim_url])
    @victim_url.valid?
    render :layout => "preview"
  end

  # GET /victim_urls/new
  # GET /victim_urls/new.xml
  def new
    @victim_url = current_user.victim_urls.build(params[:victim_url])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @victim_url }
    end
  end

  # GET /victim_urls/1/edit
  def edit
    @victim_url = current_user.victim_urls.find(params[:id])
  end

  # POST /victim_urls
  # POST /victim_urls.xml
  def create
    @victim_url = current_user.victim_urls.build(params[:victim_url])

    respond_to do |format|
      if @victim_url.save
        format.html { redirect_to(@victim_url, :notice => 'Victim url was successfully created.') }
        format.xml  { render :xml => @victim_url, :status => :created, :location => @victim_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @victim_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /victim_urls/1
  # PUT /victim_urls/1.xml
  def update
    @victim_url = current_user.victim_urls.find(params[:id])

    respond_to do |format|
      if @victim_url.update_attributes(params[:victim_url])
        format.html { redirect_to(@victim_url, :notice => 'Victim url was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @victim_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /victim_urls/1
  # DELETE /victim_urls/1.xml
  def destroy
    @victim_url = current_user.victim_urls.find(params[:id])
    @victim_url.destroy

    respond_to do |format|
      format.html { redirect_to(victim_urls_url) }
      format.xml  { head :ok }
    end
  end

  def test_mail
    StalkerMailer.hello_email("rob.christie@eyestreet.com").deliver
    render :text => "Sent"
  end
end
