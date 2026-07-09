Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368F410D36
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595586; cv=none; b=qffaH7V7RAhAAB0NqZ1rcrYGjxlq6KknsWSVjcrWxe/MzxeKRks9yIw2JXhEfs7HuZwdU+dh8AdOYS9KfVW/UJ/hEXniAvuJqyJbepW08iB1CliKh6C3QJ2d0UkVpE1QhHei2Et1dEvwSwxdsEQz4iKibh2G9mGup4FZU1v4CuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595586; c=relaxed/simple;
	bh=HqXh4BfYQkZLyAofgdtRXqw9mAcQUWbFiU48fKsf49U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKUpVwoPZPkGCz6DpaggYpnE8hIIS2QsHleWs7Z3liUbB0Dlg1R+4bDHhBv8BbnJXZsexo+tnSdN35rTqnZJfD9wpu7zKvv9nVtTgApAAjmZNcqyTMEhqCHOWBIqy4ApZjkPpmcbx09SkSCUAaB5cKeGrC5veQR139P6BSVvenc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqvWJK8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWxH7yHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqvWJK8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWxH7yHW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxhwG1614734
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=; b=jqvWJK8PLEi8s+Po
	PkAhOcF1EZ0TGn8umnL5kgryJ/tFquXm2xFzKz63mEvAAckXJG2v/bBhmyd/J+vv
	w606gHPQkOOhu8auM9bbQnd68PLYN5DhMVRn/TQO3SYM9ZXEOEAB8F2FTaHvyyzL
	/gj6GXZOaZ7Kqn5MccKMlGU9Y/8NaD7WUS1XOInbClq4x0wSv71WFJfHopsmfL88
	joRiOO1NBxKuiVXV4p/tSPunQ9pAf4nwUwhwVoGhXqa2d3YUXy3NiFuuL84Sr5z0
	sFBM3VIfsHX5R32LvKrkWCid7sj7it6qPECFAQp6EaOHyXV68SwSVXRcZbVTi1ag
	vIF6OQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kd4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:13:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8c689b5fso13213241cf.0
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595583; x=1784200383; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=BWxH7yHWskBsS1QsnqXo6uzoh+gUR5Pdgun8bVpkQ/URS2e4vtYX5XpndT6e1mjoQs
         3utvfrjdHcMvd9oxyGvwE2IapzgjZUNADN8OYZJbUABA6DK75AQ6g0lKEkhXjt8Wl80w
         oeJ5eCafCx00zBt+aTCtlqAqnt28nubfK0fpMDcHXgF1qqyLxL8nDt1suKUS9eOcMPuj
         cX84qPlo3cqw5YWLKlHfDyoVKrg5kXL+BNUDeJ+agUCMN5U1QWWt8cJEpCjY9wfo375I
         NpN2D+ilxvQ7K+KWRbWpnuYVOFkWRLzQiky0iWBFWqtu2uhyGQO6vsAoIpneUTzhkZHb
         vxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595583; x=1784200383;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=EszMgfRbNj1G4ZkVcIhTO+g2ACwVguZx6xINU+/JS1xsI1fCsAzIKqmJRzRRiFDp2y
         dZh0rk57Up4cPp5ucYo3cgrCPWQBllKCMmTkgT26OmK22mn/anB1UTGlP+qnyl+Lgbw5
         E0sJslWE/5C6wqxlpKxdPNpXvYcw+Lvw3y1c0JA6e+BYb6vmejayJIwae0DFGrUh64Kt
         OrbW3c8sAIgcFtZbMePwbmq1DLgKm+g86FFnFl2hbbYY8tV3wZJKX+5TuxqguPS8Ss90
         BNl4zAy4KiHbB6dFh6D4sARdfKtLPCHZRBCFXJI2KQuFH3YB8qIkcloffm07w0DABzbG
         ZYhg==
X-Forwarded-Encrypted: i=1; AHgh+RplL6j5fAJHxB4hLEMaucd6BZR5VK8BFwvoEm8b4ULw8nhGKSMpRlxZPHmrzkGd/rnlv7ugsKHizfI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCnDJx6Xi6sn/Bfa0NvIVI33lccbupgWyGiY33jkHFyKXASY9A
	TDEHQWfacQ4cEP0ZbwsBNaYH0UpPeX2jJfxn9/A3t98RcL4/FKm7Sv5PxwBD5DzKdV5uzbVYqM7
	OzVB7Ge791k5SYFhvs2dqo3D0RpJoSMtSNN7dTXlWJCUuBZVBVXFV7JmWiiFh/+s=
X-Gm-Gg: AfdE7ckAll/jj9HT00dU8NhccQBZ9KrwJHsVlXRT2IQFqgHrjLP16yB6JJrjtBMDz7G
	vorxrpRDos+8X2PtnxDtRwHLWBR3KeYD+QnXVy/9M+aR9QfSrHCudU0U9loT+ZvTT1QHp/qplyb
	JsZiYHf5vlG1D64BuL/Rut+l5rmpkQIZEC0lWB+S0NTSR4/LMd3H4q3PirfF5Q3uQTGE1j4FRC/
	9W8NdcTI3x2GADY5FWssuevGGEM6pWOsTDeJdPv/JclNzfi20h8HbGo/MkYnn8IsSZxjhpb/mpT
	lDCLjhzAeiJKvv3RTngibsyZ2zxLBKZ63uzok4GC+06kzO23iqnoM6a3P7cGuFsI09Cunh7xLPh
	lD1mDQTS9DprgtLDA9WVUUf+whoXFjM44tcAO2AIUo3psLpgJp6yUF9bOmY156g==
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63974441cf.56.1783595582881;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63973951cf.56.1783595582395;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm48543085f8f.34.2026.07.09.04.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:13:01 -0700 (PDT)
Message-ID: <835e2f62-3b66-45d4-a614-dc2198a715ad@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:12:57 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
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
 <20260707190253.718191130@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.718191130@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXyUjBFtAjCI4W
 +WN40QHmTghcLn5zTm5+qBN9hTJ6yHRvf6A8eV9eZn73DNKxV4tlY3pZLouOhTDhk/FonEj74QI
 FYkeGBWKGaQ8aj9LMtQwSfyt2QwUwYc=
X-Proofpoint-GUID: nfQkBd9VzD9wub5wuRp2yf-nQhKA1YIK
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f823f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=63ny2n9c4_t8xnV3ltYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: nfQkBd9VzD9wub5wuRp2yf-nQhKA1YIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX5fFrJNt7TzfD
 +wRHZWm/Ca4J8kAx6B+UeCOwclHAui7wGDY76/DwTk67YrzlUVL0neRxnaBVmj7SJsRopgKqGpj
 g24Oi/k9NDvtlt3Zr08Y6Ud0Ws7E068eIFtMKvwTlJ8F8/E04xHW6QOgts93fPPvxXkEHLpxujj
 3bUsuky0hwyjhALXYajOMQpbbPVeJHgeIENfeGuNI410klTGKKnpL4rZLSFsJVcrzjE4sOqQYIo
 kg2PPKLRUz6XGYQvO3Ia6OXcTVhApcboBq35n8W2Cl9ZfN0kY1iXpXwKoBaYNIAptYNCsGO3BaH
 W4UTxXRItOst7CndEaDcOkobtBdpudGK0z9UXwmaFmoCfXC1QRjJtEh0EL9XRvbcslZQQq3Gl9t
 PNVw6qsNlcUR3jQu/0ndHnuLwTOVFPE4E7pL5RgRpZYcPpjaxqu3oUy82e43tFm9+9+r2XqSO4A
 GLsJjo2ru+KtZmKhTYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 7/7/26 21:05, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
> 
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/syscall.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -19,8 +19,8 @@ notrace long system_call_exception(struc
>   	long ret;
>   	syscall_fn f;
>   
> -	add_random_kstack_offset();
>   	r0 = syscall_enter_from_user_mode(regs, r0);
> +	add_random_kstack_offset();
>   
>   	if (unlikely(r0 >= NR_syscalls)) {
>   		if (unlikely(trap_is_unsupported_scv(regs))) {
> 
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
