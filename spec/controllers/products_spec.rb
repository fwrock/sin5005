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
    
    describe "GET new" do
        context 'Check data and render template' do
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

    end

    describe "POST create" do
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

    describe 'PUT update' do
        
        before :each do
            @product = Product.create(
                name: Faker::Lorem.word,
                description: Faker::Lorem.paragraph(2),
                price: 32,
                old_price: 0
            )
        end
        
        context "valid attributes" do
            
            it "located the requested @product" do
            put :update, params: {:id => @product.id,:product => FactoryBot.attributes_for(:product)}
            assigns(:product).should eq(@product)      
            end
        
            it "changes @product's attributes" do
                @p = FactoryBot.attributes_for(:product)
                put :update, params: {:id => @product.id,:product => @p}
                @product.reload
                @product.name.should eq(@p[:name])
                @product.description.should eq(@p[:description])
            end

            it "changes @product's price and alter old_price" do
                @p = FactoryBot.attributes_for(:product)
                @p[:price] = 20
                old_price = @product.price
                put :update, params: {:id => @product.id,:product => @p}
                @product.reload
                @product.old_price.should eq(old_price)
            end
        
            it "redirects to the updated product" do
                put :update, params: {:id => @product.id,:product => FactoryBot.attributes_for(:product)}
                response.should redirect_to @product
            end
        end
        
        context "invalid attributes" do
            it "locates the requested @product" do
                put :update, params: {:id => @product.id, :product => {:name => Faker::Lorem.word, :description => Faker::Lorem.paragraph(2), :price => -1, :old_price => 0}}
                assigns(:product).should eq(@product)      
            end
            
            it "does not change @product's attributes" do
                name = @product.name
                description = @product.description
                price = @product.price
                put :update, params: {:id => @product.id, :product => {:name => Faker::Lorem.word, :description => Faker::Lorem.paragraph(2), :price => -1, :old_price => 0}}
                @product.reload
                @product.name.should eq(name)
                @product.description.should eq(description)
                @product.price.should eq(price)
            end
            
            it "re-renders the edit method" do
                put :update, params: {:id => @product.id, :product => {:name => Faker::Lorem.word, :description => Faker::Lorem.paragraph(2), :price => -1, :old_price => 0}}
                
                response.should render_template :edit
            end
        end
    end


end