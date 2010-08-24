#The stats controller is a scaffold for the creation and maintenance of Stats 
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

  def compare
    if params[:date1] != nil
      year1 = params[:date1][:year]
      month1 = params[:date1][:month]
      day1 = params[:date1][:day]

    if params[:date2] != nil
      year2 = params[:date2][:year]
      month2 = params[:date2][:month]
      day2 = params[:date2][:day]

      #So, the year 3000 is a bit optimistic, but I figure the check doesn't take THAT much longer than say...2020

      #check that date1 is made up of valid entries
    if (((2000..3000).member?(year1.to_i)) && ((1..12).member?(month1.to_i)) && ((1..31).member?(day1.to_i)))
      @date1 = Date.new(year1.to_i, month1.to_i, day1.to_i)
    else
      flash[:notice] = "Invalid date entries for the FROM date.  You entered:  year: #{year1}, month: #{month1}, day: #{day1}"
      redirect_to :action => :index
    end                       \
      #check that date2 is made up of valid entries
    if (((2000..3000).member?(year2.to_i)) && ((1..12).member?(month2.to_i)) && ((1..31).member?(day2.to_i)))
      @date2 = Date.new(year2.to_i, month2.to_i, day2.to_i)
    else
      flash[:notice] = "Invalid date entries for the TO date.  You entered:  year: #{year2}, month: #{month2}, day: #{day2}"
      redirect_to :action => :index
    end


      @stats = Stat.find_by_sql(["SELECT * FROM stats WHERE date >= ? AND date <= ?", (@date1), (@date2)])
      @date = "#{@date1.strftime("%A, %B %d, %Y")} to #{@date2.strftime("%A, %B %d, %Y")}"
      render :action => "view"
   end



  def view
    if params[:date] != nil
      year = params[:date][:year]
      month = params[:date][:month]
      day = params[:date][:day]

      if (((2000..3000).member?(year.to_i)) && ((1..12).member?(month.to_i)) && ((1..31).member?(day.to_i)))
        @date = Date.new(year.to_i, month.to_i, day.to_i)
        @stats = Stat.find_all_by_date(@date)
        @date = @date.strftime("%A, %B %d, %Y")
      else
        @stats = Stat.find_by_sql(["SELECT * FROM stats WHERE date > ?", (Date.today-1)])
        @date = Date.today.strftime("%A, %B %d, %Y")
      end

    else
      @stats = Stat.find_by_sql(["SELECT * FROM stats WHERE date > ?", (Date.today-1)])
      @date = Date.today.strftime("%A, %B %d, %Y")
    end
  end
  


  # GET /stats/1
  # GET /stats/1.xml
  def show
      @stat = Stat.find(params[:id])


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
