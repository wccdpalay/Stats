class StatsController < ApplicationController
  
  before_filter :check_user
  
  
  # GET /stats
  # GET /stats.xml
  def index
    #showing stats
    @stats = Stat.find_by_sql(["SELECT * FROM stats WHERE date > ?", (Date.today-1)])
    @now = get_closest_time
    @date = Date.today.strftime("%A, %B %d, %Y")
    session[:now] = @now
    #new stats
    @stat = Stat.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stats }
    end
  end
  


  # GET /stats/1
  # GET /stats/1.xml
  def show
    
    if params[:id] == "all"
      @stat = Stat.find(:all)
    elsif params[:date] != nil
      @stat = Stat.find_all_by_date(Date.new(params[:date][:year],params[:date][:month],params[:date][:day]))      
    else
      @stat = Stat.find(params[:id])
    end


    


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stat }
    end
  end

  # GET /stats/new
  # GET /stats/new.xml
  def new
    @stat = Stat.new
    @now = get_closest_time
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stat }
    end
  end

  # GET /stats/1/edit
  def edit
    @stat = Stat.find(params[:id])
  end

  # POST /stats
  # POST /stats.xml
  def create
    @stat = Stat.new(params[:stat])
    @stat.user = get_user(session[:user])
    respond_to do |format|
      if @stat.save
        flash[:notice] = 'Stat was successfully created.'
        format.html { redirect_to(@stat) }
        format.xml  { render :xml => @stat, :status => :created, :location => @stat }
        format.js   {}
      else
        format.js {
          flash[:notice] = 'Something went wrong!' 
          render :action => "new"
          }
        format.html { render :action => "new" }
        format.xml  { render :xml => @stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stats/1
  # PUT /stats/1.xml
  def update
    @stat = Stat.find(params[:id])

    respond_to do |format|
      if @stat.update_attributes(params[:stat])
        flash[:notice] = 'Stat was successfully updated.'
        format.html { redirect_to(@stat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.xml
  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy

    respond_to do |format|
      format.html { redirect_to(stats_url) }
      format.xml  { head :ok }
    end
  end
end
