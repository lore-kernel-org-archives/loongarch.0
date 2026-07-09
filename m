Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5543A75B8
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595763; cv=none; b=g+aJEKBI/9fMVPxtcCoGFdspQf7wry/MrmkkVXJeM8/1NGX0hH4YsPThDXWxVzj5AclRVFqYhawfJ8ih3vwzFUbFwfGTtdMC9O8oCC4ZpgQE5aAEBTzwf8NoIrWkYTUFsMIE9LvIEq+A/USEoaTXzBEKNTFBW42ok1QzNrPS2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595763; c=relaxed/simple;
	bh=2OZyqeCMlAjx4K2K+b/k9iOm6BK8Cqfe058LfZSp27I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQEOTOVXPRxu4qkgqavJ3sX3O+TBh4sGeaEigJIDt2x7+d98R3ugQTAAShsZb16dfC/BK/icInKNPaTeQRhAqvGR0DB9GagmihFBvfnpUl53RO9yd8hmNlfdRL2k2oZbSHoHJ+l2Sy4XBHHtic37tIbDxSAQQRcLaaLjWLCa4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULLpdAqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAhOge0K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULLpdAqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAhOge0K"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxCAo1521422
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=; b=ULLpdAqjhcPbhl+a
	9wkFVF2/lY0nTNUibaezE3oRQ6lteQ4HDVcOfqHDE7vtflCsPuubuaBt22suHv5C
	J/GboNexxusvk46SeLD4YSCgJibhGpTyBp7Ew2CmZmE5Kc85FL5xmUGbwX2SNRRm
	AUKTk+C5LBwuGwFJB3/1RH6SX3HPCEtPeI30OoMKGubID5ux/F8g5HbF1COPW79s
	OzhxWi76MMCFcorNKYBBg01ItlLF46P4rAQRFOMzzGhz1/Bz8zCwIh87EUtM9Vze
	DADpxILacbIASbBx5FZNfW6HGEmYrVnOynweeKBYk1Yd0I8v8nqfQQ/58XsDZx94
	8Wm00w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwbvxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:15:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1852a86fso11474341cf.0
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595759; x=1784200559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=jAhOge0KJhljuY1edFAaawslys9dPjixyuejhntQNAlbKlYrbm4Foniekl5KqsjFqG
         ym3qStcHHtr8DqhBcFousJid7z9P0SPgMXZhI5ZZ9QD3nhpGHwUhDbTpLE+Sf5kIeiR7
         W4K8bnsWjba/mteA1MhkAb6SkVDaeAKhmjbigytPGj6s+DeT3CyHTwv86W4iJ397RDOC
         5hTYPVomOsZv3ynbRuhsokUHDNLbQ4XkuaMlWVPBmUytgC4+VY+9GL5IxRgmbW9p9P0P
         +u5LODe31Wci3T6KT+y9L0zY9oKILD85WQwADE+epg8gerYXnW7vx1h8G9gKxbWycXVM
         s4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595759; x=1784200559;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=qFJPPArtDFvC8LhL5LFlL+ydAmzyJsCtkHbqr3MSdS6F2yDE79ZxmaFILa6wH1YrF7
         Pn+tKux5FoUUC0Y5UCDXN5yFNDtW1x58iodvKxPVJIBeJHyHens5hkTAZ5scTqrRW7BQ
         CxKh1TcqmyJApbPamy9intAy+jHsasYEeFdK6xPI6KJ3DVoeRzNZpYB/ruFHMfpCSFJ4
         WnHk6NSOr+WABvdvjgn2hmgLy68kndpxcE6UEKs7lbFC8nbZTTg243aPzixdSJDsS6pJ
         V+RQbXHbmGbH1crQJaPSAH8PwCjT+ouHikMofBLGqxng+0suE/aLWvCKr05TVRrgsz73
         PkRg==
X-Forwarded-Encrypted: i=1; AHgh+RrhVlukcmdIzxT/gjfmARKm8bm5Gqf9cDbhrpEie8zoo2h4wrXLJXZ5Qr1E+Vf8GTS1cnGzjFkHi+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfJSMGFtcGeT17aNmOiJcPgDNEDtAu/VyURWVfHzUfh203sQDJ
	CMEaT5d8VLwkzRTBcFivGbP7Xf3+DMctt10mQoygQKF8gTcKK/X6sHc2mw0mDW/FlPE6yAcGqeu
	GX9nCO3hdeJH860bJNMplqSFm4ffEDNJP/TsbePOT81B6VPkNoAP4gaG2HUn5cnA=
X-Gm-Gg: AfdE7cmyRqfOTFnJQNOpkf+8Cvnwn+vBawfz8nkxY4RhVFamOQNUpADiKkcwex/gQsE
	ydNkXyAjWgRAcCb/HNtsnemhXNMMCcvLm5RcEF/tcCvqkxPuaQ+q5UJLYQuSySFUNtUhLppfrMu
	FLr3n3UA/kiu/+br9ietbEwP7iJIj5KaVi2sL4d73fE7JeNYT/4IKhAVI2AsSkEyKs/ggR/KEYz
	yZG30JHzXNP/hKqRs9787U7n3SF8nXMrRI+L+2EDZb11Kss7+Ef3MkRi6XFbT8EP5lmZnnhI68j
	7z3ucrkboJgFHeHa6aoU1tfOV89cxnjKm7fS3UcD7A+clUuBiAYm0xUPLXNDuJCNPm4QeY5d5s5
	iy7o9d3Eq4N3TZ8q1+X+xJ7y60AYJO7LV9jceUVh3gm2bVJ6TvS9hvFkZe2X2eg==
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191481cf.28.1783595759084;
        Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191231cf.28.1783595758685;
        Thu, 09 Jul 2026 04:15:58 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm50274140f8f.24.2026.07.09.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:15:57 -0700 (PDT)
Message-ID: <cf26fe68-5a8d-4d6e-b9f9-d69faa8a6012@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:15:55 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>,
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
 <20260707190253.865955911@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.865955911@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX8y6THWaN8uGs
 USakUakKdq6U4vAybrduktv6PDqpX5b2uAcGsAAIBJxSMsKJ0WHy12Ef/I0jgTDLz57tuipHSni
 AAawKxJ3WDNs1QfWDGATeMBHeGXfm681ebJRQ0Y1g+UCpLLDUAOQy0wS7qgBltYmtsYhkIlq2eY
 DrZGm0vvXVog5Wjs4geq5H2MP43WLsQwq+04aw66MPdVOPdwaTmDVe/Vcat66f1f3ZtEvlQeAYl
 wNlaSOOp/4xAiYoiOYNx5yVdJKCsGOJlqtiKSxw+EYgKOoIVoaBG0q09tcXt2Kn5hMjSQuwFD+P
 BJQODKyNWamLgka44CA0r4IZwa6i9JtE3DnJI3JXkAZVqZ6Df/1pWpPER5ne3BxYERBFgM+3o1e
 y8p92AzTOhasX/Zx47jJuna9Iki2KZQe4Bzqx4F8NvBLHixaS2VSBHwNC89Bo/LJDm39/sUftHv
 9b/qy/iYU/huNmgtD8w==
X-Proofpoint-GUID: D2IaOh6QfIqYGjutCtRvwTlr4yaaMD-O
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f82ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: D2IaOh6QfIqYGjutCtRvwTlr4yaaMD-O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2jkhkcUsYWwL
 fl0WqZOrdeg4GCs1a3lQJhvNqNsDIvGnreqW5LvvfNZu4tlTpyYQ7kn5eSvwSD0gdNmibRDxFHc
 8hhrOWxKHOX+zYXjWsPTK3qdaKcuVhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108

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
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: loongarch@lists.linux.dev
> ---
>   arch/loongarch/kernel/syscall.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

