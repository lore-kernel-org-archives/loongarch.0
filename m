Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210844239E
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229341; cv=none; b=upHa+0Ecn81dlIXUrCmZr5fjHQOHG8c5xY/ZPQ6cvFR4uPyuGEKW1/MnVdBtOngO1bNCpyyXxCOGVpMb8DDNDy9nPFoYKT/ZTo97dTlUyK0xtEXDAqrLFTyxWlDkFshi3ikCHTxqT67sm5Shp2266z2BSNEIQHEcgzMNhnbam8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229341; c=relaxed/simple;
	bh=zLJG/f14PS8IWMmKFHbSudOFvttrq1FN6y5gEITIHpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUA8ve5tX23P/9u/Jsd2I8PXBR6S27/xW84rsBsnvrRwgZEBFfQNDjnaW1By0AkUKUia8AaNXg38raE/c2vP6GOdKMYaOlA1/giG6MblmKS3jnfExqeaLXYTDLobaA1R2CnWOgza8ajlto+Qta0V9SaCLdL/lUvtFnjHnXwxG2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCOjQ2Yz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U322wv/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCOjQ2Yz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U322wv/i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KAOvtD2214728
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvhd0zZOpOWlXPQG6hjDdSgimOp5ylGte8t4ByQ3TVI=; b=WCOjQ2Yz+ctme2+G
	930MCKEQixYauFh2behIj4WORi+WRFrD3VgbG1s99Kr2Pwb/PBdfapRnmaVz7gdm
	ZrL++AdweLK1nyEN26K6779di+4MSP/UI3+YYyXFsKPu4xj5VhFER/AkCmLhYu9L
	UteIYKBg1uaPrldwpi6HNrkkUo0ozmKui9U9NWI5IQj0qr2ja7aIBgt2zkbz+0xJ
	e9wi9+3PRSo8PLHwZtx0+MG9D3OxdHMMU+KmjbMYzwz3/qDNcUnF1g5FxyO7qKhb
	zCCOFv/O5H512wkqgknQuP0eWbVnlPjhmAZrulvz9OUZfLDz7CRs/nMdkkqS3qlS
	3qzz4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc8ebx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:35:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so3863840b3a.1
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787229338; x=1787834138; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvhd0zZOpOWlXPQG6hjDdSgimOp5ylGte8t4ByQ3TVI=;
        b=U322wv/iv/oir0Q0auRPjyQ4AupCRj+SX+72kctrOhHfUreSolOhBUwRhn2fyBnu6j
         U5nEgQZdTg6yUOLOilMH139ekDQjSWjxcqrjfu+PBwu0rdATqEYQ8aJhomonSpuRKyoG
         qyvulLw2XgGf3gXeK/bmhwmEkZU+YcjC3cwauF1IrKleCck75YWZkNm0gYvV8qmqTcQF
         fE1KrQZp8eyJAHMw9KhqZf6gwQnfOPwIIS66xmAX2SWkUDsv7fuRO+smtomKoFqx2/MN
         JNnb7bsBlwX51EVD4tzn2ax2wlU+kB3jCswn5cW3SoySSvC2k5V6KYHT0MClHGynJuVt
         dD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787229338; x=1787834138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvhd0zZOpOWlXPQG6hjDdSgimOp5ylGte8t4ByQ3TVI=;
        b=A7Z1vxpvAJnnUc7Uo7peCHnWjtFgUH9Nq3VdpC27NsnM9lb5T7HNYuT8fj88u1mnNp
         sPNTU7/J/93m8/VAmDRLqN4IpniMS1CkPBlfscjOPClL4gQkY+Uod3oaOIv+2yoKLGAv
         fkYJ4hdTM5c4DPbsmew4NOzh/tOXYhBPVVdRFcmqduaSAP/ZG9I43uhM3URRJrMHbA5W
         UdKi0b2dHtIhagRhLoAlkJmWgxd3NMIB/2qEcwy7CITbaET1oCWkeAi8Bam4QpvAFXvk
         ffvJSex+gAiWEy/dQ7qSvprt8AjEEZiRwip/VD4Ws2SFxRJHSPJJrdWfSliHnm4JWl/D
         ipKA==
X-Gm-Message-State: AOJu0YzwN5Jwi+RlderhFRQlN0GGgl+S7K4h2dNs+M0aWVcLFXMDvbeN
	pRMvDRVx8Djn4Hal+QPGGy9EEFUjSd3PBmfoiNkNUB5W8mNIFNPbnNjvQUzOd06Oy1PIfMZcorF
	aqnMXfcwCQuhDEdzKXLfMZ6hiywM1OMrlohTKUjmundJEb2SM5bTTVx7Uhjj910s=
X-Gm-Gg: AR+sD11CvlWweiNuRn1VWtzLbEAnqyLI6vP/1Da1wgyWkdDC5ychSjMt3d98VPuFs3i
	udE1fZ36kEBWqiffghiJrhJX4+oPmJaIWxceHxIVrRulHqZdh+IxRB+ab+KB+laF7WOQUX3zTM2
	qsDs1HiTipgeELcFRgYX1GhxWN5Fn+Wz9q0xUbWoilrk09HOJJTQI12Icu2jgm1pHgf+drwGQG5
	rG3JHC7Fspcsg4uK/ajUOqYaxRgz8b+A9hCNubSTJgM/dEy0+PsudMUapH2+hJ1/HzGmNoCPrpo
	pSIRZmUTm0ikMuIIczMRVplkgPh+AuJQ0+/6+j3U487AE3cUtGwPAuKIBblZwv1JGF0AtT/7c1O
	V/qk9YTHeVlFGCOh0baN2QYnBrug/ellGDhL8lTdAgOwTVByKYyyIoGTkTlCBoMxCvNKZv5II
X-Received: by 2002:a05:6a00:4c11:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-851d348dd44mr21853621b3a.0.1787229337992;
        Thu, 20 Aug 2026 05:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c11:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-851d348dd44mr21853463b3a.0.1787229337347;
        Thu, 20 Aug 2026 05:35:37 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1556753b7sm1768171a12.16.2026.08.20.05.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 05:35:36 -0700 (PDT)
Message-ID: <49b8a931-f814-45c1-97f4-cbb825dec700@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:35:32 +0800
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
 <3f352680-7090-456a-ab08-2d3367641783@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <3f352680-7090-456a-ab08-2d3367641783@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86f49a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=LayQR5MyJkDDx0UqswYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MyBTYWx0ZWRfX/+2DhDj/EtBC
 NaooahNrDOpCX3PnwApwD5BH3TUd4NaVmZYozbxku9NGW7X9ghO4Z3na8arAqgx2s9Q6JWsIxxO
 hnBHko6viAJegqmwseJt3p5oH9q01adIonPShZfC5/poMvz0Bf6R0xCa5Jy75oJio+q/UYmqjsv
 54oDNUeMaZEO6ZsRm7L28XvoIcNpv9AypECoU2tpE6hTd6x/UgQ4z1X6M+F4210zYafyiN2keYT
 bX/BW7+AWWgSXVCxOerEQ+03kp0zmaUA/UEhH5ZWixqEAmKWlW/fcPdmVijjHxQ04oqX0pqY1aY
 x6HLLUr1CegW96qtYOgnKUFfkA05XPoc9FEx698mFIDjHacYUboxmb168oHXAHrilwVam0dLPGN
 cp9Eblk5A2gis9N0gEvQGhkoerDBbMFHLDqbqLL88Y+/fFeiHgAq04Xrofrcebp1GNB3FrDbVCm
 HerKadhfpZDq4i2ZZxQ==
X-Proofpoint-ORIG-GUID: GfI5SNvUEH0JVZSd1ltkCrDPAiQLCCp9
X-Proofpoint-GUID: GfI5SNvUEH0JVZSd1ltkCrDPAiQLCCp9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MyBTYWx0ZWRfX+A+KCAX9HkzW
 bS6bu7bKM+7rhrazBPZwQyUtRDpgKLng48BoyDIJwYWSJ4HH00jFXu8mqJP+lpgmiAijjbqCTkB
 pMLU14WFgLuSczEodwZl63kOYX65GwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200093

On 8/20/2026 7:34 PM, Zhongqiu Han wrote:
> On 8/18/2026 8:39 PM, Huacai Chen wrote:
>> Our server productions (e.g. Loongson-3D6000/3E6000) can have multiple
>> nodes in one package and SMC mailboxes are also per-node. So replace the
>> per-package mutex with per-node one.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>>   drivers/cpufreq/loongson3_cpufreq.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/ 
>> loongson3_cpufreq.c
>> index 630f679aa739..e3cd78a5ab18 100644
>> --- a/drivers/cpufreq/loongson3_cpufreq.c
>> +++ b/drivers/cpufreq/loongson3_cpufreq.c
>> @@ -169,7 +169,7 @@ struct loongson3_freq_data {
>>       struct cpufreq_frequency_table table[];
>>   };
>> -static struct mutex cpufreq_mutex[MAX_PACKAGES];
>> +static struct mutex cpufreq_mutex[MAX_NUMNODES];
>>   static struct cpufreq_driver loongson3_cpufreq_driver;
>>   static DEFINE_PER_CPU(struct loongson3_freq_data *, freq_data);
>> @@ -177,14 +177,14 @@ static inline int do_service_request(u32 id, u32 
>> info, u32 cmd, u32 val, u32 ext
>>   {
>>       int retries;
>>       unsigned int cpu = raw_smp_processor_id();
>> -    unsigned int package = cpu_data[cpu].package;
>> +    unsigned int nid = cpu_to_node(cpu);

What if NUMA is disabled?

>>       union smc_message msg, last;
>> -    mutex_lock(&cpufreq_mutex[package]);
>> +    mutex_lock(&cpufreq_mutex[nid]);
>>       last.value = iocsr_read32(LOONGARCH_IOCSR_SMCMBX);
>>       if (!last.complete) {
>> -        mutex_unlock(&cpufreq_mutex[package]);
>> +        mutex_unlock(&cpufreq_mutex[nid]);
>>           return -EPERM;
>>       }
>> @@ -208,11 +208,11 @@ static inline int do_service_request(u32 id, u32 
>> info, u32 cmd, u32 val, u32 ext
>>       }
>>       if (!msg.complete || msg.cmd != CMD_OK) {
>> -        mutex_unlock(&cpufreq_mutex[package]);
>> +        mutex_unlock(&cpufreq_mutex[nid]);
>>           return -EPERM;
>>       }
>> -    mutex_unlock(&cpufreq_mutex[package]);
>> +    mutex_unlock(&cpufreq_mutex[nid]);
> 
> An optimization independent of this patch: considering to use
> guard(mutex)(xxx.lock)
> 
>>       return msg.val;
>>   }
>> @@ -337,7 +337,7 @@ static int loongson3_cpufreq_probe(struct 
>> platform_device *pdev)
>>   {
>>       int i, ret;
>> -    for (i = 0; i < MAX_PACKAGES; i++) {
>> +    for (i = 0; i < MAX_NUMNODES; i++) {
>>           ret = devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
>>           if (ret)
>>               return ret;
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
