class Matrix
  attr_reader :rows, :columns

  def initialize(m)
    create_matrix(m)
  end

  private

  def create_matrix(m)
    @rows = m.split("\n").each_with_object([]) do |row, rows|
      rows << row.split(" ").each_with_object([]) do |item, arr|
        arr << item.to_i
      end
    end

    @columns = @rows.transpose
    # columns_number = rows[0].size
    # @columns = []
    # for i in 0...columns_number
    #   @columns << []
    #   for j in 0...rows.size
    #     @columns[i] << rows[j][i]
    #   end
    # end
  end
end