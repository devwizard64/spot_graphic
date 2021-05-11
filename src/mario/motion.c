static const u16 *const texture_mario_eye[] =
{
    texture_mario_eye_half,
    texture_mario_eye_closed,
    texture_mario_eye_half,
    texture_mario_eye_open,
    texture_mario_eye_half,
    texture_mario_eye_closed,
    texture_mario_eye_half,
    texture_mario_eye_open,
};

static const s16 val_mario[] =
{
    0, 172, 171, 171, 169, 168, 166, 164,
    162, 160, 158, 157, 155, 154, 153, 153,
    153, 154, 155, 156, 158, 160, 161, 163,
    165, 167, 168, 170, 171, 171, 172, 171,
    171, 169, 168, 166, 164, 162, 160, 158,
    156, 155, 153, 152, 151, 151, 151, 152,
    153, 155, 156, 158, 160, 162, 164, 166,
    168, 169, 171, 171, 172, 171, 171, 169,
    168, 166, 164, 162, 160, 158, 156, 155,
    153, 152, 151, 151, 151, 152, 153, 154,
    155, 156, 158, 160, 161, 163, 165, 167,
    168, 170, 171, -1, -1, -1, -1, 0,
    0, 0, 1, 1, 2, 2, 3, 3,
    3, 3, 3, 3, 3, 2, 2, 1,
    1, 0, 0, 0, 0, -1, -1, -1,
    -1, -1, -1, -1, 0, 0, 0, 0,
    1, 1, 2, 2, 3, 3, 3, 3,
    3, 3, 3, 2, 2, 1, 1, 0,
    0, 0, 0, -1, -1, -1, -1, -1,
    -1, -1, 0, 0, 0, 0, 1, 1,
    2, 2, 3, 3, 3, 3, 3, 3,
    3, 3, 2, 2, 2, 1, 1, 0,
    0, 0, 0, -1, -1, 16383, 0, 3,
    13, 29, 49, 73, 99, 125, 152, 178,
    201, 221, 237, 247, 251, 248, 239, 225,
    207, 186, 162, 138, 113, 88, 65, 44,
    26, 12, 3, 0, 3, 12, 26, 44,
    65, 88, 113, 138, 162, 186, 207, 225,
    239, 248, 251, 248, 239, 225, 207, 186,
    162, 138, 113, 88, 65, 44, 26, 12,
    3, 0, 3, 12, 26, 44, 65, 88,
    113, 138, 162, 186, 207, 225, 239, 248,
    251, 248, 239, 225, 208, 187, 164, 139,
    115, 90, 67, 46, 29, 15, 6, 3,
    -1668, -1668, -1667, -1666, -1665, -1663, -1661, -1659,
    -1657, -1655, -1653, -1652, -1650, -1650, -1649, -1650,
    -1650, -1651, -1653, -1654, -1656, -1658, -1660, -1662,
    -1663, -1665, -1666, -1667, -1668, -1668, -1668, -1667,
    -1666, -1665, -1663, -1662, -1660, -1658, -1656, -1654,
    -1653, -1651, -1650, -1650, -1649, -1650, -1650, -1651,
    -1653, -1654, -1656, -1658, -1660, -1662, -1663, -1665,
    -1666, -1667, -1668, -1668, -1668, -1667, -1666, -1665,
    -1663, -1662, -1660, -1658, -1656, -1654, -1653, -1651,
    -1650, -1650, -1649, -1650, -1650, -1651, -1653, -1654,
    -1656, -1658, -1660, -1661, -1663, -1665, -1666, -1667,
    -1668, -1668, -4724, -4748, -4812, -4912, -5039, -5186,
    -5348, -5517, -5685, -5847, -5995, -6122, -6221, -6286,
    -6309, -6289, -6232, -6144, -6031, -5898, -5751, -5596,
    -5438, -5282, -5135, -5002, -4889, -4801, -4745, -4724,
    -4745, -4801, -4889, -5002, -5135, -5282, -5438, -5596,
    -5751, -5898, -6031, -6144, -6232, -6289, -6309, -6289,
    -6232, -6144, -6031, -5898, -5751, -5596, -5438, -5282,
    -5135, -5002, -4889, -4801, -4745, -4724, -4745, -4801,
    -4889, -5002, -5134, -5281, -5436, -5594, -5750, -5897,
    -6030, -6143, -6231, -6288, -6309, -6290, -6234, -6147,
    -6036, -5905, -5760, -5606, -5450, -5296, -5151, -5020,
    -4908, -4821, -4765, -4745, -13745, -13763, -13814, -13893,
    -13993, -14110, -14237, -14371, -14504, -14631, -14748, -14849,
    -14927, -14978, -14996, -14980, -14936, -14866, -14777, -14672,
    -14556, -14433, -14308, -14185, -14069, -13964, -13875, -13806,
    -13761, -13745, -13761, -13806, -13875, -13964, -14069, -14185,
    -14308, -14433, -14556, -14672, -14777, -14866, -14936, -14980,
    -14996, -14980, -14936, -14866, -14777, -14672, -14556, -14433,
    -14308, -14185, -14069, -13964, -13875, -13806, -13761, -13745,
    -13761, -13806, -13875, -13965, -14070, -14186, -14309, -14434,
    -14557, -14673, -14778, -14867, -14936, -14981, -14996, -14980,
    -14934, -14863, -14773, -14666, -14548, -14424, -14298, -14173,
    -14056, -13950, -13859, -13789, -13744, -13727, -1251, -1296,
    -1422, -1616, -1864, -2152, -2467, -2796, -3125, -3440,
    -3729, -3976, -4170, -4296, -4341, -4302, -4191, -4020,
    -3799, -3540, -3254, -2950, -2642, -2339, -2052, -1793,
    -1572, -1401, -1290, -1251, -1290, -1401, -1572, -1793,
    -2052, -2339, -2642, -2950, -3254, -3540, -3799, -4020,
    -4191, -4302, -4341, -4302, -4191, -4020, -3799, -3540,
    -3254, -2950, -2642, -2339, -2052, -1793, -1572, -1401,
    -1290, -1251, -1290, -1401, -1572, -1792, -2051, -2337,
    -2640, -2948, -3251, -3537, -3796, -4017, -4189, -4301,
    -4341, -4304, -4195, -4027, -3809, -3553, -3270, -2971,
    -2666, -2366, -2083, -1827, -1608, -1439, -1329, -1290,
    -11556, -11509, -11379, -11179, -10923, -10626, -10300, -9960,
    -9621, -9295, -8997, -8741, -8541, -8411, -8364, -8405,
    -8520, -8696, -8924, -9192, -9488, -9801, -10120, -10433,
    -10729, -10996, -11224, -11401, -11515, -11556, -11515, -11401,
    -11224, -10996, -10729, -10433, -10120, -9801, -9488, -9192,
    -8924, -8696, -8520, -8405, -8364, -8405, -8520, -8696,
    -8924, -9192, -9488, -9801, -10120, -10433, -10729, -10996,
    -11224, -11401, -11515, -11556, -11515, -11401, -11225, -10997,
    -10730, -10435, -10122, -9804, -9491, -9195, -8927, -8699,
    -8522, -8406, -8364, -8403, -8516, -8690, -8914, -9178,
    -9471, -9780, -10095, -10404, -10697, -10962, -11187, -11362,
    -11475, -11515, -11084, -11022, -10847, -10577, -10233, -9833,
    -9394, -8938, -8481, -8043, -7642, -7298, -7029, -6853,
    -6791, -6845, -6999, -7237, -7544, -7904, -8302, -8723,
    -9152, -9573, -9971, -10331, -10638, -10876, -11030, -11084,
    -11030, -10876, -10638, -10331, -9971, -9573, -9152, -8723,
    -8302, -7904, -7544, -7237, -6999, -6845, -6791, -6845,
    -6999, -7237, -7544, -7904, -8302, -8723, -9152, -9573,
    -9971, -10331, -10638, -10876, -11030, -11084, -11030, -10876,
    -10639, -10333, -9973, -9576, -9155, -8727, -8306, -7908,
    -7548, -7241, -7002, -6847, -6791, -6843, -6994, -7228,
    -7530, -7886, -8279, -8695, -9119, -9535, -9929, -10285,
    -10588, -10823, -10976, -11030, -2743, -2794, -2939, -3161,
    -3446, -3777, -4138, -4516, -4893, -5255, -5586, -5870,
    -6093, -6237, -6289, -6244, -6117, -5920, -5667, -5370,
    -5041, -4693, -4339, -3991, -3662, -3365, -3112, -2915,
    -2788, -2743, -2788, -2915, -3112, -3365, -3662, -3991,
    -4339, -4693, -5041, -5370, -5667, -5920, -6117, -6244,
    -6289, -6244, -6117, -5920, -5667, -5370, -5041, -4693,
    -4339, -3991, -3662, -3365, -3112, -2915, -2788, -2743,
    -2788, -2915, -3111, -3364, -3660, -3989, -4336, -4690,
    -5037, -5366, -5664, -5917, -6114, -6242, -6289, -6246,
    -6121, -5928, -5678, -5385, -5060, -4716, -4366, -4022,
    -3697, -3403, -3153, -2958, -2833, -2788, -14371, -14366,
    -14353, -14334, -14309, -14279, -14247, -14214, -14181, -14149,
    -14120, -14095, -14075, -14062, -14058, -14062, -14073, -14090,
    -14113, -14139, -14168, -14198, -14230, -14260, -14289, -14316,
    -14338, -14355, -14367, -14371, -14367, -14355, -14338, -14316,
    -14289, -14260, -14230, -14198, -14168, -14139, -14113, -14090,
    -14073, -14062, -14058, -14062, -14073, -14090, -14113, -14139,
    -14168, -14198, -14230, -14260, -14289, -14316, -14338, -14355,
    -14367, -14371, -14367, -14356, -14339, -14317, -14291, -14262,
    -14232, -14201, -14170, -14141, -14115, -14092, -14075, -14063,
    -14058, -14060, -14069, -14084, -14104, -14127, -14153, -14181,
    -14209, -14236, -14263, -14286, -14306, -14322, -14332, -14336,
    1355, 1407, 1553, 1777, 2064, 2397, 2762, 3142,
    3522, 3886, 4220, 4506, 4730, 4876, 4928, 4883,
    4754, 4556, 4301, 4002, 3670, 3320, 2963, 2613,
    2282, 1982, 1727, 1529, 1401, 1355, 1401, 1529,
    1727, 1982, 2282, 2613, 2963, 3320, 3670, 4002,
    4301, 4556, 4754, 4883, 4928, 4883, 4754, 4556,
    4301, 4002, 3670, 3320, 2963, 2613, 2282, 1982,
    1727, 1529, 1401, 1355, 1401, 1529, 1726, 1981,
    2280, 2611, 2961, 3317, 3667, 3998, 4298, 4554,
    4752, 4881, 4928, 4884, 4759, 4564, 4313, 4017,
    3690, 3344, 2991, 2645, 2317, 2021, 1768, 1573,
    1446, 1401, 11222, 11200, 11136, 11039, 10915, 10771,
    10613, 10448, 10283, 10125, 9980, 9856, 9759, 9696,
    9673, 9693, 9749, 9834, 9945, 10075, 10219, 10370,
    10525, 10677, 10821, 10951, 11061, 11147, 11203, 11222,
    11203, 11147, 11061, 10951, 10821, 10677, 10525, 10370,
    10219, 10075, 9945, 9834, 9749, 9693, 9673, 9693,
    9749, 9834, 9945, 10075, 10219, 10370, 10525, 10677,
    10821, 10951, 11061, 11147, 11203, 11222, 11203, 11147,
    11061, 10951, 10821, 10678, 10526, 10372, 10220, 10076,
    9946, 9836, 9750, 9694, 9673, 9692, 9747, 9831,
    9940, 10068, 10210, 10360, 10513, 10663, 10805, 10934,
    11043, 11128, 11183, 11203, -13066, -12992, -12785, -12467,
    -12060, -11586, -11068, -10527, -9987, -9469, -8995, -8588,
    -8270, -8063, -7989, -8053, -8235, -8517, -8879, -9305,
    -9776, -10274, -10781, -11279, -11750, -12176, -12538, -12819,
    -13001, -13066, -13001, -12819, -12538, -12176, -11750, -11279,
    -10781, -10274, -9776, -9305, -8879, -8517, -8235, -8053,
    -7989, -8053, -8235, -8517, -8879, -9305, -9776, -10274,
    -10781, -11279, -11750, -12176, -12538, -12819, -13001, -13066,
    -13002, -12820, -12539, -12177, -11752, -11282, -10785, -10278,
    -9781, -9310, -8884, -8521, -8239, -8055, -7989, -8051,
    -8229, -8506, -8863, -9284, -9749, -10241, -10742, -11234,
    -11699, -12121, -12479, -12757, -12937, -13001, 0, 6,
    25, 54, 92, 135, 183, 232, 281, 329,
    372, 410, 439, 458, 465, 459, 442, 416,
    383, 344, 301, 255, 209, 163, 120, 81,
    48, 22, 5, 0, 5, 22, 48, 81,
    120, 163, 209, 255, 301, 344, 383, 416,
    442, 459, 465, 459, 442, 416, 383, 344,
    301, 255, 209, 163, 120, 81, 48, 22,
    5, 0, 5, 22, 48, 81, 120, 163,
    208, 255, 300, 344, 383, 416, 442, 458,
    465, 461, 450, 432, 408, 380, 347, 312,
    273, 233, 193, 152, 112, 74, 38, 5,
    -208, -206, -201, -192, -181, -168, -154, -140,
    -125, -112, -99, -88, -79, -74, -72, -74,
    -78, -86, -96, -107, -120, -133, -147, -160,
    -173, -184, -194, -201, -206, -208, -206, -201,
    -194, -184, -173, -160, -147, -133, -120, -107,
    -96, -86, -78, -74, -72, -74, -78, -86,
    -96, -107, -120, -133, -147, -160, -173, -184,
    -194, -201, -206, -208, -206, -201, -194, -184,
    -173, -160, -147, -133, -120, -107, -96, -86,
    -79, -74, -72, -73, -76, -81, -88, -97,
    -106, -117, -128, -140, -151, -163, -175, -186,
    -197, -206, -13864, -13913, -14049, -14258, -14525, -14836,
    -15177, -15531, -15886, -16227, -16538, -16805, -17014, -17150,
    -17199, -17156, -17037, -16852, -16614, -16334, -16025, -15698,
    -15365, -15038, -14729, -14449, -14211, -14026, -13906, -13864,
    -13906, -14026, -14211, -14449, -14729, -15038, -15365, -15698,
    -16025, -16334, -16614, -16852, -17037, -17156, -17199, -17156,
    -17037, -16852, -16614, -16334, -16025, -15698, -15365, -15038,
    -14729, -14449, -14211, -14026, -13906, -13864, -13906, -14026,
    -14210, -14448, -14727, -15036, -15362, -15695, -16022, -16331,
    -16611, -16849, -17035, -17155, -17199, -17172, -17092, -16965,
    -16796, -16592, -16359, -16102, -15828, -15542, -15249, -14957,
    -14671, -14396, -14140, -13906, 7754, 7836, 8066, 8419,
    8870, 9396, 9970, 10570, 11169, 11744, 12269, 12721,
    13074, 13304, 13386, 13314, 13112, 12800, 12398, 11926,
    11403, 10851, 10288, 9736, 9214, 8741, 8339, 8027,
    7825, 7754, 7825, 8027, 8339, 8741, 9214, 9736,
    10288, 10851, 11403, 11926, 12398, 12800, 13112, 13314,
    13386, 13314, 13112, 12800, 12398, 11926, 11403, 10851,
    10288, 9736, 9214, 8741, 8339, 8027, 7825, 7754,
    7825, 8027, 8338, 8740, 9211, 9733, 10284, 10846,
    11398, 11920, 12393, 12795, 13109, 13312, 13386, 13340,
    13205, 12990, 12706, 12361, 11967, 11534, 11070, 10587,
    10093, 9600, 9116, 8653, 8219, 7825, 6921, 6904,
    6856, 6783, 6690, 6581, 6463, 6339, 6215, 6096,
    5988, 5894, 5821, 5774, 5757, 5772, 5813, 5878,
    5961, 6059, 6167, 6281, 6397, 6511, 6619, 6717,
    6800, 6864, 6906, 6921, 6906, 6864, 6800, 6717,
    6619, 6511, 6397, 6281, 6167, 6059, 5961, 5878,
    5813, 5772, 5757, 5772, 5813, 5878, 5961, 6059,
    6167, 6281, 6397, 6511, 6619, 6717, 6800, 6864,
    6906, 6921, 6906, 6864, 6800, 6717, 6620, 6512,
    6398, 6282, 6168, 6060, 5962, 5879, 5814, 5772,
    5757, 5766, 5794, 5839, 5897, 5969, 6050, 6140,
    6235, 6335, 6437, 6539, 6639, 6735, 6825, 6906,
    4420, 4442, 4503, 4597, 4717, 4857, 5009, 5169,
    5328, 5481, 5620, 5740, 5834, 5895, 5917, 5898,
    5844, 5761, 5654, 5529, 5390, 5243, 5094, 4947,
    4808, 4683, 4576, 4493, 4439, 4420, 4439, 4493,
    4576, 4683, 4808, 4947, 5094, 5243, 5390, 5529,
    5654, 5761, 5844, 5898, 5917, 5898, 5844, 5761,
    5654, 5529, 5390, 5243, 5094, 4947, 4808, 4683,
    4576, 4493, 4439, 4420, 4439, 4493, 4576, 4682,
    4808, 4946, 5093, 5242, 5389, 5528, 5653, 5760,
    5843, 5897, 5917, 5905, 5869, 5812, 5736, 5645,
    5540, 5425, 5302, 5173, 5042, 4911, 4782, 4659,
    4544, 4439, -21436, -21472, -21571, -21723, -21918, -22145,
    -22393, -22652, -22911, -23159, -23386, -23581, -23734, -23833,
    -23869, -23838, -23750, -23616, -23442, -23238, -23012, -22774,
    -22531, -22292, -22067, -21863, -21689, -21554, -21467, -21436,
    -21467, -21554, -21689, -21863, -22067, -22292, -22531, -22774,
    -23012, -23238, -23442, -23616, -23750, -23838, -23869, -23838,
    -23750, -23616, -23442, -23238, -23012, -22774, -22531, -22292,
    -22067, -21863, -21689, -21554, -21467, -21436, -21467, -21554,
    -21689, -21862, -22066, -22291, -22529, -22772, -23010, -23236,
    -23440, -23614, -23749, -23837, -23869, -23849, -23790, -23698,
    -23575, -23426, -23256, -23069, -22868, -22660, -22447, -22234,
    -22025, -21825, -21637, -21467, 0, -5, -22, -47,
    -80, -117, -159, -202, -245, -286, -324, -356,
    -381, -398, -404, -399, -384, -362, -333, -299,
    -261, -222, -181, -142, -104, -70, -42, -19,
    -5, 0, -5, -19, -42, -70, -104, -142,
    -181, -222, -261, -299, -333, -362, -384, -399,
    -404, -399, -384, -362, -333, -299, -261, -222,
    -181, -142, -104, -70, -42, -19, -5, 0,
    -5, -19, -41, -70, -104, -142, -181, -221,
    -261, -299, -332, -361, -384, -398, -404, -400,
    -391, -375, -355, -330, -302, -271, -238, -203,
    -167, -132, -97, -64, -33, -5, 0, -1,
    -5, -12, -20, -30, -40, -51, -62, -73,
    -82, -91, -97, -101, -103, -101, -98, -92,
    -85, -76, -66, -56, -46, -36, -26, -18,
    -10, -5, -1, 0, -1, -5, -10, -18,
    -26, -36, -46, -56, -66, -76, -85, -92,
    -98, -101, -103, -101, -98, -92, -85, -76,
    -66, -56, -46, -36, -26, -18, -10, -5,
    -1, 0, -1, -5, -10, -18, -26, -36,
    -46, -56, -66, -76, -84, -92, -98, -101,
    -103, -102, -99, -95, -90, -84, -77, -69,
    -60, -51, -42, -33, -24, -16, -8, -1,
    -16576, -16614, -16720, -16883, -17092, -17335, -17601, -17878,
    -18156, -18422, -18665, -18874, -19037, -19143, -19181, -19148,
    -19055, -18910, -18724, -18506, -18264, -18009, -17748, -17493,
    -17251, -17033, -16847, -16702, -16609, -16576, -16609, -16702,
    -16847, -17033, -17251, -17493, -17748, -18009, -18264, -18506,
    -18724, -18910, -19055, -19148, -19181, -19148, -19055, -18910,
    -18724, -18506, -18264, -18009, -17748, -17493, -17251, -17033,
    -16847, -16702, -16609, -16576, -16609, -16702, -16846, -17032,
    -17250, -17491, -17746, -18006, -18262, -18503, -18722, -18908,
    -19053, -19147, -19181, -19160, -19098, -18998, -18867, -18707,
    -18525, -18324, -18110, -17886, -17658, -17430, -17206, -16992,
    -16791, -16609, 9527, 9594, 9781, 10069, 10436, 10865,
    11333, 11821, 12310, 12778, 13206, 13574, 13862, 14049,
    14116, 14057, 13893, 13639, 13311, 12926, 12500, 12050,
    11592, 11142, 10716, 10332, 10004, 9750, 9585, 9527,
    9585, 9750, 10004, 10332, 10716, 11142, 11592, 12050,
    12500, 12926, 13311, 13639, 13893, 14057, 14116, 14057,
    13893, 13639, 13311, 12926, 12500, 12050, 11592, 11142,
    10716, 10332, 10004, 9750, 9585, 9527, 9585, 9749,
    10003, 10330, 10714, 11139, 11589, 12047, 12496, 12922,
    13307, 13635, 13890, 14056, 14116, 14079, 13968, 13793,
    13562, 13281, 12960, 12607, 12229, 11835, 11433, 11031,
    10637, 10259, 9906, 9585, -10678, -10666, -10634, -10585,
    -10523, -10450, -10370, -10287, -10204, -10124, -10051, -9988,
    -9939, -9907, -9896, -9906, -9934, -9977, -10033, -10099,
    -10171, -10248, -10326, -10403, -10475, -10541, -10596, -10640,
    -10668, -10678, -10668, -10640, -10596, -10541, -10475, -10403,
    -10326, -10248, -10171, -10099, -10033, -9977, -9934, -9906,
    -9896, -9906, -9934, -9977, -10033, -10099, -10171, -10248,
    -10326, -10403, -10475, -10541, -10596, -10640, -10668, -10678,
    -10668, -10640, -10597, -10541, -10475, -10403, -10326, -10248,
    -10172, -10099, -10034, -9978, -9934, -9906, -9896, -9902,
    -9921, -9951, -9990, -10038, -10093, -10153, -10217, -10284,
    -10353, -10421, -10489, -10553, -10613, -10668, -5055, -5082,
    -5157, -5271, -5418, -5589, -5775, -5970, -6165, -6352,
    -6522, -6669, -6784, -6859, -6885, -6862, -6796, -6695,
    -6564, -6411, -6241, -6062, -5879, -5699, -5530, -5376,
    -5246, -5144, -5079, -5055, -5079, -5144, -5246, -5376,
    -5530, -5699, -5879, -6062, -6241, -6411, -6564, -6695,
    -6796, -6862, -6885, -6862, -6796, -6695, -6564, -6411,
    -6241, -6062, -5879, -5699, -5530, -5376, -5246, -5144,
    -5079, -5055, -5078, -5144, -5245, -5376, -5529, -5698,
    -5877, -6060, -6239, -6409, -6563, -6693, -6795, -6861,
    -6885, -6870, -6826, -6757, -6664, -6552, -6424, -6283,
    -6133, -5976, -5815, -5655, -5498, -5347, -5207, -5079,
    -19042, -19063, -19121, -19211, -19327, -19461, -19607, -19760,
    -19913, -20059, -20193, -20308, -20398, -20457, -20478, -20460,
    -20408, -20329, -20226, -20106, -19972, -19832, -19688, -19547,
    -19414, -19294, -19191, -19112, -19060, -19042, -19060, -19112,
    -19191, -19294, -19414, -19547, -19688, -19832, -19972, -20106,
    -20226, -20329, -20408, -20460, -20478, -20460, -20408, -20329,
    -20226, -20106, -19972, -19832, -19688, -19547, -19414, -19294,
    -19191, -19112, -19060, -19042, -19060, -19111, -19191, -19293,
    -19413, -19546, -19687, -19830, -19971, -20104, -20225, -20327,
    -20407, -20459, -20478, -20466, -20432, -20377, -20305, -20217,
    -20116, -20006, -19888, -19764, -19638, -19513, -19389, -19271,
    -19161, -19060, 32767, 32767, 16753, -16545, 32767, 32767,
    16753, -16545, 533, 501, 410, 270, 92, -115,
    -342, -579, -816, -1043, -1251, -1429, -1569, -1660,
    -1692, -1664, -1584, -1461, -1302, -1115, -909, -690,
    -468, -250, -43, 142, 301, 425, 505, 533,
    505, 425, 301, 142, -43, -250, -468, -690,
    -909, -1115, -1302, -1461, -1584, -1664, -1692, -1664,
    -1584, -1461, -1302, -1115, -909, -690, -468, -250,
    -43, 142, 301, 425, 505, 533, 505, 425,
    301, 142, -43, -250, -468, -690, -909, -1115,
    -1302, -1461, -1584, -1664, -1692, -1664, -1584, -1461,
    -1302, -1115, -909, -690, -468, -250, -43, 142,
    301, 425, 505, 533, 2074, 16545, 16551, 16568,
    16594, 16628, 16667, 16709, 16754, 16798, 16841, 16880,
    16913, 16939, 16956, 16962, 16957, 16942, 16919, 16889,
    16854, 16815, 16774, 16733, 16692, 16653, 16618, 16588,
    16565, 16550, 16545, 16550, 16565, 16588, 16618, 16653,
    16692, 16733, 16774, 16815, 16854, 16889, 16919, 16942,
    16957, 16962, 16957, 16942, 16919, 16889, 16854, 16815,
    16774, 16733, 16692, 16653, 16618, 16588, 16565, 16550,
    16545, 16550, 16565, 16588, 16618, 16653, 16692, 16732,
    16774, 16815, 16854, 16889, 16919, 16942, 16957, 16962,
    16959, 16949, 16933, 16912, 16886, 16857, 16825, 16791,
    16755, 16718, 16682, 16646, 16612, 16580, 16550,
};

static const u16 tbl_mario[] =
{
    1, 0, 90, 1, 90, 91,
    1, 0, 1, 181, 1, 0,
    1, 0, 1, 0, 90, 2621,
    1, 0, 1, 0, 1, 2620,
    1, 0, 1, 0, 90, 2530,
    1, 2526, 1, 2527, 1, 2528,
    90, 542, 90, 632, 90, 722,
    1, 0, 1, 0, 90, 452,
    90, 182, 90, 272, 90, 362,
    1, 2522, 1, 2523, 1, 2524,
    90, 992, 90, 1082, 90, 1172,
    1, 0, 1, 0, 90, 902,
    1, 0, 1, 0, 90, 812,
    1, 0, 1, 0, 1, 2525,
    90, 2252, 90, 2342, 90, 2432,
    1, 0, 1, 0, 90, 2162,
    90, 1892, 90, 1982, 90, 2072,
    1, 0, 1, 0, 1, 2529,
    90, 1622, 90, 1712, 90, 1802,
    1, 0, 1, 0, 90, 1532,
    90, 1262, 90, 1352, 90, 1442,
};

static const s8 joint_mario[][4] =
{
    {5, 0, 0, 0},
        {0, 0, 0, 0},
            {1, 68, 0, 0},
                {1, 87, 0, 0},
                {3, 67, -10, 79},
                    {0, 0, 0, 0},
                        {0, 65, 0, 0},
                            {0, 60, 0, 0},
                {2, 68, -10, -79},
                    {0, 0, 0, 0},
                        {0, 65, 0, 0},
                            {0, 60, 0, 0},
            {3, 13, -8, 42},
                {0, 0, 0, 0},
                    {0, 89, 0, 0},
                        {0, 67, 0, 0},
            {2, 13, -8, -42},
                {0, 0, 0, 0},
                    {0, 89, 0, 0},
                        {8, 67, 0, 0},
};