require "spec_helper"

describe Mem do
  describe "#memoize" do
    let(:klass) do
      Class.new do
        extend Mem

        def foo(&block)
          bar(&block)
        end
        memoize :foo

        def bar
          yield
        end
      end
    end

    let(:object) do
      klass.new
    end

    it "memoizes the result of specified method call" do
      expect(object).to receive(:bar).once.and_call_original
      expect(object.foo { "foo" }).to eq "foo"
      expect(object.foo { "baz" }).to eq "foo"
    end
  end
end
