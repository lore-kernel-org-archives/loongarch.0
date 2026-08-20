Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772A443E076
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228649; cv=none; b=DyQIniblbY3t1TamaDj1zazRf/SlpeSk5LMneAOmDnxE71GPlVcBweWYG3JAGZtchweP19vOne6KddkXG4D59g6Z62GJC/mBN8b4cC9/fyrrmgjQeZdTOPcR2MdhzRrzBrqzOpRdDRcYUK3ijw8T+mynFyLWmWK0h6KxRGA3e7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228649; c=relaxed/simple;
	bh=Ui/hP+QL6ancseNG+Kxx4ozLzkd475S3Hpqx/mBIMOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOJSgIWtA+og7BT7kkqGnxQSRPKNr65WqiV+l+doo677M/yaxkjGyHnOVRL0B8lLtWurmaoWpA1EcvJs+TTgg7JaYsKn7fPCr1WiOs/Az3xN0FTYsjr4gsyNVEEDPwO7zS7Iv62wp94iyzyqr8JUcLC1CmYh/d4W5KqYpUCuBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxEFfG+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JroryXIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxEFfG+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JroryXIx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K9JGPk2927196
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrlmU7VL41FHOTbD5cdWiU9bgIS+YIxBeShNI/+hVa8=; b=IxEFfG+HvpqHgjUT
	8T+BKA4fVOxl4OpBOyg1Lxel3uyzrNtTzCbUjRgVqlswqf1tfMPVcnr9eKJTZimJ
	HSjHsaMOeTimK4Qqg0YlgU69rhk9CqAdL8Og7zJQkutG1PsUYxzcWN+H2yOQd284
	03DPREM6YVDrBDOsv+l83l1YQkhtb9e4XvsVtnZyw8ZnAZfNZgIoCF0NI3ug/5MD
	9RkJXR1Z5+UQu+zbqYEE3yYoBGRtjbM20yK+EU6R2F5D6+jetX7+Yhm+xb3bFuQR
	vO+Gz8i/zhwbd+Au+1HmzbRR1IIH1j57ho9kpMS/N+PKgCNfb2q04G982vTeyWvP
	Uh3JzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0p2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:24:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1096606b3a.0
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787228645; x=1787833445; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrlmU7VL41FHOTbD5cdWiU9bgIS+YIxBeShNI/+hVa8=;
        b=JroryXIxGIgurbtSEwG3jSe0cR7VaGkzNCuh/A8mHR2p7DzdYw7xXHonBKPx4/sewg
         HtzpNcIIjn0lx4vA1R5AU1rCGhM/2WctU/FWeFBmy4OzcBNDXkENI8NweuWlz2SUpYgO
         iU6SvnTl1mmNQvjY+Q6eIpjq5UVX5Iu1DPChPmAJRITvkQQl+YfoLGnW1LNuyoKWLrid
         k0eOX9Y/yMkndt1yQmH1j3+h03CtGzgp1r4TFrnIAKMpIlP/bJJXsKaSjunzrcTGETb1
         j4rkELM5T9oFpCuYpl6dYzNpbP/Z0hFWdfGvxWcF7qVgO3XEVzTbOeh7ZJ+BrlQtacek
         Mlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228645; x=1787833445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrlmU7VL41FHOTbD5cdWiU9bgIS+YIxBeShNI/+hVa8=;
        b=cRwtA6wIVBBnj8luKVZ2YmnTNSB1BKB4sYuUu69OupaYe6ljW8V7sveiYyVtusJ6Nr
         0We9peY7jtDAuvtqYGAR1FZzGaTyKfrjUES0tpATzjgIZcFk5PIv5ZXsInvjaqewcG+c
         JNh0aiWaXs2514I8kRwIhUBJOAMNSpwpoLOnFL2VcxqHvAAW35IOjREtdb/R2aVuupV5
         FOODazYUCP6PMthVZxqYroXJu9OMWyxn3i2OKnv8T6tDTANuJH7CdGEQcfcJnndKJkNW
         7JZ7xmvYpeozZ1GCiqnxtcTlfxeLUy3mNTJL0TRVJdcjuZpIqZII6w9x6EPKP7gDgNiu
         BgBw==
X-Gm-Message-State: AOJu0YwNitz85HUlqq78/uN6hloERwOGuD2IzDTjDp19UnlPOXRDaeft
	p3ns7uLj/Bcd8wKaZxoOa4Vx7yWKq9b/6OsdiaUnMnRtpy4DCUTnCv+nxiLKUJtHMw3z6zRdv3N
	M5DKcB7XQWRX7BA5yueEa1bTmKFEt1bHX1CsFmvN0nEeNtXxyDO7+CH3vV6qysgY=
X-Gm-Gg: AR+sD12TJ80f101b7M8dkGnysV/rm+MRAS+8JZ8QBfyWHamjO/oXG7oa3LytpGXN6QF
	DLovlxDWpgJnAoD1/vcD777wVtKjXbT+wSr3VQp24cs7AQRe4ikroAvrYzL0SowEg4dXT4KRccf
	Jj0vklsXtaH1qokKc2s9N4f9apEM3DqqlPADP087A4C5hZHBA2c6oEQlLRs8ppoac0lvqmtIjk6
	2ttJKmZCgJKm6PoBhnPfVd1ZbXAtXEAsps3M7JSof5VNPj+jBQO0zA2Hri/tuPN/4WJUWJqoIE3
	NMNFojZ2NeSbq/F7jMKQrvBNuUgd15rTTePHKlL7/czBGuwyJVqr8DugBCRInWoMAvtiSsoo/xV
	GsdUEwZwGUWvGYnZ/9IQl2PfTH3c5FLa7z5lR0Ukv81y0zypfkX01BoiCGbnqaAuxfAdZvpZ4
X-Received: by 2002:a05:6a00:4007:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-851dfa00aa2mr6762123b3a.8.1787228645245;
        Thu, 20 Aug 2026 05:24:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4007:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-851dfa00aa2mr6762048b3a.8.1787228644731;
        Thu, 20 Aug 2026 05:24:04 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1601613b3a.38.2026.08.20.05.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 05:24:04 -0700 (PDT)
Message-ID: <fed97fbc-7d78-4509-86c2-cb302d3957db@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:23:59 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cpufreq: loongson3: Use global physical CPU ID in
 get/target callbacks
To: Huacai Chen <chenhuacai@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
        Hongliang Wang <wanghongliang@loongson.cn>,
        zhongqiu.han@oss.qualcomm.com
References: <20260818123921.3600606-1-chenhuacai@loongson.cn>
 <20260818123921.3600606-5-chenhuacai@loongson.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260818123921.3600606-5-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VaJFnEcCcV4OpnRiYvuVrPXXixu-RVeA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MiBTYWx0ZWRfX69HMCQdV9PsR
 AvpYMD2+CJ3hEEAJRUmI55mkMBbzig7Qgo3ElCfdrdNd5ocdgNKY6ZW9iuxP9ynRJLn6m18cADl
 HzRQ/JmmPHEIfP4naXmGzPWj7oYl/J0=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86f1e6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=civxVzKdHa92ALpkkEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MiBTYWx0ZWRfX0mgwQwseou3z
 IN7h/tLxH2EH4FOJ1T4UGXm0VQnUFxndd4anEh+RC+9zyik9QWcgY6SjHQ+GmLHJxM22Adf8eDl
 1s7xtG+CmufVyq3JseI+FBgTl7FX+OUkN+mk7Rpi59VQq4JlPjB/Sh6ovM5iPiSp2gSAuaSRkUQ
 uTCy0tQmll+z0L629Eitkop93W+ql4e6TvxHX58nD8PO2siC5RdF104bA3IAB9fu06/bc/t0iJC
 t0A5fKgPp6UTHZwT3u14jFGUuIvh6OvqfZelr+fI7PKabZbOCEQaNcVPezycq3HPpe20QUU+gbf
 AJjjozFVOhk2HGwfTaKgP8wcjtcKpRqZWu3jJzRed0kXyHSVwloB7sEDXLba7Fky6jkFOp24SNh
 7rOjJ5AkJiT4vuOsxbJQT8yIvEyWMWMwqlPsijduy4vERPCw0aX6YEo6d8AaKZXpofQnvcDG58l
 rv5hR0Th/JKTw7ycGNA==
X-Proofpoint-ORIG-GUID: VaJFnEcCcV4OpnRiYvuVrPXXixu-RVeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200092

On 8/18/2026 8:39 PM, Huacai Chen wrote:
> Our server productions (e.g. Loongson-3D6000/3E6000) can have discrete
> global physical CPU IDs while the core ID inside the packages are always
> continuous. In these cases we should use global physical CPU IDs to get
> and set frequencies.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/cpufreq/loongson3_cpufreq.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
> index e3cd78a5ab18..c75c0e30e881 100644
> --- a/drivers/cpufreq/loongson3_cpufreq.c
> +++ b/drivers/cpufreq/loongson3_cpufreq.c
> @@ -219,38 +219,40 @@ static inline int do_service_request(u32 id, u32 info, u32 cmd, u32 val, u32 ext
>   
>   static unsigned int loongson3_cpufreq_get(unsigned int cpu)
>   {
> -	int ret;
> +	int ret, core = cpu_logical_map(cpu);
>   
> -	ret = do_service_request(cpu, FREQ_INFO_TYPE_FREQ, CMD_GET_FREQ_INFO, 0, 0);
> +	ret = do_service_request(core, FREQ_INFO_TYPE_FREQ, CMD_GET_FREQ_INFO, 0, 0);

As patch 5/5 changelog:

"However, IOCSR read/write can only perform on the current node, while
sometimes we want to perform on other nodes"

However, patch 4/5 starts passing the global CPU number without updating
do_service_request(), which is only changed in patch 5/5. Doesn't that
mean patch 4/5 is broken on its own?

>   
>   	return ret * KILO;
>   }
>   

A separate issue， do_service_request() can return errno such as -EPERM,
it will cause .get() func return a large unsigned integer value.


>   static int loongson3_cpufreq_target(struct cpufreq_policy *policy, unsigned int index)
>   {
> -	int ret;
> +	int ret, core = cpu_logical_map(policy->cpu);
>   
> -	ret = do_service_request(cpu_data[policy->cpu].core,
> -				 FREQ_INFO_TYPE_LEVEL, CMD_SET_FREQ_INFO, index, 0);
> +	ret = do_service_request(core, FREQ_INFO_TYPE_LEVEL, CMD_SET_FREQ_INFO,
> +				 index, 0);
>   
>   	return (ret >= 0) ? 0 : ret;
>   }
>   
>   static int configure_freq_table(int cpu)
>   {
> -	int i, ret, boost_level, max_level, freq_level;
> +	int i, ret, core, boost_level, max_level, freq_level;
>   	struct platform_device *pdev = cpufreq_get_driver_data();
>   	struct loongson3_freq_data *data;
>   
>   	if (per_cpu(freq_data, cpu))
>   		return 0;
>   
> -	ret = do_service_request(cpu, 0, CMD_GET_FREQ_LEVEL_NUM, 0, 0);
> +	core = cpu_logical_map(cpu);
> +
> +	ret = do_service_request(core, 0, CMD_GET_FREQ_LEVEL_NUM, 0, 0);
>   	if (ret < 0)
>   		return ret;
>   	max_level = ret;
>   
> -	ret = do_service_request(cpu, 0, CMD_GET_FREQ_BOOST_LEVEL, 0, 0);
> +	ret = do_service_request(core, 0, CMD_GET_FREQ_BOOST_LEVEL, 0, 0);
>   	if (ret < 0)
>   		return ret;
>   	boost_level = ret;
> @@ -263,7 +265,7 @@ static int configure_freq_table(int cpu)
>   	data->def_freq_level = boost_level - 1;
>   
>   	for (i = 0; i < freq_level; i++) {
> -		ret = do_service_request(cpu, FREQ_INFO_TYPE_FREQ, CMD_GET_FREQ_LEVEL_INFO, i, 0);
> +		ret = do_service_request(core, FREQ_INFO_TYPE_FREQ, CMD_GET_FREQ_LEVEL_INFO, i, 0);
>   		if (ret < 0) {
>   			devm_kfree(&pdev->dev, data);
>   			return ret;


-- 
Thx and BRs,
Zhongqiu Han
