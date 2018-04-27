# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ublox_msgs/AidEPH.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class AidEPH(genpy.Message):
  _md5sum = "796d86b27ebfe497b3a42695f2e69e13"
  _type = "ublox_msgs/AidEPH"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# AID-EPH (0x0B 0x31)
# GPS Aiding Ephemeris Input/Output Message
#
# This message is provided considered obsolete, please use AID-EPH instead!
# - SF1D0 to SF3D7 is only sent if ephemeris is available for this SV. If not, the payload may
#   be reduced to 8 Bytes, or all bytes are set to zero, indicating that this SV Number does
#   not have valid ephemeris for the moment. This may happen even if NAV-SVINFO and
#   RXM-SVSI are indicating ephemeris availability as the internal data may not represent the
#   content of an original broadcast ephemeris (or only parts thereof).
# - SF1D0 to SF3D7 contain the 24 words following the Hand-Over Word ( HOW ) from the
#   GPS navigation message, subframes 1 to 3. The Truncated TOW Count is not valid and
#   cannot be used. See IS-GPS-200 for a full description of the contents of the Subframes.
# - In SF1D0 to SF3D7, the parity bits have been removed, and the 24 bits of data are
#   located in Bits 0 to 23. Bits 24 to 31 shall be ignored.
# - When polled, the data contained in this message does not represent the full original
#   ephemeris broadcast. Some fields that are irrelevant to u-blox receivers may be missing.
#   The week number in Subframe 1 has already been modified to match the Time Of
#   Ephemeris (TOE).

uint8 CLASS_ID = 11
uint8 MESSAGE_ID = 49

uint32 svid             # SV ID for which this ephemeris data is (Valid Range: 1 .. 32).
uint32 how              # Hand-Over Word of first Subframe. This is
                        # required if data is sent to the receiver.
                        # 0 indicates that no Ephemeris Data is following.

# Start of optional block
uint32[] sf1d          # Subframe 1 Words 3..10 (SF1D0..SF1D7)
uint32[] sf2d          # Subframe 2 Words 3..10 (SF2D0..SF2D7)
uint32[] sf3d          # Subframe 3 Words 3..10 (SF3D0..SF3D7)
# End of optional block
"""
  # Pseudo-constants
  CLASS_ID = 11
  MESSAGE_ID = 49

  __slots__ = ['svid','how','sf1d','sf2d','sf3d']
  _slot_types = ['uint32','uint32','uint32[]','uint32[]','uint32[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       svid,how,sf1d,sf2d,sf3d

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AidEPH, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.svid is None:
        self.svid = 0
      if self.how is None:
        self.how = 0
      if self.sf1d is None:
        self.sf1d = []
      if self.sf2d is None:
        self.sf2d = []
      if self.sf3d is None:
        self.sf3d = []
    else:
      self.svid = 0
      self.how = 0
      self.sf1d = []
      self.sf2d = []
      self.sf3d = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2I().pack(_x.svid, _x.how))
      length = len(self.sf1d)
      buff.write(_struct_I.pack(length))
      pattern = '<%sI'%length
      buff.write(struct.pack(pattern, *self.sf1d))
      length = len(self.sf2d)
      buff.write(_struct_I.pack(length))
      pattern = '<%sI'%length
      buff.write(struct.pack(pattern, *self.sf2d))
      length = len(self.sf3d)
      buff.write(_struct_I.pack(length))
      pattern = '<%sI'%length
      buff.write(struct.pack(pattern, *self.sf3d))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.svid, _x.how,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sI'%length
      start = end
      end += struct.calcsize(pattern)
      self.sf1d = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sI'%length
      start = end
      end += struct.calcsize(pattern)
      self.sf2d = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sI'%length
      start = end
      end += struct.calcsize(pattern)
      self.sf3d = struct.unpack(pattern, str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2I().pack(_x.svid, _x.how))
      length = len(self.sf1d)
      buff.write(_struct_I.pack(length))
      pattern = '<%sI'%length
      buff.write(self.sf1d.tostring())
      length = len(self.sf2d)
      buff.write(_struct_I.pack(length))
      pattern = '<%sI'%length
      buff.write(self.sf2d.tostring())
      length = len(self.sf3d)
      buff.write(_struct_I.pack(length))
      pattern = '<%sI'%length
      buff.write(self.sf3d.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.svid, _x.how,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sI'%length
      start = end
      end += struct.calcsize(pattern)
      self.sf1d = numpy.frombuffer(str[start:end], dtype=numpy.uint32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sI'%length
      start = end
      end += struct.calcsize(pattern)
      self.sf2d = numpy.frombuffer(str[start:end], dtype=numpy.uint32, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sI'%length
      start = end
      end += struct.calcsize(pattern)
      self.sf3d = numpy.frombuffer(str[start:end], dtype=numpy.uint32, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
