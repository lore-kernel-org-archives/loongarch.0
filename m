Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731493FC5A1
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595789; cv=none; b=JMzkCKnSt0bEhS7xo2VfxK5FhomfQ7c+5bKeeYfuOwLJoRNMGNxZ30WIvQk1l3jJjZgaNlKI76G6NgLKbQwpeM2HkSWmFlA2fjyqP+0qO1t4LI2+xOfek2Z0K4mMLc4Oj2t8thd4tHZ065JYCZOEL/p6gWrOmA+2Esz0VXO6pN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595789; c=relaxed/simple;
	bh=khehXiLJiCSvkVxdEgobbE7CP/Mf6o7o044NnO1eP4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um6Gs+VqBjbH35jkDtrc0/6OpFe8KUZ/NC2QC/5UsHm3HbxBMWcGhWHQq87Cr3LF61w7kDnCmO/zKiJnGfa74NPJaMlfyU+v0b/LXMma5fyAYjqUyoiTx/HVMX/1N0ARG+G8JbUBbDvTyIICHa+FGOFF6ghGVNs2qqdCLhzKlcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6Z+l6cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb5bc4DD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6Z+l6cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb5bc4DD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxS6A1614113
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=; b=i6Z+l6cz0ADxMir5
	PP7gquUEvOGqieG+lf85k6tqb18XN99Vb/XbQueU32Nh4DFYdvrk7j7dFspHsXdS
	Cy7w+CsZ/lI338HKy004q1RoAkSXUYbZGedzGtf6/R1/0ogaog7QiT/r0AH6uhhW
	EGub/EAkoHwsQwiSwXadb/oYPAyoLb8nSMPbvA5/LtqwV8trHzPhgOS4T3OKYTVp
	y5/p6PBjRcCgw7xpwdmKpUFT5d7kIO23k48hxSlZ8uRGHGGnWe45xji+gjzdUnc9
	Wyi3IdVy9kYk4bNta4UN3ybii4hmT7hogdBdgOfzXklVyIt2UwzF5HAMNiWsF/IF
	edCxbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kdmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:16:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso24937506d6.1
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595786; x=1784200586; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=Pb5bc4DDmScVQSF3Us+mPahyEZ7WdT1q74myv6Pm+DqIaEe7qhPLLwt4RcGRNQh+82
         5OaT4r5m7eVbPU0xfqnFpt2zMtKOYlah5LruW/zcT8Qqt17g/nyRsl0nGq2AqMJ9R+tC
         wAHC8dE6114BHrVFON/87+qLtkJWut62BtJh3oxmQ3rEE38qI2DSwktZLEB02jXDEGkr
         YkLsC7Hz5xdZ2NUsgMVcquOqLXyRS5ocryzoittLYcFSlsOT7IJjkHQq++XBUppcTxvV
         PlVGonrJiSJMJWMFa7vDyN0QZc25SOIHJX1edsLKgxP2OHpZlZXzyqirvbbFd/SiB0G8
         xFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595786; x=1784200586;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=a8c8BCtoBckG7pNXddv9/kZoXZyOImq751jqe/nNxCgpItiZhstNxapyiJlJKJxHvH
         TcjNkN1TkRA4SW29Gkk8TFSZCum+mdcIP46gaYWcZOvEfVGpnrRMBXlnQ3TAFI4b8I7R
         pqUDfOaJHdAun6l7AFG4J1cAKU8E6GYky42Mlfw25SwoO/0eXi7joqyYQW1NRZBFth4k
         xaVhW/X7s+3vKWBT2C7vE90817Ou3BMmNT0Z2fZetpPl4NTvMSasTdNBgcTDuW6Cw1AU
         LGJ0wF3W4In9aZXbez6QSEo2ApqTvL9Lfdlwm95B8zBmWdk15wV9rOQ78ZplAoxCHrvS
         V/NA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5lrFlsFE57ePyLplgP8HGMcb6j6PR9ZOVWYuiFkcax7DHrnP1jODNROSZV+62mAOMiOB+6TYFN0E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMW7XYJRiJ+E8NKtLkdeYJzfrvClrFXD2WQaqHtNuPORTcWjJX
	CFtqdmQ9rTth3QPdqsu4Vyy8PkLCJu79JgcjmBO89a9pIv+1yp1GzDo/RXRhC9SSBi+39CqcQqt
	G22bTe3UmCAtAO2+HlXBMqRSnxD/HqCzD6QCj8MniML0vmQfjcIud6dkdnwgPFZY=
X-Gm-Gg: AfdE7cluHrN8HmJw+c4BKkqjgbkMkAniyapIh9YKotofc/o2LGpb8z7a9zo2afQvUad
	7veee6TbYuLnrOfZZfWt9Te4Ou9DZcKrKIM94Omk6zcKHlrPEPXYIZqQcWCdp9Z4Bbq946VdmUP
	BAmHK9GLIEcX+kYBkYpP759PoR1o/jEsCnbaQt2O14/ecrocTp3RLOBeXy0Vxsmr70U4Jo1lnwi
	+NGLOna15942y2+65c7gIY2w8mGeTS7MgtpZEpQwRjTN0z+pTRhOWKyfXjIH+EO7wpXAH3xzpUI
	PKzv0fDFVrOmY2N/eDzRTzlj2Eprlz/c18ffYt6KvcnjrYtkuRmXQ2F47XdrNE0/C7eYQFLVUVb
	bkvCA2zO8iyUqkw7gFnxXDfTNCGoDmCjbYM9e5hmhQAqyTZIKNy0XF1V+9kyX+A==
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72818341cf.28.1783595785872;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72817641cf.28.1783595785396;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm54261424f8f.1.2026.07.09.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:24 -0700 (PDT)
Message-ID: <b45abac8-0e8a-4005-a050-a0d37e1c8e2a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:21 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.918861529@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.918861529@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX50DxuG84W0A8
 YE1tXxHtlAeM6UfzxsvtjEdkUcYcsX5yqib6xEIg+ckQsl8RDWC4ooyZxSOVITHvGko175ook/Y
 tVPjWk4ARhTdRWWpagqInI2CC8A608Q=
X-Proofpoint-GUID: 86RudJQ9mpHa39iZHTWkyAWf0wpgO2aC
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f830a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: 86RudJQ9mpHa39iZHTWkyAWf0wpgO2aC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX5lAOVxnKLBY0
 wh2ZTqPTDXrPbq2B+t9e7+VxTdevV+GYf/mWcjJvFhWJZ1ybina6oRUh6IfJA93UCpgW8kvnHhu
 ui3eguSX+Sin0H3tZ2057RMHyPxPniCcxaPuBgNmmuk/HLLZVgTruxLmG33YTuEA2X+CG+TTgh4
 vJWAWjHbBLnLi+dVo6R5UHWWwRkxE02sHSCAHhhJ/znvT0TGzyA+4vGZXu7xAYtKqu4XochdbIG
 0f2D0hAwdhilkfInZPDTQoLBA9EB77mozU3Xpc2GFJ+Xp+8MqwsOC55tGXiJXGmp/Nn5E5YVSNx
 0vOTboVm376ZQK+INDEJEBT6blYzpeeRK9OZ7dAZYqyEALj3SQcPYw6K9Vh880VIFq9XukrVo5C
 FHEeEBq8vuiQAWStO4ZYAb2I8e5DxPXGlCfYNy1LNaisE4XYag626tlOAUeD3YtmZr4+Ltrs8uD
 BYi4NP6k+kGCwVLXOzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/syscall.c |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

