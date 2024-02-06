class GreetingsController < ApplicationController
  include GreetingsHelper

  def initialize
    super

    puts "create new instance"
  end

  def hello
    # debugger
    # self = #<GreetingsController:0x00000000015810>
    # self.methods = [:hello, :fnc_helper
    @self = self

    # [e047f822-4eb2-4649-93e3-5755ee068d2a] app/views/greetings/hello.html.erb:11
    # [5361db7a-6cb9-41be-9309-c6599661fbf1] Started GET "/greetings/hello" for 127.0.0.1 at 2024-02-02 16:05:01 +0700
    # [5361db7a-6cb9-41be-9309-c6599661fbf1] Processing by GreetingsController#hello as HTML
    # request.request_id = 5361db7a-6cb9-41be-9309-c6599661fbf1

    # PID and timestamp
    # I, [2024-02-02T16:33:18.746132 #48950]  INFO -- : [a0e7dae3-f74f-498a-9e6a-c750f1583e50] Started GET "/greetings/hello" for 127.0.0.1 at 2024-02-02 16:33:18 +0700
    # use command to find PID:
    # lsof -wni tcp:3001 # => 48950
    # list PID:
    # ps aux
    # user      48950  1.3  0.8 1364884 140472 pts/5  Sl+  16:32   0:01 puma 5.6.8 (tcp://localhost:3000) [context]
    
    # <= ruby on rails params là một method của instance controller
    # request/ params không phải method của global như - https://stackoverflow.com/questions/54137139/in-ruby-which-is-the-object-where-the-method-puts-is-applied
    # debugger
    # self.methods.include?(:request) # true
    # self.request # #<ActionDispatch::Request GET "http://localhost:3000/greetings/hello" for 127.0.0.1>
    # self.request == request # true
    # params == self.request.params # true
    fnc_helper
  end

  # sao production request đổi PID ? <= nope do production dùng nhiều:
  # 
  # ps aux | grep puma
  # ec2-user  5498  3.2 11.5 9724012 1836712 ?     Sl   03:57  10:57 puma: cluster worker 0: 7648
  # ec2-user  5563  2.3 11.3 9494420 1803308 ?     Sl   03:57   7:49 puma: cluster worker 1: 7648
  # ec2-user  5646  2.6  9.5 2618524 1517920 ?     Sl   03:57   8:51 puma: cluster worker 2: 7648
  # ec2-user  5810  2.6 13.9 9956516 2213540 ?     Sl   03:57   8:49 puma: cluster worker 3: 7648
  # ec2-user  5879  3.1 11.7 9567536 1863180 ?     Sl   03:58  10:33 puma: cluster worker 4: 7648
  # ec2-user  5968  2.2  9.5 2617656 1518424 ?     Sl   03:58   7:36 puma: cluster worker 5: 7648
  # ec2-user  6031  2.4  9.8 2806648 1570768 ?     Sl   03:58   8:17 puma: cluster worker 6: 7648
  # ec2-user  6104  2.8 12.1 9492360 1930632 ?     Sl   03:58   9:25 puma: cluster worker 7: 7648
  # ec2-user  7648  0.0  0.0 271616 12604 ?        S    03:00   0:02 puma 4.3.12 (unix:///home/ec2-user/fufuonline/shared/tmp/sockets/puma.sock)
  # 
  # tail -f log/production.log | grep "GET"
  # I, [2024-02-02T09:53:32.955870 #5498]  INFO -- : [171b4300-cf88-45f4-9c88-971e1b826c3e] Started GET "/api/v1/customer/carts" for .54.251 at 2024-02-02 09:53:32 +0000
  # I, [2024-02-02T09:53:33.576020 #5968]  INFO -- : [b4e17eea-afe1-4063-a302-80156a9b937a] Started GET "/api/v1/products?page%5Bnumber%5D=1&page%5Bsize%5D=50&q%5Bsorts%5D=sort_num%20desc&q%5Bproduct_category_id_eq%5D=51" for .225.22 at 2024-02-02 09:53:33 +0000
  # I, [2024-02-02T09:53:37.060247 #5498]  INFO -- : [169ba5ef-2feb-4d25-9998-2a151bbb44ab] Started GET "/api/v1/customer/customers/me" for .245.68 at 2024-02-02 09:53:37 +0000
  # I, [2024-02-02T09:53:37.060312 #6031]  INFO -- : [e566f5b5-4479-4c3a-8c99-f8e6a2cb8c47] Started GET "/api/v1/get_resource_list?page_size=all" for .245.68 at 2024-02-02 09:53:37 +0000
  # I, [2024-02-02T09:53:39.745555 #5498]  INFO -- : [19e77d49-4994-4165-9749-4affe5fa32d8] Started GET "/api/v1/get_resource_list?page_size=all" for .192.241 at 2024-02-02 09:53:39 +0000
  # I, [2024-02-02T09:53:40.800709 #5646]  INFO -- : [a59ad9dd-5e4b-4725-b0b6-fc7903443ee9] Started GET "/api/v1/customer/carts" for .186.54 at 2024-02-02 09:53:40 +0000
  # I, [2024-02-02T09:53:40.800732 #5498]  INFO -- : [e6c75f10-2b8e-4426-b977-4acab5aa8ec9] Started GET "/api/v1/home_data" for .186.54 at 2024-02-02 09:53:40 +0000
  # I, [2024-02-02T09:53:40.800940 #5810]  INFO -- : [5ee263ed-3132-4026-82a8-8734f0e5f8be] Started GET "/api/v1/products/free_word_suggestions" for .186.54 at 2024-02-02 09:53:40 +0000
  # I, [2024-02-02T09:53:40.800946 #5879]  INFO -- : [5b6ce3ef-2666-489a-ac03-8c7f6a00511c] Started GET "/api/v1/customer/customers/me" for .186.54 at 2024-02-02 09:53:40 +0000
  # I, [2024-02-02T09:53:42.127233 #5498]  INFO -- : [a29464be-e4e9-4d5a-a8c8-28f35b78f90b] Started GET "/api/v1/customer/customers/me" for .101.197 at 2024-02-02 09:53:42 +0000
  # I, [2024-02-02T09:53:42.129441 #5646]  INFO -- : [f99a5e5f-2236-44db-879c-ed1bc9bd0292] Started GET "/api/v1/get_resource_list?page_size=all" for .101.197 at 2024-02-02 09:53:42 +0000
  # I, [2024-02-02T09:53:43.300944 #5646]  INFO -- : [9bdf7774-268a-4b09-a288-bca27a2613fe] Started GET "/api/v1/load_block_data?kind=recently_viewed_product&page[number]=1&page[size]=10" for .186.54 at 2024-02-02 09:53:43 +0000
  # I, [2024-02-02T09:53:44.450627 #5498]  INFO -- : [b96ee153-6932-49f8-904f-dccadbd70fa1] Started GET "/api/v1/get_resource_list?page_size=all" for .170.27 at 2024-02-02 09:53:44 +0000
  # I, [2024-02-02T09:53:44.456109 #5879]  INFO -- : [9599fad2-1660-41cc-945f-1b80c9ddd77f] Started GET "/api/v1/customer/customers/me" for .170.27 at 2024-02-02 09:53:44 +0000
  # I, [2024-02-02T09:53:44.767539 #5879]  INFO -- : [63771bb1-c5da-48b0-8f73-3756f650a21d] Started GET "/api/v1/get_resource_list?page_size=all" for .194.192 at 2024-02-02 09:53:44 +0000
  # I, [2024-02-02T09:53:44.769609 #6031]  INFO -- : [d5853c2d-2e66-4848-a5b5-cecb828b92f7] Started GET "/api/v1/customer/customers/me" for .194.192 at 2024-02-02 09:53:44 +0000
  # I, [2024-02-02T09:53:46.677415 #6031]  INFO -- : [08bf44a0-2d0b-4404-b0c5-9ba3d2e8cd36] Started GET "/api/v1/get_resource_list?page_size=all" for .2.0 at 2024-02-02 09:53:46 +0000
  # I, [2024-02-02T09:53:46.683812 #5563]  INFO -- : [e945fe45-7544-4da0-8073-f2a55994a309] Started GET "/api/v1/customer/customers/me" for .2.0 at 2024-02-02 09:53:46 +0000
  # I, [2024-02-02T09:53:46.987315 #5810]  INFO -- : [0b189ceb-4f61-4aea-9b01-c2fd8b271285] Started GET "/api/v1/customer/product_categories" for .165.81 at 2024-02-02 09:53:46 +0000
  # I, [2024-02-02T09:53:46.987465 #5879]  INFO -- : [d8ea89ef-8f97-425b-97a7-f6cb2e39149f] Started GET "/api/v1/customer/carts" for .165.81 at 2024-02-02 09:53:46 +0000
  # I, [2024-02-02T09:53:46.989247 #5498]  INFO -- : [b7072f0b-dbc1-4a93-9792-df1cc33fee8e] Started GET "/api/v1/customer/problems" for .165.81 at 2024-02-02 09:53:46 +0000
  # I, [2024-02-02T09:53:47.455296 #5968]  INFO -- : [25ed5465-04f8-450d-91e9-9524a84bfe59] Started GET "/api/v1/products?page[number]=1&page[size]=50&q[sorts]=sort_num%20desc&q[product_brand_id_eq]=5" for .165.81 at 2024-02-02 09:53:47 +0000
  # I, [2024-02-02T09:53:49.168399 #5968]  INFO -- : [10ebb8a2-6be7-403b-9a47-005d5436f544] Started GET "/api/v1/products/free_word_suggestions" for .165.81 at 2024-02-02 09:53:49 +0000
  # I, [2024-02-02T09:53:49.448596 #5968]  INFO -- : [52dfe864-772b-435b-a553-13f64c1575f5] Started GET "/api/v1/customer/customers/me" for .57.220 at 2024-02-02 09:53:49 +0000
  # I, [2024-02-02T09:53:49.450326 #5498]  INFO -- : [987f6dab-54d3-4827-ab7c-d61613a8fdd7] Started GET "/api/v1/get_resource_list?page_size=all" for .57.220 at 2024-02-02 09:53:49 +0000
  # I, [2024-02-02T09:53:51.435422 #5968]  INFO -- : [50432fd5-90b0-424a-ba09-9d6f1d296a0b] Started GET "/api/v1/get_resource_list?page_size=all" for .190.79 at 2024-02-02 09:53:51 +0000
  # I, [2024-02-02T09:53:51.904638 #6104]  INFO -- : [6c133c57-2004-4816-8c17-b3bf04729637] Started GET "/api/v1/get_resource_list?page_size=all" for .168.231 at 2024-02-02 09:53:51 +0000
end
