Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BF84BE423
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601788; cv=none; b=UIs3WoK9/KEuDk9giiHv6nj7ReGci3O8BOsayJudpcLfcYiwwtZ6Vekf609mXz61wX3kBKxdx+IaGztpJhfILo9j0z5Ua4YHWcomnfEDK4jNfLdPYLTJMKw09x+gpnn70oSy5Fhv3x8ObyN7KkvZnPVm9cI6mKtx1u03UaJocUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601788; c=relaxed/simple;
	bh=pizrIKeHoQjsnYL5ZXGAo09+SOFzIbhMyKVL4gpQBR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR4X6UTfSGP6DmCt5dJS+u+svsq/zHnFGUjffgvvBkaGx5nT41QXKBb6PseFXvpl3Ygmr5bp/JPXpee58XNTQ6DHJGEclaDtqwUvQjq8ijB2A1TIPHhFVaEkJC69Tj8xFXZvxyqPPGoCRjTgu9tjuKC7P0tP6NwhPRbVwQoKbb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eoSTGtzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFx8TL22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoSTGtzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFx8TL22"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAR1O1450513
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 13:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guc0q09pgXgZACQ1ISwNuyv5rDXiyX6HQAUQRihUMs0=; b=eoSTGtznprCCnquk
	sNMPFxiBUfHdwOw5CjVxLwwHRgvOdFf/HAxaOkc0ws8nBx8PubrO3ogsF1Mq3PmN
	ixIfEzYc82CW2sCEBcdebYKq86X+bolLmVPiYB2TPyctCRdsotbl1O1Jb8caSVI3
	0Hqf5BKuYRzmoB0pRSapmV1b1ed8ggH2JcK44LpkQtIUtzrJcPibTJVowA7PMo/s
	bCcj/KQgR+Tag7qRaEv9quRlxlgfWTDduvSkGOOyk0tJ70MRbxFhurCjHZcTVNte
	V/jGvnNF/MTHX9MYopNlcLxfZg2eMAJHq2W0wg/i426G7Mp0D5HGmoAWo53r8HRS
	INeRiA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxhk5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 13:23:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98527cdac1eso282578241.0
        for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790601785; x=1791206585; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guc0q09pgXgZACQ1ISwNuyv5rDXiyX6HQAUQRihUMs0=;
        b=aFx8TL22E4LCgI7KYqVD+/EufN2dvDrP6dvjoA7YiTKavwe2JGYlYHE/DFEIB2RhTm
         850OsH3w27cP4uEiCJIDHHSml9kc5N1HXhI+5tZbFh5slArJhkrFn8FY8YeaDbFBzKDD
         oKD50mLxulBNDA5I4JeMCwVyoVr1C1qT4gPzZlBYoFtDQTuZVUmnZLGnYEJrM4mRteiD
         7EPI7XuNPdejgSX2/AXR0fLqB6PsNnX56wZf8AyFFeMcbSzaqA8gTaJqmCH0Ni0OJEn5
         tc+n98YHyjCVFBCXDmr+v0jw6gN6vBafVlUxZ7VAvIvqba8R6b8QXWB6DLP1s/cs7ci9
         2b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601785; x=1791206585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guc0q09pgXgZACQ1ISwNuyv5rDXiyX6HQAUQRihUMs0=;
        b=DXpsu8a26pJ8Deth5RWP7iusSg4imcAqo5W+BwjfRUwc59WcgchTlhlLfWs062I+Ds
         RJoVVw4lYnFhwCZsZsMPwFelaXoiZXy1k7XmP2DtIvCRWoz7PUnTz9mon/3NiV/eU4rK
         Mpi0d952/Imd3otajFfC45ZSHZptI/pLvLvwyY6Upz78aQVNB4XvVYkYCj3cgVXXyHGZ
         JJLoLf3i+Q87+Q72hwwXXoekoZfHiYyAN/d5lQZsUDoVNycS2AvuBAYfeVSYeELg/QyX
         Xre6BRDmGny13ukCcp7T7Ha0f7/IXzYNnSxSxhV+pYujvBG1fgLVM3JRNR3dvaX0EULT
         99UA==
X-Forwarded-Encrypted: i=1; AKwUvBym1D1WgHk+KMdJrpJow3NaNF8/dZAnErDPVEYRqEHk1kGqVHhPkOoX1j4XqT9jGBWuFQxWIp3SxTQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYL4klYmSfg/K9ohdReSkLlCIGd5w5LCJFUbIMPH5vyyYc0k2LSx
	lf2iJwEvCuneaW0zNrNt8Y/SCDzoPYsPNdr4GR34NRrnYtdu24gcZK8BB+60Ve2gNGca69VS0YR
	zi8oRH0mvGNHLLB1Zl75KrSVVG8zwSaUPVlvxHVlaauNEC96RmoBrxaVq8nK0wq4=
X-Gm-Gg: AYBFou2umC5QEzBzVdjarkPYXTFMn5tYY9rh+z3/nN+7hZ45gVKyjmeSarInxPDbi4H
	7mcm+Eb0HPOrTIlLH1+lcD3oIp/uWL7qn/vgidjnkdEDslRffA+VSrkj893AqyMiBAUyLJ5iCWU
	wI8l+CqxJ92hRFFvLSZFerP/RjDOIHlvkMRVW/xXsG8HxbPoO3LeVl//RP9OJgwe5aTTtazMDDa
	mSS/wy2AH7MwtBZckV1qXIJxXSpi7Eq4twGK3iufqHVTcVl/DAUkLs+kySJ8gBJecT01vJY9JQ8
	m9/zMXb1ZB1cus0QZgUmnVDASi2foZQ3eCZw/F2m/Jemeh3TG1dlOBLq+gbTtCsey3yFZsiMtgm
	Nj17aRcX6we4SmzpBaA==
X-Received: by 2002:a05:6102:442b:b0:7a7:196a:84e4 with SMTP id ada2fe7eead31-7af1ebf4fa0mr4105644137.28.1790601785011;
        Mon, 28 Sep 2026 06:23:05 -0700 (PDT)
X-Received: by 2002:a05:6102:442b:b0:7a7:196a:84e4 with SMTP id ada2fe7eead31-7af1ebf4fa0mr4105631137.28.1790601784507;
        Mon, 28 Sep 2026 06:23:04 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0d538fsm4208685e9.1.2026.09.28.06.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:23:03 -0700 (PDT)
Message-ID: <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:23:01 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] thermal/drivers/loongson2: Correct thermal sensor
 registration loop
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <cover.1790561983.git.zhoubinbin@loongson.cn>
 <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
 <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com>
 <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cwxOmZSRjvwn26f60OXEfntl5W_xTArw
X-Proofpoint-ORIG-GUID: cwxOmZSRjvwn26f60OXEfntl5W_xTArw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MyBTYWx0ZWRfX8FfuZZC1hlCa
 OD2pd4QpLDlCSLdLChkkAMonxmAHMS7U/Eh1QFsveRvclh5g4CIIeStoVN5ZkmblP71jKRiaxl9
 eiqrDljK77zmoxaotlIPLLAWGmD+upk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MyBTYWx0ZWRfX5PmBUGXYUAry
 5QP6vBsQxzKgXToyXllisF358DwFNZN+ffOdYWILfjDG13lwX11gRzelkWTw9y9U0wju7XUTcUd
 Zkt4+p8/F/4i78fr9jjU8+WNR2V9agVrA2RY0n8aI8d8Co5Odi/fvxUo8XUbw6EYLDIcUFLWroy
 lhhQx6OR4/YcT/NHMm30iW8Ts0vtlq0Y2soSJwLumeeZ81/dygoTw709ZRCFB7WxOeQK1EcoQuF
 A4+sjfVZMqRKjiaoHyGHnooxn0carEcyB8FsT/t7IoaxzIgRO8z0QzBP/cnxDcCYmQdZ2ycS2hJ
 8y7akiff2GF3tShRofvCAd9pETqBMSv5kgVDv+NErbVc2yqCVdxoiY00q5lgI36Z/AKPR31jy7b
 Qc6i/UZ1BUhugcK+UDDWhlrVnyy5kdwjtO1ncuE1fznBU3nu50DK8Nus98dZi6vEv7LVOXXj0AE
 iDzh7+Ql8Ga5mX0VJFQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba6a39 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=84pesApZu4OvMfbIMCsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280053

On 9/28/26 10:17, Binbin Zhou wrote:
> Hi Daniel:
> 
> Thanks for your review.
> 
> On Mon, Sep 28, 2026 at 3:15 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> On 9/28/26 06:44, Binbin Zhou wrote:
>>> The registration loop in loongson2_thermal_probe() incorrectly uses
>>> dev_err_probe() when the sensor is not present (-ENODEV). In that case,
>>> the driver should continue to the next sensor index rather than treating
>>> it as a fatal error.
>>>
>>> Fix this by correctly handling -ENODEV and only returning on other
>>> errors. Also add a final check to ensure at least one thermal zone was
>>> registered.
>>>
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbin@loongson.cn?part=2
>>> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>    drivers/thermal/loongson2_thermal.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
>>> index 4d40fc706a53..99b7392fc68f 100644
>>> --- a/drivers/thermal/loongson2_thermal.c
>>> +++ b/drivers/thermal/loongson2_thermal.c
>>> @@ -160,16 +160,18 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>>>
>>>        for (i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>>>                tzd = devm_thermal_of_zone_register(dev, i, data, thermal_ops);
>>> -
>>>                if (!IS_ERR(tzd))
>>>                        break;
>>>
>>> -             if (PTR_ERR(tzd) != -ENODEV)
>>> +             if (PTR_ERR(tzd) == -ENODEV)
>>>                        continue;
>>>
>>> -             return dev_err_probe(dev, PTR_ERR(tzd), "failed to register");
>>> +             return dev_err_probe(dev, PTR_ERR(tzd), "failed to register sensor %d\n", i);
>>
>>
>>>        }
>>>
>>> +     if (IS_ERR(tzd))
>>> +             return dev_err_probe(dev, -ENODEV, "No thermal sensor registered\n");
>>> +
>>>        ret = devm_request_threaded_irq(dev, irq, NULL, loongson2_thermal_irq_thread,
>>>                                        IRQF_ONESHOT, "loongson2_thermal", tzd);
>>>        if (ret < 0)
>>
>>
>> The [no]error paths are confusing and prone to error, eg: 'if there is
>> no error then check if there is an error', 'when exiting the loop
>> without registering any sensor, then we assume tzd is -ENODEV'.
>>
>> Please make a less cumbersome and implicit checks here. For example
>> count the number of sensors and then do the check against.
> 
> I thought about it, and you're right—I made the logic here too complicated.
> Let's use `sensor_count` as the counter. Is the following check logic clearer?
> 
>          u32 sensor_count = 0;
> 
>          for (unsigned int i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>                  tzd = devm_thermal_of_zone_register(dev, i, data,
> data->chip_data->thermal_ops);
>                  if (IS_ERR(tzd)) {
>                          if (PTR_ERR(tzd) == -ENODEV)
>                                  continue;
> 
>                          return dev_err_probe(dev, PTR_ERR(tzd),
>                                               "failed to register sensor %d", i);
>                  }
> 
>                  sensor_count++;

If I'm not mistaken in the previous version, the loop exits at the first 
registered sensor

	if (!IS_ERR(tzd))
		break;

Here all the available sensors are registered

>                  break;
>          }
> 
>          if (!sensor_count)
>                  return dev_err_probe(dev, -ENODEV, "no thermal sensor
> registered");
> 
> 

