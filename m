Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330A3DD866
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217804; cv=none; b=GKfD9JiMnYAoPjnGQ2NUDw6b509jPznIUXNB4sGBCxm1af1UCjqz0H3V9T7832lU8gOLoiACkCO9CTCFL2rLwo/dDpfKpOauNW4zOZS3wuu3IXO5sPbo+xXu2QhNRRvuAX6scSlJ3c9tak507+nYmNGOoFp1sbo0qGGEvuxh00Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217804; c=relaxed/simple;
	bh=eWXjDm/rNRBZghDqHn6cqTEJsRLefjaNGwagAb1uQXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPbz5BU1EEvMySEUSW0v1prcP4qZnQjD3SXSRGGRM7tI0BF9w09gICokPRKcX08J5Xq4CWY8w/pv1MCsMmtohv66fQRIbghCdLMvv8KkUYyGa6vJuraK8vG95eMZQ34XODzGa8KkaYYA9VAaI+JMW5aFBAaEIXO6pc1cgnQNkN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTQq2QvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkX9/nle; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTQq2QvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkX9/nle"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jeYA2529520
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 09:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+pxcnC7LlOtfUPE7WuTxX2VzzLJtGCT7IRYPoYVTdU=; b=jTQq2QvMSp0y/uZN
	xox1lfpNY6g4oK03nKR3XiaprcFddensAQirhiFcrHptE6B59srTccg81Ye0Kkec
	7UAemEp+19KkAnoWW6EAu/kewplyAfz7UHdb6m8IMnlVoOSVXUKaqBICyDwbdRWz
	1aIdWiBU1syOy8qIo4Y6lnfddKhhJKnicaxMDJhkORoX7c0OgPVLMfWtpDScbWBW
	uIqllcZRvDbzqIh6UQvdzPaepsmziToG77R7CPxQWf7KoqG++h02gGValP+yT9vZ
	1RPdfumxjSTtqHwvjj6FTqady8l+08Bq+gFceuYigW+81EpA3ytx6xHBe4rmEteQ
	Zw1iUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv84du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 09:23:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso2412349b3a.0
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787217800; x=1787822600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+pxcnC7LlOtfUPE7WuTxX2VzzLJtGCT7IRYPoYVTdU=;
        b=YkX9/nleIWwKngg73dRMjv1NmRokJunqZYPbH7dvW6svR5gPVyWWJSijRHIbi0lsiB
         yoBKVpJttuPZ2m//CI1nANiL8rSX4gX8QhjVZq3ZRYXgV7qZ8w7CDllMmG0NRHJsxMQw
         l87v8G5blE2QO7qf7+h+Bz90ebZn/vbLVnE0IBAAvCfFYI2yFp+UkFC/+qK+T4g4Pg3x
         4bdZ9e3wVc+54TagqwDtk1Qy/fPWaQzDLpiwEFg5ADuIJb/G9g4v4Gcb4ODemdrKNQsZ
         ko7kQGqhm3K1+6NymRT9TZOboOQJA/Mq/DSvJHLrpzcWPBEimL4wvLASmu0qa+sxNStH
         pOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217800; x=1787822600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+pxcnC7LlOtfUPE7WuTxX2VzzLJtGCT7IRYPoYVTdU=;
        b=o+m8EZBdAySn+FwE+Y3OGK+B6RT7Vcxn26YMwJqrYCqPuSrOLOXBZNnZv76XYKLZrM
         SLzz9YDhTXQ2TxEvYXzEoQa51in3nzTYC7IK5SQVBgMMxa5HG7Vz9OcvU9sS0uFKgTdW
         mrcrg5zycu4b7pofBbZqn6ODrx/pGXiOHzutrDm6oXcK1jcdUniEmfKN8RqFrxPjxgmh
         dWY1C2aMe8uSxJKteiw8jIGrJevCtzRhg6/Rn15gG8GhsgZ2Rd23JhE+OUNBOJCQ3cuf
         qPomT44WWtPuTZNcJF52H1Olnj1mpsFZm48f9f8x8NAaUIO3pip3UNGpR26oyLS84+Na
         pyHg==
X-Gm-Message-State: AOJu0YyokHOKI4AZ2SqfOxWmiARuRDxPfpiaygg2rRYov4eTR9y38zUR
	bMnhdz3xJw3bQ54MsK7sKMnZjjv+m3UpBuN4+gx2oVPwOpHhfYKKhIyp1VX9HXm6w/Y/J4DuDZO
	aw+TFGS8TITkGvRnqQjML2YS8JuqcSlK18KUh3x7AA9gehiVklQVueIy1jY+5cOU=
X-Gm-Gg: AR+sD11dj8uSDhVgmq2c3uKPao8GZGDlTHHqlTS4qR/snMPQAbkF2SeuW0H532fPACY
	UC1O1uk4qSj16oYHBmyMzgxuY06Iq9TqJNMtKoMA3gDqh4CkTZrNA6zFAANdIpWB7JrEs+1re/Q
	zOypDZLd+B3InCiKC4rY+V9v/AmBCqVI6oPKw7XtSntso2bflb4gZMeMv4Q+XnRWMAl45fqJqCG
	3dkyo99yhGo6eeZfMWaBxvlVzhPV1RPcXdNirzJRl/DNooEH/GmW3nOCilv6mpdSP7irVKosRR3
	gEtWoZLBCl0bFZ8Cpjw2A4Q5KhvFNcK81zInjX/cHGR4WkxVLVNrgUWeo0a97GNe+acM/47Zci/
	PUbQFCHygsArJC4JFwaGp4FppuBLLYRvzG2RRMz8Y1ciLuqm9+oGX6oBZA4WUHcHAWkoI9WYD
X-Received: by 2002:a05:6a21:48c:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3cd0126b6cfmr21929949637.17.1787217800535;
        Thu, 20 Aug 2026 02:23:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:48c:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3cd0126b6cfmr21929856637.17.1787217800100;
        Thu, 20 Aug 2026 02:23:20 -0700 (PDT)
Received: from [10.133.33.222] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15523b579sm1611537a12.3.2026.08.20.02.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:23:19 -0700 (PDT)
Message-ID: <0b8371b8-408c-48a3-a41f-2e2f1079d315@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 17:23:14 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] cpufreq: loongson3: Make this drvier depend on
 MACH_LOONGSON64
To: Huacai Chen <chenhuacai@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260818123921.3600606-1-chenhuacai@loongson.cn>
 <20260818123921.3600606-2-chenhuacai@loongson.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260818123921.3600606-2-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86c789 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=FBMUh9G_Qb7lsv0hvtoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2OCBTYWx0ZWRfXzgg+PzVFZBd1
 sj0hC85REpcDAJ2c70EXSuSkGGrRIuH+8w/XBVsGxCdV32k0CPR8vp26ZiKqnu2ynfTzTzAr7S0
 hxUuV98lZJd4D9LyAmhuVtNrON+07zvga/Inwq3FCZaTTwebWdgdh78COcYUDM3+oWPn26jMzbL
 X/vv+MyiXcBSrLjBplO8t6xt2kJGPrnXOnXDOzx1b7U7PZijpw7HjQGDswcx6Bp1/h9frF/7M2i
 N15ZiygxCJLSl9A9QrSvlobUWFN3KzBTqUoYuu2M8tXbQKNgxRhBzZeSWBQRHLJEc7iwDAasv6K
 0V7R+2OOdBpSzcT5B4ulKDl2BGu0rkf3F+qVoD99HN1brrzvovSzjrzDo6zfymij/xCJkdfVHwJ
 6aVssMnbNoraxvDbo05L6eFvWQ3u2zh4MuZ8N1zbtAivWeTS4i10pjEo70Fl+R6yWlhtSHKwzb0
 2iukW1XuwjHPXxqwNvQ==
X-Proofpoint-GUID: Z4khu2AmHMJdWKE5qshtz96AADMxtTgN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2OCBTYWx0ZWRfXzMpbeq/+o0BF
 aU6vH8PN5f8dR8sVaKXsTz03ZU1YWwoMeqYIdB6TqoHKwaU6gqHJ3CPlbIJF77uqjpRj7LOcTHF
 x85wj2WpaBMcNT2mcOnnpTkvuWb7IKQ=
X-Proofpoint-ORIG-GUID: Z4khu2AmHMJdWKE5qshtz96AADMxtTgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200068

Hello Huacai,
Just share a few inline comments/questions below:

On 8/18/2026 8:39 PM, Huacai Chen wrote:
> 32BIT Loongson machines don't have SMC and FreqCtrl registers, so make
> this drvier depend on MACH_LOONGSON64.

Typo --> driver? Likewise the subject.

> 
> Cc: stable@vger.kernel.org

Nit, it is better to add fixes tag?  For example:

ccf51454145b ("cpufreq: Add Loongson-3 CPUFreq driver support")

> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/cpufreq/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index db83f3365698..edc1299098d4 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -288,6 +288,7 @@ endif
>   if LOONGARCH
>   config LOONGSON3_CPUFREQ
>   	tristate "Loongson3 CPUFreq Driver"
> +	depends on MACH_LOONGSON64

Small nit:

Please feel free to correct me.

There are two MACH_LOONGSON64 symbols in the tree:
   arch/loongarch/Kconfig: config MACH_LOONGSON64
                                  def_bool 64BIT

   arch/mips/Kconfig:      config MACH_LOONGSON64
                                  bool "Loongson 64-bit family of
                                  machines"
                                  select ...

The one that actually applies here is the LoongArch one, i.e. this is
really just "depends on 64BIT".  Since drivers/cpufreq/Kconfig is a
shared file that also contains an "if MIPS" block, please at least
is it better to mention it in the changelog which MACH_LOONGSON64 is
using, because the LoongArch one has no prompt and is therefore
invisible in menuconfig. Or just write "depends on 64BIT"?


>   	help
>   	  This option adds a CPUFreq driver for Loongson processors which
>   	  support software configurable cpu frequency.


-- 
Thx and BRs,
Zhongqiu Han
