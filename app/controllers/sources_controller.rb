class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    if params[:do] == 'fetch_source'
      fetch_source
    end
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: 'Source was successfully created.' }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fetch_source
    @source = Source.find(params[:id])
    # fetch the source HTML
    document = HTTParty.get(@source.url)

    if document.code == 200
      # update source last_run_at
      @source.touch(:last_run_at)

      # user selector hash of key:value
      css_selectors_a = Hash.new
      # @source.css_selectors.each do |selector|
      #   css_selectors_h[selector.to_sym] = selector.value
      # end

      # parse HTML
      html = Nokogiri::HTML(document)
      product_title = get_text_by_css_selector(html, 'title')
      product_price = [html.at_css('.Price-characteristic').text, html.at_css('.Price-mantissa').text].join('.')
      price_currency = html.at_css('.Price-currency').text

      # create (if not found by title) or updates product
      product = Product.where(:name => product_title).update_or_create(:name => product_title, :price => product_price, :currency => price_currency)

      # fetch product's reviews with CSS selectors
      review_title_selector = '.review-title'
      review_author_selector = 'span[itemprop="author"]'
      review_stars_selector = '.stars-container' #alt="Average rating: 1"
      review_body_selector = '.review-description'

      # review data as array
      review_titles = Array.new
      review_authors = Array.new
      review_stars = Array.new
      review_bodys = Array.new

      html.css(review_title_selector).map.with_index{|title, index| review_titles[index] = title.children.text}
      html.css(review_author_selector).map.with_index{|author, index| review_authors[index] = author.text}
      html.css(review_stars_selector).map.with_index{|stars, index| review_stars[index] = stars.attributes["alt"].value.gsub!(/[^\d,\.]/, '')}
      html.css(review_body_selector).map.with_index{|body, index| review_bodys[index] = body.children.text}

      # create (if not found by title) or updates review
      review_titles.each_with_index {|review, index|
        review = Review.where(:title => review_titles[index]).update_or_create(:product_id => product.id, :title => review_titles[index], :author => review_authors[index], :stars => review_stars[index], :body => review_bodys[index])
      }
      flash[:notice] = "Product created!" if product
      redirect_to :products
    else
      flash[:notice] = "Couldnt fetch data from source."
      render :show
    end
  end

  private
    def get_text_by_css_selector(html, selector)
      html.at_css(selector).text
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:url, :script, :last_run_at)
    end
end
