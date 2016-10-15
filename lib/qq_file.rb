# encoding: utf-8
# suport ie7 upload http://j.mp/rYClMJ
# qqfile = QqFile.new(params[:qqfile], request)
class QqFile

  def initialize(qqfile, request)
    @qqfile  = qqfile
    @request = request
  end

  def body
    ie_upload? ? @qqfile.read : @request.raw_post
  end

  def name
    ie_upload? ? @qqfile.original_filename : @qqfile
  end

  def ie_upload?
    !@qqfile.is_a? String
  end

end
