Received: from relay2-i.mailbaby.net (relay2-i.mailbaby.net [68.168.211.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02B79DA
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 05:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=68.168.211.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106989; cv=pass; b=CxHVv8H6RPWIy9NKSIXeF4TESSvWY44hsQQXS+fTtB0YPXLYGQRrcC9MANIgvggGmkiSgA+rzN2ZYvR7Q9XN4f9xmC7p0E1NInqPmxSAUYLHzoz43y2N11ni9TfBfnWCPs/YqtvdQ2nS/h0+g1WpXqFMGS5FgjnG7FGzjPZCFZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106989; c=relaxed/simple;
	bh=289YzEziDeP4r2KwItjuVFUUH5d548C6GtNFI17at3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgS9Z7XbS5Ef0Xfu2bJrVxbLwZzm41QBDAiM+jVYNWGX+MsvMkPciffqbLP9Y/d1sen+p+G0wdtlJNLBnVjaKH7IZc6LMKTRePODhwYTu0RcV45B3G2uTCCuTD5p4/sosde/pz4wma/yuop5GcvIhHrojfYCfKdFJcEiCdOsmco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=YuxVEgKE; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=ONgvu8Eh; arc=pass smtp.client-ip=68.168.211.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="YuxVEgKE";
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="ONgvu8Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=8GI6R1jHvDP+TxXN3UDXN9RuOxHNoJCNE8VF41TxQpQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YuxVEgKE+qiCbx+59GiHIy5YvL6Jopg/Ls2LE2xuPEvEprDApn2As5gvXsIfkR7J4B6gpRdVq
 2SZG9m7S9Ho71i5jyW58eohCEaKhvhESxwwo7NyIr9VZjvwZerwjFZo72S0kuNRK7h18M67FEJq
 Ny4U3DkrBxh/+htzsJ8eDIg=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb86144)
 by relay2-i.mailbaby.net (MailBabyMTA) with ESMTPSA id 19d4c9a43a1000c5c9.001
 for <loongarch@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Apr 2026 05:11:11 +0000
X-Zone-Loop: f0e368897c22ac13839c560aa7276ccdbf585f139378
ARC-Authentication-Results: i=1;	rspamdcluster1.mailbaby.net;	auth=pass
 smtp.auth=mb86144 smtp.mailfrom=jeffbai@aosc.io
ARC-Seal: i=1; a=rsa-sha256; d=mailbaby.net; s=detka; cv=none;
 t=1775106672;
	b=IZzxflfLFSS4F8jyVulGsYbm4zzGv0q+r26UlUw6+mquyBO1oDtlhD7cYnLKXK3EzRn5wy
	MqPNpGleFqdMDCjJ0MVi7w5iwPFmlvshQ9iNKU4g0vvPfHZgJgnvsqFdfUqcLpi3CfFLUe
	Gc3qZJCsuyHBOX0EZX/cR0C3guwwKGl2KG1ap0Ys6kqZv06HY0bjuWhFjrjTVo6nOdT7Xr
	yEHTjUaQtb0+5C4ZG7kMYK/0f0CUFpEPb72Kcz/MI2Ua1m/FKQ6H2+35tmPIJ24d56nnv2
	rvAIpI+KNPmBv49A9TrMxrP1zXmjRBe8CDuKAbx/WSFgo0eTuNrwEpCWIYgzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1775106672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=8GI6R1jHvDP+TxXN3UDXN9RuOxHNoJCNE8VF41TxQpQ=;
	b=DmhHKdkT7AQqeUYgxnjI3pOoH+RuseDL0kwZJc+VE1kKX1JgcV6JqiqpSeRdcCmJyQtPKc
	5iSKb2Qgdv+vlPc54Ic0YNxBdkoXJSCTZgZCcu4D26mBxEvGOY8EIrcCAntz6i3EizrNDI
	a/Po3E8QPwHH4oZu5Sc9i8PkA2x6P4PXRLpqzorW4CLBAXpsBbTIS0/Irp5GNvkJqKdlmq
	mbCRsDqFHwamLzCdcgxQwCUHCEI/O+zbfwly3OkfTmFJsHzreI6cUvXHgZGN8KVj9czjgi
	oxZMatHQnd0JPFmaSo7k5bl6IySQD+7Uw89NM5ewfEYS7nVrTwIxlCoTJCqjUA==
X-MB-ID: mb86144
X-SPF: pass
Feedback-ID:
 mb86144:19d4c9a43a1000c5c9:587f4d46584359477840504741595e:mbaby
X-NS-SCAN: PASS
X-MAILBABY-ORIGIN: PASS
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 77F3826344
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 05:11:02 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id BC456202DA;
	Thu,  2 Apr 2026 05:10:53 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id A6D614007D;
	Thu,  2 Apr 2026 05:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1775106651; bh=289YzEziDeP4r2KwItjuVFUUH5d548C6GtNFI17at3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ONgvu8Eh5nQDflmYQrnNnu6vmi7+WXW29XcyKBz6bXKwUALO2O+U07yBr9tBbKaBm
	 pdBdOq9UuOun5woEFhEPE7YLA+2LIWwjG2o1f8IDDuX2AKxQ4NeHGXYxstApNn4e9e
	 EVBnFNK6YZX38hM9eVK2xcW7EJDv9ntR2AKFxjQI=
Received: from [198.18.0.1] (li1563-205.members.linode.com [139.162.83.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id E53D3403F8;
	Thu,  2 Apr 2026 05:10:37 +0000 (UTC)
Message-ID: <a2afd208-b264-49c3-aea5-ad8e302dc9a1@aosc.io>
Date: Thu, 2 Apr 2026 13:10:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: detect and disable sc.q if erratic
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Arnd Bergmann <arnd@arndb.de>,
 Yangyang Lian <lianyangyang@kylinos.cn>, Yawei Li <liyawei@loongson.cn>,
 George Guo <dongtai.guo@linux.dev>, linux-kernel@vger.kernel.org
References: <20260402044732.164294-2-xry111@xry111.site>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20260402044732.164294-2-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Queue-Id: A6D614007D
X-Spamd-Result: default: False [-0.30 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	R_SPF_ALLOW(-0.10)[+mx];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Action: no action

Hi Ruoyao,

在 2026/4/2 12:47, Xi Ruoyao 写道:
> We've observed that, on some Loongson 2K3000/3B6000M systems with earlier
> firmware revisions, the sc.q instruction may write incorrect data into
> the upper half of the written 128-bit datum.
> 
> It seems upgrading the firmware (for example, the 202602 release from
> Loongson [1]) will resolve the issue. But since not all systems may be
> running the most up-to-date firmware, based on firmware update avail-
> ability and the environment in which they are running in.
> 
> To help with system compatibility and ensure correct behavior, check if
> sc.q behaves erratically and disable if so.
> 
> Link: https://github.com/loongson/Firmware/pull/156 [1]
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>   arch/loongarch/kernel/cpu-probe.c | 32 ++++++++++++++++++++++++++++++-
>   1 file changed, 31 insertions(+), 1 deletion(-)

This patch was tested on a Loongson XB6MXC0_V1.0 motherboard (Loongson 
3B6000M) and an OrangePi Nova V1.1 (Loongson 2K3000), each against 
firmware versions stable202511 (without workaround) and stable202602 
(with workaround). Both devices had sc.q disabled correctly with 
stable202511, and enabled with the latter, no instability or 
functionality issue was observed.

With that:

Tested-by: Mingcong Bai <jeffbai@aosc.io>

> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
> index 657bbae6c1c7..943e5826c71b 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -132,6 +132,36 @@ static void set_isa(struct cpuinfo_loongarch *c, unsigned int isa)
>   	}
>   }
>   
> +/*
> + * Some LoongArch has broken sc.q which incorrectly handles the upper word
> + * when the lower word is zero. Newer firmware versions (such as the 202602
> + * release from Loongson) seem to contain a workaround for this issue.
> + *
> + * Disable sc.q if erratic to ensure reliability and compatibility.
> + */
> +static bool sc_q_is_sane(void)
> +{
> +	struct {
> +		long word[2];
> +	} __aligned(16) mem;
> +	register long tmp;
> +
> +	asm (
> +		"1:ll.d\t$r0, %[mem]\n\t"
> +		"move\t%[tmp], $r0\n\t"
> +		"sc.q\t%[tmp], %[one], %[mem]\n\t"
> +		"beqz\t%[tmp], 1b"
> +		: [mem] "=ZB" (mem), [tmp] "=&r" (tmp)
> +		: [one] "r" (1));
> +
> +	if (mem.word[1] != 1) {
> +		pr_warn_once("Warning: sc.q is erratic on this platform, disabling for both kernel and HWCAP. Please try a firmware update.");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void cpu_probe_common(struct cpuinfo_loongarch *c)
>   {
>   	unsigned int config;
> @@ -177,7 +207,7 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
>   		c->options |= LOONGARCH_CPU_LAM;
>   		elf_hwcap |= HWCAP_LOONGARCH_LAM;
>   	}
> -	if (config & CPUCFG2_SCQ) {
> +	if ((config & CPUCFG2_SCQ) && sc_q_is_sane()) {
>   		c->options |= LOONGARCH_CPU_SCQ;
>   		elf_hwcap |= HWCAP_LOONGARCH_SCQ;
>   	}

