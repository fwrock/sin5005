require 'rails_helper'
require 'spec_helper'
describe ProductsController, type: :controller do
    context 'GET index' do
        before :each do 
            @fake_results =  [
                double(
                    'Product',
                    :product_id => 1, 
                    :product_name => 'Teste', 
                    :product_description => 'any'
                ),
                double(
                    'Product',
                    :product_id => 2, 
                    :product_name => 'Teste 2', 
                    :product_description => 'any 2'
                )
            ]
        end

        it "does not render a different template" do
            get :index
            expect(response).to_not render_template(:show)
        end

        it "returns a success response" do
            get :index
            expect(response).to render_template(:index) 
        end

        it "should select the Search Results template for rendering" do
            allow(Product).to receive(:paginate).and_return(@fake_results)
            get :index
            expect(assigns(:products)).to eq(@fake_results)
        end
    end

    context 'GET show' do
        before :each do 
            @fake_result = double(
                    'Product',
                    :product_id => 1, 
                    :product_name => 'Teste', 
                    :product_description => 'any'
                )
        end

        it "does not render a different template" do
            allow(Product).to receive(:find).with('1').and_return(@fake_result)
            get :show, params: {:id => 1}
            expect(response).to_not render_template(:index)
        end

        it "returns a success response" do
            allow(Product).to receive(:find).with('1').and_return(@fake_result)
            get :show, params: {:id => 1}
            expect(response).to render_template(:show) 
        end

        it "should select the Search Results template for rendering" do
            allow(Product).to receive(:find).with('1').and_return(@fake_result)
            get :show, params: {:id => 1}
            expect(assigns(:product)).to eq(@fake_result)
        end
    end

    context 'GET new' do
        before :each do 
            @fake_result = double(
                    'Product', 
                    :product_name => 'Teste', 
                    :product_description => 'any'
                )
        end

        it "does not render a different template" do
            allow(Product).to receive(:new).and_return(@fake_result)
            get :new
            expect(response).to_not render_template(:index)
        end

        it "returns a success response" do
            allow(Product).to receive(:new).and_return(@fake_result)
            get :new
            expect(response).to render_template(:new) 
        end

        it "should created a new product" do
            allow(Product).to receive(:new).and_return(@fake_result)
            get :new
            expect(assigns(:product)).to eq(@fake_result)
        end
    end


    context "with valid attributes" do
      it "creates a new contact" do
        expect{
          post :create, params: {:product => FactoryBot.attributes_for(:product)}
        }.to change(Product,:count).by(1)
      end
      
      it "redirects to the new contact" do
        post :create, params: {:product => FactoryBot.attributes_for(:product)}
        response.should redirect_to Product.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new contact" do
        expect{
          post :create, params: {:product => {:name => Faker::Lorem.word, :description => Faker::Lorem.paragraph(2), :price => -1, :old_price => 0}}
        }.to_not change(Product,:count)
      end
      
      it "re-renders the new method" do
        post :create, params: {:product => {:name => Faker::Lorem.word, :description => Faker::Lorem.paragraph(2), :price => -1, :old_price => 0}}
        response.should render_template :new
      end
    end 

end