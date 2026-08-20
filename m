Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205823C197A
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220230; cv=none; b=RwNgXLV7jPCypxLg7Bkvhbv/SfpysXuOq+M01/TN8IOYqYDfVFYEVwZsuj1X7SoHa4bQpROii62rASHDp5pypRVa9Y3qKhAC69rx6IDIZUp3hX6fVfwSjmnho8yG+/QZ1U1+Qzu9PBKtySJq+WoV5L/igQOqhGVRemb0/A8D7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220230; c=relaxed/simple;
	bh=eXffEAGKjk5hZBWJl6zMi/+attHYcgNZsIbemDFtAZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szubeeV+AgyeydlAD6G9IDMLLzrCh9Op2zDsZK9M/jrEwnCrt/0PehJxvcILgcZZQAjaIP99gHOdnyaiLguTI++fTKuE/i06riFZ6QxVRSDuXBaZ0GXPjYhFQor2Q/hFIHj0HP+frzh4SPJOC8UpR69Zaxuan10QHy6+N2FHKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrUWv8E1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSDgsu8E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrUWv8E1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSDgsu8E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PCNF2465359
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 10:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPSkuOEchbemDS4U9crqf2tId0yJsRdyzuUVxXq7JPk=; b=GrUWv8E1JzQPRNt2
	g+UHy/wFYB6/Emh1fS4On/siAWE2XU8nd8XmNCtn4F3S3G7N+Vj7e8uaiqiQzumf
	Uw48HTxrOFwMdzq9UmulYBxsNgHga1Z1NvveN2GmDqO1Q2ySo9XlD9lPV1HNoKGW
	rricXfDqlvNeXCJr9qeYJKOrjN50RBiSN6NzRzMQOcSV59z/Q353HeJspIA82D9D
	kvtUZvk2YScboJZk20pXxMMu6LaswLpvxJtrWPvpbJu0rzhZ+hTTvezMqKdGYXjR
	nQTjUdVEj4K5SrFWEo+DtsN1G6hzuaCF+8Xe17pzLn2QZIN7HkelcmZtacFb1y1R
	wZj4xw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gcmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 10:03:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-851d6af9d75so1489550b3a.3
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220228; x=1787825028; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPSkuOEchbemDS4U9crqf2tId0yJsRdyzuUVxXq7JPk=;
        b=WSDgsu8EH3mxniD1ALlsWIvFfUFFGrp+8dbE43iKZC1hxRdjY3kbbaKexleEcMzjSr
         9DYAkNDZJOhT1HNRYkMzzxsVq5ynGGfOK4/wHd84irSKXrFdFhnvX7inKqaNks5erFV0
         yEcz6fM/nFH6NQO0AoUVP/Ic9rVsIn2cwyF1ASHKrCAYjjkb7BMy42Pwj/ka2Pm2aUrx
         QHjUPk7bpVRtt+LphO055gGcap7HmEw4J7arOH0O8lEhATb30Ih8s2ANDgm0B1s79rfH
         ih6elSQKoqzJTOOEkzLxemDcQi5ZkK84B9Em4u9z6+6+VZpUGbj7eleoEKxoSmZalTA9
         EzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220228; x=1787825028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPSkuOEchbemDS4U9crqf2tId0yJsRdyzuUVxXq7JPk=;
        b=I6H2/KpWe2mvFK5NThzyN6eEseKw69bI51vhhkClv7mgorkWbGS3LxgIUKc4GYkSQJ
         ICr3rdheCA1kijOvXnGrvx9zyepPYmAxOpERkjxOn5nAb/lOj9H0KyooL7mYZOtT5mMk
         TbHlZjVrS5EMs5CV0OhmCchL2nmZM7gK1edkzMmmjgGjrNAIPnLc+v4RHZSqliuwQsxh
         nSKKyfYhiJBG/TPKMZlYrGwGvNJjNWva1ZdcW8r84ajKivuuNiM9loBNtUodeed55KYN
         hqpL2Y3C6TYD9Clr8c3Oe17eEdiDpeQTF+WwbP77xGYSR8chEHVjfc+ZjMiaiAOJctxp
         pS9A==
X-Gm-Message-State: AOJu0YzAv8lDHpV3h3nthYYcQpdnsXIlE1FugtnI29HAPMM2tJQdeGCt
	OIvHvNAMpzW9wSFFu6S6+ayaUDvlsCFhRYMp3nISnDxRoQUG3AApcVmXU48YvtXvg2Bn3LsIcPD
	UMoTmHcq7vlJu8XMq1Q93BQi3WP3LTnT6SRzTOH6hhx/AALebiu0bkp+hRlVLVMc=
X-Gm-Gg: AR+sD12h9+0Ss5EPXDCnUnJwVN8+FQoPUJXHsBV2sn+2MSQ1B9Ikr6jWlU44yLVkfkg
	xfrBKRXWzHgzOOIF5ULDoXarC4s/+/RMmsOp75BHJuVViEGCs62To4lJxJw6BXfkzh4zsI3N88f
	jHYKqEoGwmBXN/x06PoGhTPS+HBWnAMVAPHCEBlgi4svjtBSTKt75IGUBBkzPSNbdcAdM+PDtGr
	oC5Rgn7UczssPU52r+5Qabw2T+ZLkW9kNMSUbMsOheuyZJkLz4N+PDi2y5d/dsFdUHLNLf2xNWy
	dfIdFRrJGCiw2597SSmHnoTluaAAe0vr4F059F1kRFQJKKwenMD6yiqk4+h52dpo5sNwoUrpdqN
	1U3hv599mxs9zn8qQTxLT6mLB1KOlI1owVx8FvH8kIvlorTxycdJbYEW/59in9Rpg2Ys3Z/8B
X-Received: by 2002:aa7:88c8:0:b0:847:9015:e68c with SMTP id d2e1a72fcca58-851d3953ac9mr17929924b3a.17.1787220227593;
        Thu, 20 Aug 2026 03:03:47 -0700 (PDT)
X-Received: by 2002:aa7:88c8:0:b0:847:9015:e68c with SMTP id d2e1a72fcca58-851d3953ac9mr17929843b3a.17.1787220227125;
        Thu, 20 Aug 2026 03:03:47 -0700 (PDT)
Received: from [10.133.33.222] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33627ddsm1488181b3a.10.2026.08.20.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:03:46 -0700 (PDT)
Message-ID: <e07d3a93-390f-405e-85ec-21e5ad9a6738@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:03:41 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cpufreq: loongson3: Adjust the width of id and val in
 smc_message
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
 <20260818123921.3600606-3-chenhuacai@loongson.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260818123921.3600606-3-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Rju1FlnJl8iIaSDCAVjRGk2XfPtxXvrY
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d104 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=2sVyCrUYgtLBleu_eicA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXxfL8NhpvJLAm
 XDuUQKPtGnLcxXsUvOM/GG2jKWZW/gKX3awC9l7PAbiUsnDodWJHzv7ApibH8q7W5shCnjrMSv4
 bagoTRKkys8YWI87gmEFGdz6W187xZRQCYvFQvuEclK4l/32NzKAEti9ZV79g49Lyj4kHUyjt7z
 yuXB6Loa4unv3dQjaoyrD9TCYmgK8dRaWfLIa+iF1cWammFCnvgdpMAK0H0JlwIqH79J82dR3+A
 hc5AN72lPBUd1fQSQ2GtioQzyOumKpcUSidnpYsT6P2/c2BluuRHU9VJ/d0XpO8BajkkaoPzfBB
 MJbpVphA6tSVCtiZ1vvroSRnhCJ9CPie/mw9qNi5eu488zB0WBxmBotuXtURGys0TkHuLrVLxG3
 Ut5vEyFKj9oKOsQFjZZqsxsMV42yoFTUEX6sLCf42vxe0zPcbcI8Vn3TealzK5N0vj7Kg94npNs
 QxcapHljNZk//+DU0Vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXwARGUGNLJ2yN
 5VONO3RbBwa3pjyYyTN4K0aBuPkLne1ofLgjQpq7/m4/eepVSqNsC76a9w5gtp3ANf2KkNRH2ta
 7a408nr1AZOOEiqiFaaPvU3COs9YB00=
X-Proofpoint-GUID: Rju1FlnJl8iIaSDCAVjRGk2XfPtxXvrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Hi Huacai,

Please feel free to comment on the question below, or simply ignore it
if you do not think it is worth addressing from an architectural
perspective.

On 8/18/2026 8:39 PM, Huacai Chen wrote:
> The id field of smc_message is usually stand for the CPU ID. In the past
> this driver was only tested for desktop and laptop productions so 4-bits
> are enough. But now we have servers that can have as many as 256 cores,
> so we need 8-bits CPU ID.
> 
> On the other hand, the val field is usually stand for CPU frequency so
> 12-bits are enough to represent 4GHz, and for higher frequencies there
> is an extra bit to extend (enough for 8GHz).

The extra bit appears to be unused in the current implementation.
Perhaps it would be better to enforce the limit explicitly for id and
val bits, for example by using FIELD_MAX().

> 
> In theory, this is a incompatible change, but fortunately the old SMC
> firmwares are not widely shipped and can be updated on the air, thus we
> can safely adjust the widths.

Not sure if using CMD_GET_VERSION check can avoid such incompatible
issue?

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/cpufreq/loongson3_cpufreq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
> index 1e8715ea1b77..630f679aa739 100644
> --- a/drivers/cpufreq/loongson3_cpufreq.c
> +++ b/drivers/cpufreq/loongson3_cpufreq.c
> @@ -21,9 +21,9 @@
>   union smc_message {
>   	u32 value;
>   	struct {
> -		u32 id		: 4;
> +		u32 id		: 8;
>   		u32 info	: 4;
> -		u32 val		: 16;
> +		u32 val		: 12;
>   		u32 cmd		: 6;
>   		u32 extra	: 1;
>   		u32 complete	: 1;


-- 
Thx and BRs,
Zhongqiu Han
