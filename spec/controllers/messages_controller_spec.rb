require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
    describe "GET new" do
        context 'Check data and render template' do
            before :each do 
                @fake_result = double(
                        'Message', 
                        :message_name => 'Teste', 
                        :message_email => 'teste@teste.com.br',
                        :message_body => 'Meu teste'
                    )
            end

#            it "does not render a different template" do
#                allow(Message).to receive(:new).and_return(@fake_result)
#                get :new
#                expect(response).to_not render_template(:index)
#            end
#20
            it "returns a success response" do
                allow(Message).to receive(:new).and_return(@fake_result)
                get :new
                expect(response).to render_template(:new) 
            end

            it "should created a new message" do
                allow(Message).to receive(:new).and_return(@fake_result)
                get :new
                expect(assigns(:message)).to eq(@fake_result)
            end
        end

    end
#35
    describe "POST create" do
        context "with valid attributes" do
        it "creates a new message" do
            expect{
            post :create, params: {:message => {:name => Faker::Name.name, :email => Faker::Internet.email, :body => 'Teste'}}
            }.to change(Message,:count).by(1)
        end
        
        it "redirects to the new message" do
            post :create, params: {:message => {:name => Faker::Name.name, :email => Faker::Internet.email, :body => 'Teste'}}
            response.should redirect_to Message.last
        end
        end
        
        context "with invalid attributes" do
        it "does not send the message" do
            expect{
            post :create, params: {:message => {:name => Faker::Name.name, :email => 'Teste', :body => 'Teste'}}
            }.to_not change(Message,:count)
        end
        
        it "re-renders the new method" do
            post :create, params: {:message => {:name => Faker::Name.name, :email => 'Teste', :body => 'Teste'}}
            response.should render_template :new
        end
        end 
    end
end
