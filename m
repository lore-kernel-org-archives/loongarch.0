Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B504582CC
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579739; cv=none; b=XImmgzeUhxMOo7Yn6E1pFwZAzlJIcGqL6fuRz2bePJjaxHzjWqB55wRJ0sDKNDDAgjwV0pBgXLgUv1jv5r9V3gimghaC3BuKGQPZobSvv0JK3gXRCZ1lWII40B7k/UJEYOkzwU4sSR2pSwh/qAfylfqkuiqMRzU1njP5kqr7wsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579739; c=relaxed/simple;
	bh=+daBNykDtoitVmw2pH2Lp/o+iYWPKsBbA/YVlTEUkHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9JICdTl/LND/emO5nWZjC9S7ECEaxcdgfwv9j3hCxJFte3mogbldiHm21MU5WQaiQ0pElLKCVI9a+0UxkA4cYReOqPNW4LsiAmJCF45OiriJnzMla8ejtIrIqwY/bCndLI/dkeCd3x6F+idjo7fWbvc8cvcdpEEOk495Te9FKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZb/diIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlOlqcRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZb/diIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlOlqcRW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S6dlOu447114
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 07:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QjPhn8BZa4tijFZnj8o1Lt6anEukICGQ77tzi/vVnM=; b=CZb/diIQd8dVEQ0c
	bHTrCvVycM3/TrAPigQx1a+c2JQbQdfSEOGxNckMgs4LXqXwy3Ts0Rwm5/G4m+X7
	l/cCgtwRHdXZDLXCPchgCt1nPzcV5tOmpfLnqt4fJAzrYHHFa0mjEiJD5dD9qNjS
	V7g4oHxKO7qGN8rkdiTyu9lBkeUbK8aYSlT2dYQQOFl1D6MkO2OFRmK1jC79NbEK
	hOoe0o+x/995EVPch4TUnhwuc1p7dREs8qT+nwOvlXMEz4MyoZ1OQJkM/b0R8cLq
	MMIJgOgZ14z5ZNJO8gUAx9+ut7a5PDWh4/RvpWhzJuvUXUEB2yZDIHPe5fm4n/yx
	k4TAow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mr444-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 07:15:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso542592585a.0
        for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790579734; x=1791184534; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QjPhn8BZa4tijFZnj8o1Lt6anEukICGQ77tzi/vVnM=;
        b=SlOlqcRWFFf3NB4dP4wA8MDiRoBxJss1XMnmW2O1sL5q5cE/jpk6/OGQy2X33LKIuP
         2FjUwZAqOqusLnd3cqrJREUt8ZJBYyTushQ1u7DeD/YJB31p29zkuZoaVHScldBdQ0qc
         MCfDmBlJxA0XFeqXdwuXxuzVez4e4ZYCqTTGxR64Pc1KzZHxqBMX9jslat6EFWTcVz+s
         8pNWFiaVKQUpgcABhg/swanOQOC06ntEpfq6m8eneueQD4b70F9C2ZldNOl/rQjfSjsC
         vYgCrHYRiBGMMdd2Z8lliz4OZhTCZkXJ9EpKgodOc9RiJNETHENW412UkROFWsvLiDwO
         HG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579734; x=1791184534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QjPhn8BZa4tijFZnj8o1Lt6anEukICGQ77tzi/vVnM=;
        b=Ach/RcnwBlPwV1ccz5UNddxnivPYvF9PJdGjXdYMCPcPKfRYINlSfdddFEe1VJPsus
         An/9lGHeyJ1Ed2vW4MeJZlxcwe7m5pyrxFKnWGlRaPtXWs+6SNx1Ha6uBGK0+9bHY3Ro
         6Z1nf941CUSElAn67atsUGDyxsFCQbE2PEA10tfVCLh8SWYQiCCGSq2jmHFdItGIXFfL
         lwMYi816kNcn0PMeY93OHahzyCqTGwW1iWFPjPDtzUdOlHjSdDs9yQdj4S0FU21P6ECo
         dXkkcS/2kWI8th/OM9YoO4XF0DdomSqwMAWue0C8IvgILN6PFV98UJ0QKrirVzPpxM/l
         uL+w==
X-Forwarded-Encrypted: i=1; AKwUvByicmq8L0/nzhxZLBVOAN+++FfLb6eaBQlzWaub/MYMRdKYCarmZoKDJoxXFFLMWcGxXpVjTyCrlX0=@lists.linux.dev
X-Gm-Message-State: AFuF++knk1/1OVdFeR8SAiFUTHIn+QEwVye8jXybPvMozunehm+eBu8G
	jXqhVjzKY5TkSCE5/T8yLQWjvjkL54459Dqz+Bbmnii1zKZyUygcQeY8csJxb06cebtswUpq8hO
	FUz9pqDLuBWoyWE1XUj5OKO/jQrRB3smzG6fqzOXTp5hbZmMMRgEDDk3EwhuqGHc=
X-Gm-Gg: AYBFou3pHGLS82c/ZdkgBi1s8e/JkiDX85uBkpFARd46EUi2QqbsXxl21NvFVJphSkb
	47tlbM7VnNmjo4WR0E14aLptHPLnTs7olbGBqYALPyFir3kMThSMl9nrZ+XHzOSN/XtyFeDPHAc
	CP/8u5CgG4e6HdJZ/JBfpkgVAGsyCIrUN/wyGI8V2vR1kvIxfbU9a2yFOkja1z3n88g39cjta7P
	Hvz8w/7T4ApwHkvlKM8qTx6uN54l9xUEaw5OREXloiRo0CLg5N1dHFYpurYo1vzaFtjvKRZhZVA
	qwhnMlXHsuezUXuPCQW2nKPY0/EPmiPLp5XG99aQbfEYR3XQLGZgy84UD+OZTSJ1vh531JYkCks
	QlfngxoDbSj6pGFbxcJijJuhGSGAB3z8YPXqG2bnpRgPXQktScprYSAzOV8k2yg==
X-Received: by 2002:a05:620a:2602:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93c43d7d037mr1862784985a.32.1790579733573;
        Mon, 28 Sep 2026 00:15:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93c43d7d037mr1862781385a.32.1790579732950;
        Mon, 28 Sep 2026 00:15:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm24908932f8f.37.2026.09.28.00.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:15:32 -0700 (PDT)
Message-ID: <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:15:30 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] thermal/drivers/loongson2: Correct thermal sensor
 registration loop
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <cover.1790561983.git.zhoubinbin@loongson.cn>
 <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z19qg1MejlRW7gf2t-wyTPApyITZ17zF
X-Proofpoint-GUID: z19qg1MejlRW7gf2t-wyTPApyITZ17zF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyOCBTYWx0ZWRfX6IRqeWuhHdj4
 Dt3QIhqMbjgA9+eWVgY1tAqQNED7r0u8LmDlyVB8jNPaN51x2giUqqltrB0OHAHpnbkqVLFGMJV
 4tkKCR0xSQAuLQE/6KU7pVzaNUmirCHAOYrHeyuUeH6YBiIaqZABi/jfJH9whbKp3AwVj36YKNO
 YOfsVs9XXERI01alGlNffe0qvmTN+qi+/Cdmjur3QsXiZHebFCeCpBgHATnSYfgpAyoriBkW9Va
 QqpNoaQFNT9W0yMLqY/qSWYCtUgxZDsX38A3qy5Zzik9W6hleZAvIhK5bUorQFIvkaDaoCwE14L
 ujd6SVGP7/Yf84l4FYpn9feAeFNi7i0WJ9SgtahN/8pbjsMV8bTQrapYvedQJjlb7Hi3HR+5swe
 9NwM1NBOgpVB+jHRK24sgQALAJgxjK9+NVytfLesHXopBa33678EseIENCxGvocFda0n4AyZszK
 /mgbyJ903e2hi8xHEiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyOCBTYWx0ZWRfX0CFIZr9ooSnU
 eW5wk02uZlWtR2k+kydKT+9j/yhMjkbl50jjBtKoR/KoybYYMGBGIAOoUTRnxGTPLvNs6ZoTsVa
 jve+ZCWTELVPgP/4++D4ioBjwyWIVoA=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba1416 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=-hI6YwKNgXx_00ZoiBYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280028

On 9/28/26 06:44, Binbin Zhou wrote:
> The registration loop in loongson2_thermal_probe() incorrectly uses
> dev_err_probe() when the sensor is not present (-ENODEV). In that case,
> the driver should continue to the next sensor index rather than treating
> it as a fatal error.
> 
> Fix this by correctly handling -ENODEV and only returning on other
> errors. Also add a final check to ensure at least one thermal zone was
> registered.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbin@loongson.cn?part=2
> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/thermal/loongson2_thermal.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
> index 4d40fc706a53..99b7392fc68f 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -160,16 +160,18 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>   
>   	for (i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>   		tzd = devm_thermal_of_zone_register(dev, i, data, thermal_ops);
> -
>   		if (!IS_ERR(tzd))
>   			break;
>   
> -		if (PTR_ERR(tzd) != -ENODEV)
> +		if (PTR_ERR(tzd) == -ENODEV)
>   			continue;
>   
> -		return dev_err_probe(dev, PTR_ERR(tzd), "failed to register");
> +		return dev_err_probe(dev, PTR_ERR(tzd), "failed to register sensor %d\n", i);


>   	}
>   
> +	if (IS_ERR(tzd))
> +		return dev_err_probe(dev, -ENODEV, "No thermal sensor registered\n");
> +
>   	ret = devm_request_threaded_irq(dev, irq, NULL, loongson2_thermal_irq_thread,
>   					IRQF_ONESHOT, "loongson2_thermal", tzd);
>   	if (ret < 0)


The [no]error paths are confusing and prone to error, eg: 'if there is 
no error then check if there is an error', 'when exiting the loop 
without registering any sensor, then we assume tzd is -ENODEV'.

Please make a less cumbersome and implicit checks here. For example 
count the number of sensors and then do the check against.
