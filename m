Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBCA471255
	for <loongarch@lists.linux.dev>; Tue,  1 Sep 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249685; cv=none; b=TAhO13ui+GzA8lAA0mnufGNiZvwQc04oK5VmkhjX1/Q5+/r3D27mV9kz9ZEa+iZ2HhqWEQpMJo6uBb7xu9re2vDOVUvHga1PLD+d+Ovn80JXuo5dTFZMn5hwT1MZP37HS3Pfgy+jEYnSJb14qcKc4Obfa/mm7BY2mI/CLGoAFqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249685; c=relaxed/simple;
	bh=M+2oV4T/QFC+qsE8RIB5fpV4NNChtc2m5Fpd4TUP2F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kL70aXFor7J/hnRJ1E8ehT4VjYIyXxrtaab4IpbHxhVIV4kn/xxANYIC7gChkjs8jQ43gAllEw7H0h3N37ox5PO27a//FlvTTnJI28KtcnPILvhMclKNnnIJZU6ZU/WMhXliJh/M1AhGPqoiWq18UfCTwIwvXwRn6JvoMFwS+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGMAljy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANRIyRb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGMAljy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANRIyRb1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178nLf2973799
	for <loongarch@lists.linux.dev>; Tue, 1 Sep 2026 08:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lp12tstqgfKi05BKhpwsu3Up0U+NU0gCKl7bp55AqZ8=; b=kGMAljy7C2zdsObZ
	iLyGfRf+pkVnlSHRJn7BLfLTcOKGRo3tS2iDFDbe3YrSJtSaDaYP1/yQgmgpa2u+
	s+NGN12ckCafS6mEBcEBLMaAsKScq3Ym5tJNkCGAbK28ONnKjmDN+2d0SK7C1zGq
	NKP77QJtjlr//AHh42XeERcA/NRENMwnZp8ARSNAtmTdiu/pSuNB4FTyD7kZaWtj
	YFg7spjNXvk91gCD1WQlgS57ifocanY9FUawwBAeroTVkRhad1IZFUhB/+6KcfXM
	sdjkZ1bnO+uxOisvrybzD2BB/f6m8SRbS1OHrkOLSHBhgfEeEXpHH+vRfp1oUu/n
	A4nKyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0arc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 01 Sep 2026 08:01:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7758799a91.3
        for <loongarch@lists.linux.dev>; Tue, 01 Sep 2026 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249678; x=1788854478; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lp12tstqgfKi05BKhpwsu3Up0U+NU0gCKl7bp55AqZ8=;
        b=ANRIyRb1QQ25cSyA+AkNSpMJC+7zH1cBA/INTvxVrYOEisM/iKU8buVLcZVMJ3bMlF
         cACy7C38p/lnDCit1Vx/EhLdeJ5N1J5EyYK5Shbo7HCP/EChz7rZMX78aj/xfW3bdZcr
         Ce7WS0UB2LLqFxneeIAnoCGLBrTkhpUR0W/BGStNDXkPzKxOHAGDREqrh5iCQaOIi2Q8
         15CheJtlH4f1bW28sYWNkKn2KW+yX6z3EcoRkAWi5uYGbyFV3s0Kydco2lgE4L45CiSd
         xfljFIpqriAeFEqJA9tDOUx25PW0cNFj+T0MVtWy+llKZIrsamaeXEggx4JguNd6LOUI
         YdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249678; x=1788854478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lp12tstqgfKi05BKhpwsu3Up0U+NU0gCKl7bp55AqZ8=;
        b=gF5yrlDXrsMIYE3w0/NwksrdExhEuO9hfBa2mA4N9n0thezeVElABLPbMrrgYjYytn
         sKdauyJapEwbdMeNMjTS2wBjd1dsfbSn63m5R71L+Pouc1YWuNr3wc8O2Bl2dPH7AkXA
         F+LO7PDLV6/rxkJZ5QeHtuvkg4hY37NoItzkxm4mfozhb8SJXjbhL/3AkYYoHD5pfHG5
         gj2evP1fLfcgAL96MPD5sYJuaQidES4K/M8h99aqLLKGUVc6+LtNR3hUTSQyFMyqqUQX
         +uO2jE+A6vO3cbQcOInLrZF+5GR3YAiPP8j0r7szYdWx59WPQ04alkfAQ8aeHQ79aBwY
         RVVQ==
X-Gm-Message-State: AFuF++lZLCfBnxxj0mKakDYJR3y1odIIMDe9bMZMBQoa2Ygydm3zFM2f
	hCFVQXo919uu/8T1Fi4M+38YglttErZCQW3esfgHAK54RhPzdMKqWxEe2y6AUtai8qivPv9K/2d
	cQCdRoVZiSvk07n2wDc5Y4f0z3B0taGhV2OWxCpwFIc0KdLC5eCJGaHtKZIOLGmI=
X-Gm-Gg: AYBFou0QDYoxNha6F2ToDF6JX1aBLrtxrUeCHkfxvWQCwG7YLYwO10iz4NGknN7IH1i
	kqI+QL8D8t8wm/Mc0YkpA4OjyGbfGPaiB2SWIgA5Vfs6OpvOUfobr59cSNHBAEGsPP89AxDRqFB
	egjpITrJG4GYKsk98AZ6hsvb5nJ6ResVr6jIxlqUysLGSGmg0Ji5y2W+6nJD8vkgKVgW0ktpUF4
	goNIpNdt8RBwHpwgEeKjmxrvzumDMEcd74kwQTCozLkr7I+/8UVH9JpkHFK5Ugl54sPJxxXbkxl
	zvKSIA2A7KThTNPnhB1RQEFzMBU6bhZmmC+d/yJy3YydTkVWjClWxCLw7mHaSMA06vnB0jY2JAR
	7duAOIwNSx/psHjLWyyPUPAqic594gXQe/1aL26QFf087eNCS3/MVzxe+hn5XWOZFGG3pFRas
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr49442386a91.14.1788249678118;
        Tue, 01 Sep 2026 01:01:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr49442130a91.14.1788249677126;
        Tue, 01 Sep 2026 01:01:17 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75b540sm4550049a91.10.2026.09.01.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:01:15 -0700 (PDT)
Message-ID: <4db03770-b410-4298-9e32-d497278e9cfa@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:01:11 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/5] cpufreq: loongson3: Fix wrong behaviors on
 multi-node servers
To: Huacai Chen <chenhuacai@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongliang Wang <wanghongliang@loongson.cn>,
        zhongqiu.han@oss.qualcomm.com
References: <20260828031201.1500767-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260828031201.1500767-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX9QZ60REZRFsT
 cYnWFB0gx0WkLQ5bLeIxRUSTCweadK7Qnrps9KtciSs2fKD9NAS2yVbhVF5zvaGYMK/iJ8INK9w
 LS26U08PUcVALjHx9hcbp7KQlWas21RtqYl9c9hNUhSizFGYQB04ztYt8islPr30EZ/CTdhs9ls
 YTLLYMB6OgLmH+9MXHYQHdPU2lG9ZemqvYqQZMWGge7uIEVpT9RndByrzSk6Ot7w5u/uh3mJ64x
 9m3t893JofzgXmDmzgkqztKYnUox0TNBUpbkN2PkUxafCd1rjtPB1VYAr542/lng6M2Y/ToMqmu
 pO799UYIEH479vDEdA8So/3uMIg98/LoX9qGp101sRA9LBT3ME+ygSm6w0ayK+EuFunZYNt/+Rr
 zuOZwDsXmbk6jeP+GuvZKB5FU/IaBzSwoJaRQLe9zAunAIHrFkYO6uMi5XQiRE23pqhDX9AA5i0
 n4QXw865Oyat8fmltvg==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96864f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mbPrJoAuDWtQQzFn8WUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX+M2Bd41hyrs9
 RyySBjTS9bhtIFteUWt+SI3ZMK1wFcOM8H8yI3bBVH6H8ped51h+K82d2XR953qkHPn7z39NcTg
 Wu7ik8wmOc5C/Z0RNGFvevCp3MNM5vo=
X-Proofpoint-ORIG-GUID: LGjp1FWrJdJfU4n5Tr32V_bCdkYMEM_p
X-Proofpoint-GUID: LGjp1FWrJdJfU4n5Tr32V_bCdkYMEM_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010070

On 8/28/2026 11:11 AM, Huacai Chen wrote:
> Our server productions (e.g. Loongson-3D6000/3E6000) can have multiple
> nodes in one package and SMC mailboxes are also per-node. However, the
> current driver has wrong behaviors on multi-node servers, including: id
> field in smc_message is too narrow, mutex is not per-node, IOCSR read/
> write can only perform on the current node, etc. This series fix all the
> above problems.
> 
> V1 -> V2:
> 1. Fix typos and add Fixes tags.
> 2. Fix loongson3_cpufreq_get() return values.
> 3. Use nid_to_addrbase() rather than hard code.
> 4. Guard some code with CONFIG_SMP to avoid build errors.
> 
> Hongliang Wang & Huacai Chen (5):
>    cpufreq: loongson3: Make this drvier depend on MACH_LOONGSON64
>    cpufreq: loongson3: Adjust the width of id and val in smc_message
>    cpufreq: loongson3: Replace per-package mutex with per-node
>    cpufreq: loongson3: Use global physical CPU ID in get/target callbacks
>    cpufreq: loongson3: Replace IOCSR read/write with MMIO ones
> 
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/cpufreq/Kconfig             |  1 +
>   drivers/cpufreq/loongson3_cpufreq.c | 72 ++++++++++++++++++++++++-------------
>   2 files changed, 48 insertions(+), 25 deletions(-)

The whole series looks good to me.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
> 2.27.0
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
