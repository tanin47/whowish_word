module BrowserHelper
  def click(id)
    wait_until { find("##{id}").should be_visible }
    find("##{id}").click
  end

  # Hacky way to wait for AJAX because we need a very customized matchers
  # We shouldn't be using this, but I cannot make it work
  def wait_until(&block)
    count = 0
    while true 
      begin
        block.call
        return
      rescue => e
        if count < 30 # Timeout in 3 seconds
          count += 1
          sleep(0.1)
          retry
        else
          raise e
        end
      end
    end
  end

  def snap
    @screenshot_number ||= 0
    page.save_screenshot("tmp/poltergeist_#{@screenshot_number += 1}.png", :full => true)
  end
end