Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261644334D0
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225708; cv=none; b=HseXb0ceu5/ov3CIMbyRO8YwvRPbrQLhjpZIBEfdVDYjPE9yv69LdfszlWbJdfhtXp0R6UqB6Qt2X2mLBmoSBVcLJj6TvtkQPDsZpVENTl7QBvXtLSEEMw6jex+F2oztzaQKWTGYC6NW7WRK3rUGJFJj3J3ErG69+11W0kkQhV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225708; c=relaxed/simple;
	bh=w/oe/n1XYNtDc0P/sdP49l4CFCqy7eqL6XVrY+vYFP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSzd9A03VM1l4d53i4r3T8w1Qf2asJuXTbbwt0FNVLf7ROwxMfyHCIKkjkjcNJKwEGImD5qgJdWmU+0g23oyMsfaa0pXOysz90oAoYVf0+/5/Wv0t9R1oKaYXMjNCJrAYkWrMZfjVF0uuu4fCmOs98nLfhvxGWgCxZtCSiT01TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INnkzwFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK2qrV3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INnkzwFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK2qrV3N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eX9h2161054
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 11:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozwCerwZWysjPLIz52++2YvvXko1OeccWoS1EoE+S/c=; b=INnkzwFDr3Mt1N52
	g+XzLhNJuP+bvMZ1xMcVQcUw5aLDHKyA8EVsfD9vtdhiDG/VqOAKHKPfbYiL5Ky0
	4UfyOzpOTJgAS+VXDxyt6nu+I9LNrqrIrNUdqg0dgy/0fdYHvsofX89QYMvG3o3A
	WBJHYkd5w0pWXPGrq8ZZec33IxE6/yDkOTTs43JL0SAzWTRA4C9iRFe+i8JcV46n
	hbJDHDyU1D/pB9kGyG2DSDUcAq6dF6hpAYfUjbjJJkTzBEwgFJXJrqVTBcipwv2q
	9bbd5+x/7UOk9WrPY//PscDf+SUWRq6XThmZ1eDWmLHyggSsg0oRT3qyVrZc8+MB
	GrA4aw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7s319-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 11:35:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e024d2129so3349962b3a.2
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787225705; x=1787830505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozwCerwZWysjPLIz52++2YvvXko1OeccWoS1EoE+S/c=;
        b=jK2qrV3NTl5STTdVPWS7Gapz6tQmau8PH+58irH9Lr40f6beYHpgfCY5ZgXKspU1TM
         p1xG42zsi9zE188pqPvogNDwZMMtc+Z9Tc+mOFB2RvUvn1JOVsHx3UdHSfzzqtrfDv6V
         lv2117Jj1MELdCIkyfTqLXZLxvPhZ7kJIp7JorJMctLpi3+J03MAAgG6qLEF3lsXSJ7u
         x0zEgha9K29zBT76GOrjP44/x/PdNvtv9m6T30VYIdKdW+WJabsG8EpGp9J8/iXb5ZF+
         eksG/EvsQ8wzGbnmG+QVQZyyd9LCz8oNkY/krlAT58dJLPA6gcKsbjjlaTuOpoAj8qC9
         +d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225705; x=1787830505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozwCerwZWysjPLIz52++2YvvXko1OeccWoS1EoE+S/c=;
        b=CSW9NCgYIj+MtnoarqU6l6OswiFMqutQbgFudwJr9DnUKCw1lAQu6e3l4lkVtESGoO
         gq2Cu+61ioyLchVIVQj7CEjoL/EPce3hjfs3Bj7nHGRw0OZ0u7iUaAJARW9PqFmOISp6
         Ehb2lWUZ+JK3xKUiF9FT5hojswCYoK/P1XKIvIwX1UlqHmGROy4V7F4wp51guWU80fT6
         5iZ74k7vVni43tuChzxqN5OZ3emAewsRtnKB+hft2GZbAqxEKBfaEyXSiQWJ7jWDjv/Q
         FNZ1Ze/RugQQTiZceYuugDBKPgq7QUqf+hhMY/axd93StGRsw80fsRlRBhgjLthBtHrx
         tkBg==
X-Gm-Message-State: AOJu0YzXZEVvEQhjsZFHUH+GTGLLXjylMXN302l1XqeFqVooCPbZPXBy
	+rOT41umA2KivU7pFx6WUmRzc7v7h0nfWxd3lmUHSTUBYOpb53A+tO1r5A6wRXxQ3j+Bvy5/nmy
	efjrKTOQkQNfu2rTeXDab4MfqacAMi+fyBtwiYBnqDDFALIPdE1hSildba4Rqecmxroc7bZ0c8w
	==
X-Gm-Gg: AR+sD10yy+DWJsu8NAB0+o9fn9tY5PjcT2lqhoL8mUzt9bqMF5tQXI0PHdQW5gJ+6be
	XmUxj8NS0UbBVCOWTmP9nlMjwAU7mwZ753X6GVEwaefzsUNkWYuDykrEa73qDAAJ5M42/TQwN+9
	2kfHKTdwxuJSuS+MJCJoTjmDsyiLEXTg+1ZObn9MRbRb/OHOvVNPoPnHoYWs9kxJmUcrXQHHb5M
	7kO057CGvcNDHdJaJKM+Eq0qToT+rhSp7Qd94yzCZ5LVQX6Q9Dp9p3miV3IjBawiU6B2yEfIK9Z
	/3mEcLZ96fZbX0IfT3Knec85Ny0MOUS7XUrHbF+ZmRiqRyuf0R8ZzZbeGRoPSHzoGrFghJmTe6J
	+4iK9z151YRx4z9+e5zmUqwDeHNA1Mw==
X-Received: by 2002:a05:6a00:808f:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-851d383149amr20467235b3a.4.1787225705553;
        Thu, 20 Aug 2026 04:35:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:808f:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-851d383149amr20467124b3a.4.1787225704987;
        Thu, 20 Aug 2026 04:35:04 -0700 (PDT)
Received: from [10.239.133.197] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617efdsm1528743b3a.39.2026.08.20.04.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 04:35:04 -0700 (PDT)
Message-ID: <3f352680-7090-456a-ab08-2d3367641783@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 19:34:57 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] cpufreq: loongson3: Replace per-package mutex with
 per-node
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
 <20260818123921.3600606-4-chenhuacai@loongson.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260818123921.3600606-4-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4NSBTYWx0ZWRfXzQ9kfOk3joB3
 jmp37UJ1G/4MgV0zVdgAsxWhTeQMOIkWk6v+W6S9cyRK7NLebxqlBCAcYdXqbI6/BI6/0wUdpkG
 ks+V4A7dQ6HxvJ6VzQJPu+6u7iZjRlLw5JiT6n+x+PCWGWTJp61oWM7cUE44HvMtocigVv8GBnk
 586yQUYGUTM2zxHnfqiEI3hyJHUoyJczs43zn0pIujWyGrLGtd+uXnJPBIap2ohummBlvJbAlFL
 3ixhC67DR17zXXnlgQBemk8bQSZ8xwQel/Zf88jQM4BEoVQcgzmDufRxjyoY2Ma1154x4cQdeks
 RTf8ssSM2Lk8Ir1TkC6QvC41OzB61YbaK5tpB1QPt8k5K/DsdVRhpupqcysYGlOmt84wEoTDaEy
 GphDwA5Bo8e0P3hp15CmZcpTjHX+eTZXjj6oWR+POhLczw3NhbFjPoo04GlMdmFkztB4qQZOhnL
 VXaMMi+5+wzP+Dfh8ZA==
X-Proofpoint-ORIG-GUID: 2KXXCzWOiQL7nYiZ395Jgxan9gpMYOao
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86e66a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=aB35LMdZ1wvYvMI90LkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4NSBTYWx0ZWRfX4k7G2f1GklIq
 VQPgXQYCKkWu0znm8rCaZ8lzyC+tGWox2YQlSnoWHZ1pHHzMiE1/wwt4xVmtGtjqkgTbW7yv0wR
 fd032ZSg9mPkGTEElw7d6WBMqlD03Eg=
X-Proofpoint-GUID: 2KXXCzWOiQL7nYiZ395Jgxan9gpMYOao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200085

On 8/18/2026 8:39 PM, Huacai Chen wrote:
> Our server productions (e.g. Loongson-3D6000/3E6000) can have multiple
> nodes in one package and SMC mailboxes are also per-node. So replace the
> per-package mutex with per-node one.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/cpufreq/loongson3_cpufreq.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
> index 630f679aa739..e3cd78a5ab18 100644
> --- a/drivers/cpufreq/loongson3_cpufreq.c
> +++ b/drivers/cpufreq/loongson3_cpufreq.c
> @@ -169,7 +169,7 @@ struct loongson3_freq_data {
>   	struct cpufreq_frequency_table table[];
>   };
>   
> -static struct mutex cpufreq_mutex[MAX_PACKAGES];
> +static struct mutex cpufreq_mutex[MAX_NUMNODES];
>   static struct cpufreq_driver loongson3_cpufreq_driver;
>   static DEFINE_PER_CPU(struct loongson3_freq_data *, freq_data);
>   
> @@ -177,14 +177,14 @@ static inline int do_service_request(u32 id, u32 info, u32 cmd, u32 val, u32 ext
>   {
>   	int retries;
>   	unsigned int cpu = raw_smp_processor_id();
> -	unsigned int package = cpu_data[cpu].package;
> +	unsigned int nid = cpu_to_node(cpu);
>   	union smc_message msg, last;
>   
> -	mutex_lock(&cpufreq_mutex[package]);
> +	mutex_lock(&cpufreq_mutex[nid]);
>   
>   	last.value = iocsr_read32(LOONGARCH_IOCSR_SMCMBX);
>   	if (!last.complete) {
> -		mutex_unlock(&cpufreq_mutex[package]);
> +		mutex_unlock(&cpufreq_mutex[nid]);
>   		return -EPERM;
>   	}
>   
> @@ -208,11 +208,11 @@ static inline int do_service_request(u32 id, u32 info, u32 cmd, u32 val, u32 ext
>   	}
>   
>   	if (!msg.complete || msg.cmd != CMD_OK) {
> -		mutex_unlock(&cpufreq_mutex[package]);
> +		mutex_unlock(&cpufreq_mutex[nid]);
>   		return -EPERM;
>   	}
>   
> -	mutex_unlock(&cpufreq_mutex[package]);
> +	mutex_unlock(&cpufreq_mutex[nid]);

An optimization independent of this patch: considering to use
guard(mutex)(xxx.lock)

>   
>   	return msg.val;
>   }
> @@ -337,7 +337,7 @@ static int loongson3_cpufreq_probe(struct platform_device *pdev)
>   {
>   	int i, ret;
>   
> -	for (i = 0; i < MAX_PACKAGES; i++) {
> +	for (i = 0; i < MAX_NUMNODES; i++) {
>   		ret = devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
>   		if (ret)
>   			return ret;


-- 
Thx and BRs,
Zhongqiu Han
