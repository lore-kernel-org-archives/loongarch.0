Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D35847CC62
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671446; cv=none; b=CqLM+ysH7uhWhGhacHROdNSw+MeXroD9w9fn+2e1QiFtDG8JqZJ85LUyZKWwCVzdkseMfQOtRfifC3QFXZRMXIg/M4LVkr9Hw5VQqUA3imQoxkIrbxkoSxrsyXDKRkmERhjYWiRkbA+UGo812TaMLwxL4oWCnXO4cABYZuocIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671446; c=relaxed/simple;
	bh=PW29nh6AHKIAfInJuhHm2rTl7ZNcfWfYAnmTTwkdspk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uK+YvLrqaqX15EC1whSUK1om0GUeEDEXjVrCQXgG2GHhfLp2OTi3Qrr8nM+0Aru8p/p99ONxdukgqBUQXGYSl/Hedwu+6Q25+zmo0jc3nNR3PDSek0xqmQDOHzD6LsoHQ9kRfZ+7VOTJMmr1B96SvytIArGoh7Mos77xL+un8U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrL6QsEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOODlmII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrL6QsEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOODlmII"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tpod2570985
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 08:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IrKwOcgAyyYp97eQvpSA/WpL5HLMDhjcoFZkd6DMhmQ=; b=hrL6QsEX1aXwzaj2
	/nmBYfgLXBUNlA8EIbp0Q/hWDhvaDrOksMM+nuWhdijbF9KSuiDtuuPBxzp87CEN
	PO/rFxo6wnvJOxPbCMI3s6Nxe3q7WIlFNx84bSDhLETTzX0+Cak0oI2xgUprLI3e
	2LmHZ7mw8WtDQAtkA35Wf72wmhWVIEwiFWHT3lz3FNAK5qW5hsR6MIiqY5Y7yBte
	xZ+iAWWPuYNRVju0Kxw15UQYufFusVKzFByXfC+kd2tn0n5xotO5Y6ljJa8WQZKX
	dWcxv939+CrjOu0O91Nj3Uz08vRaZPjMthqWdNAq1Su2uy1dE1BN3/ZI18jC/wJG
	Zk+/NQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn9rc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 08:43:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1117641085a.0
        for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790671436; x=1791276236; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrKwOcgAyyYp97eQvpSA/WpL5HLMDhjcoFZkd6DMhmQ=;
        b=aOODlmIIylQSkmLKVLcdQY2aR29dqWBwxqQd1oSBxyrzDDW4nntDowopyG7QAqIZtK
         49MF2Gx9Za96xvaplecIcO8zveLbPpM6KbT/pSBY8WMJj8Lrh52yiv6zSh8fvKeowudn
         K8M4zR6FcMqznGJOFfyZ1IZUHG5OcfDMbpln8ccQ6o1lj6WCnvSt/jDz9A2+pqNTGLE2
         v/MVWVr850h0DyRLxjbArwRSOL36EZTsF4jpPJ4eEZES2fcHS2i99coTAoFjcKuspvo3
         2JPfwaIgIXiYMhoQ3jl0HsaZT8ZVjBqOpPsTgHrtligc4zf9X5OsgUVYUfcQFahu7zIg
         ah0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671436; x=1791276236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrKwOcgAyyYp97eQvpSA/WpL5HLMDhjcoFZkd6DMhmQ=;
        b=hySVEJ1svjZUDoZkQhySA+fKaaGRt4/g9JeEpNOne4lw2bl0UB6ypxTuZ/gg8/jZ3a
         MIfuNIF8Tn8aKnJaL9wZKzKLzn+ORULV/o7pXFTf+vXAeqYgeEHZNejl2bZ1YV9d0miA
         tQHJ3Ko+DUMcwbu+68BRP7YHM89ZpmSLJD2GHydLDY4Dq1syHJyiNq1ev6ijM0rC+a7N
         /OS1XFJ88KNdH9/oBcO36/pYSGcXodm+JaL0Rh/fXSlaUquw006QvAciPxplkJhPDmUp
         tyHFDXpfsUXREM346qkL51YsXRu0bQh10hsEEiyKDKPRc9E4mT0Bw7EUSNbF6igzPv6z
         VYfg==
X-Forwarded-Encrypted: i=1; AKwUvBxsd+0k4VMCoyKEchvQoA2yWS24Z1gI3S22dfIeDLAJB1Ol6kZ7dt3zRv0HzViWZiDGTUJlouhawK8=@lists.linux.dev
X-Gm-Message-State: AFuF++l+lucpugqlIjcpAGkuYMZ4uWi94TzpkWHvldxeB/rA1WsiR5ox
	p1hWjnnnT3pOMtnyDilEpprLpd2r+Yuog+GXZoueoUt3lCfIQPIK7cwsrwyAmF4yeczOuxrm3zW
	5mNhomouBWFPvd+HrgLjnfjtOI5db16q1m1BWesJMzMyRr3gBExUy5Pthl+PuHrI=
X-Gm-Gg: AYBFou3kx+s6Pff8+GkmaDq03tIVSBPdlWM17oFTgD1WbUgn8kEDtdZHcpVzozOXRVL
	eNM3S6o28z9ULGxiW0ix+P6OFIUeIzHC8hL5t6WXciHY3cmcdT4ibijQY0L0oe+M4q40RSRhtDU
	XZddcaYUTSfkBGOJcRMjZwzhKB30yJUGH6nloQ7RDVGmHlX0MGWaJ0kJwVUmbKiWEVqq0QPuu35
	alMdtBP5QQj78geGMNJ9qF91hOiKHnnmIvQ63Sf9cTVelZE7oDW8XQhSZM+xNQpxETNotvSP2gM
	Yy3UCqSgPz1wUrTpKjT3kuNKbwuKoxg/8LGDDKyOMsMBJXq7/ae3owne21QtxnMxDfdQL6Q0uh/
	UprVHNZytiokdskFR0w8696ljd1wh/S/SqJDg1NQUba0qFsMct74FDgzJzTg1Lw==
X-Received: by 2002:a05:620a:8906:b0:939:de48:e41f with SMTP id af79cd13be357-93c4749888cmr2363838885a.31.1790671436414;
        Tue, 29 Sep 2026 01:43:56 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:939:de48:e41f with SMTP id af79cd13be357-93c4749888cmr2363836785a.31.1790671435949;
        Tue, 29 Sep 2026 01:43:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af507611csm2211528f8f.22.2026.09.29.01.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:43:55 -0700 (PDT)
Message-ID: <a2b8e238-7f40-48fe-85c2-f8e52041b3e6@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:43:53 +0200
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
 <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com>
 <CAMpQs4+hATFf+0w6Wq09RoZB1JJ5L_GP0aWxcGAeraTW7Gfy0w@mail.gmail.com>
 <8eba263a-c233-42c5-842e-7487ea36d5aa@oss.qualcomm.com>
 <CAMpQs4JvLOUv3o8tktg-EOT85KCunY9gJhgxQVkZEXPH_C+4EQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAMpQs4JvLOUv3o8tktg-EOT85KCunY9gJhgxQVkZEXPH_C+4EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb7a4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AP4mLQHTS3Hkw8D5x4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: kD7PvuStGN3bfhklF4fC1p6G0Rc8IOxU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX+Drf4fo4EtbW
 2TQIpoyVjTa+yYTtvl3F7ONFi4gas74xqTwzLinJ8wMedeRcKcKB7C31Y775VHAlxXeC8ZnCj+Y
 GNMAi45KQEf8sxeTv1NMllln7u27dvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX+JbANzN6QgPV
 0OLpYOw2jnMpZphjPRkTP2X9xBxbJUv0vzGqhGMSqoxK0iyAP6Ya3QUgdQHqcIlbZxb4rkvwYWb
 oj31TXcZ0exslBXAd7cBoyIwKTkozYVRp1ygpNOToVejw2Mm7AzqiHL7AdjPaIiRSR/kzLJAC+X
 9laE1lJIBkmQb4WAtLv1SFFn9HI1PZCpI5j+O956d1Q8ALPD1dZxCdTGnzjeaCB/HVrMN2KTkG6
 VVtHYq+lXwBLgUy2fp4YnOXjfxqHcde8IcBV76H04Z2Q/UANmMI8/wtgEuplBMFhfy7vejvJaba
 Lf7VQK8kCKhTv6eGmXuvPLlQdKbhpn6/nf71n5OXIOD296sYU5phuGOg496dLxrPy1tu2MNS80W
 AO5n4ZWYZcHAcvHdV4PE5CAxkirGXmpwzagqb5CiR32gML7IH8F0w8eADD60zr1s1oAOxNupzUA
 lIfSXhvbLxnLuhqj26A==
X-Proofpoint-ORIG-GUID: kD7PvuStGN3bfhklF4fC1p6G0Rc8IOxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290034

On 9/29/26 10:23, Binbin Zhou wrote:
> Hi Daniel:
> 
> On Tue, Sep 29, 2026 at 1:46 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> On 9/29/26 05:06, Binbin Zhou wrote:
>>> Hi Daniel:
>>
>> [ ... ]
>>
>>>>>> Please make a less cumbersome and implicit checks here. For example
>>>>>> count the number of sensors and then do the check against.
>>>>>
>>>>> I thought about it, and you're right—I made the logic here too complicated.
>>>>> Let's use `sensor_count` as the counter. Is the following check logic clearer?
>>>>>
>>>>>            u32 sensor_count = 0;
>>>>>
>>>>>            for (unsigned int i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>>>>>                    tzd = devm_thermal_of_zone_register(dev, i, data,
>>>>> data->chip_data->thermal_ops);
>>>>>                    if (IS_ERR(tzd)) {
>>>>>                            if (PTR_ERR(tzd) == -ENODEV)
>>>>>                                    continue;
>>>>>
>>>>>                            return dev_err_probe(dev, PTR_ERR(tzd),
>>>>>                                                 "failed to register sensor %d", i);
>>>>>                    }
>>>>>
>>>>>                    sensor_count++;
>>>>
>>>> If I'm not mistaken in the previous version, the loop exits at the first
>>>> registered sensor
>>>>
>>>>           if (!IS_ERR(tzd))
>>>>                   break;
>>>>
>>>> Here all the available sensors are registered
>>>
>>> The name `sensor_count` might be a bit misleading, but here the loop
>>> exits after the first success:
>>>
>>>                   sensor_count++;
>>>                   break;
>>>
>>> Let’s rename it:
>>
>> Can you clarify why only the first sensor found stops the thermal zones
>> registration ?
> 
> This section of code is based on the original version by zhuyinbo; I
> noticed that you’ve had related discussions about it before[1][2].
> 
> I’ve reviewed all Loongson-2K CPUs that support thermal monitoring,
> and they all have only one temperature sensor, with “SEL” set to 0.
> 
> As I understand it, given the current situation, the loop here doesn’t
> seem necessary—physically, there is only one temperature sensor (even
> though its SEL value might theoretically be non-zero).
> `LOONGSON2_MAX_SENSOR_SEL_NUM` does not accurately reflect the number
> of temperature sensors; it is merely an interrupt input selection, so
> using it here does not seem entirely appropriate.
> 
> Therefore, I believe treating the Loongson-2K thermal driver as a
> single thermal sensor better aligns with the current hardware
> behavior.

Sure, if the Loongson-2K is only one sensor based board then no need to 
have this loop.

In the future, if there are more sensors coming with a new board, they 
can be described in platform private data


