Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0803783B5
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402082; cv=pass; b=j4TWbqcH8VgC6ftsvvsSjFM8hdLYXMCWj2mBDHZohdYCcPd40rtJrelDfTA8TzpWL7wduLlbFPAiTRUKOjaugj8WaiEvib4wZZ803LLjcG0VjLMhhlmLjaBPSZYnbijB+9q7IKOhdo/j4oeTa6taWVkWS7n8IVkqvx9L80yF4fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402082; c=relaxed/simple;
	bh=KxlMKlWXMXD/QxlLWK7SzmusmJ4d9EUL+FwWEpZau7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6vHgH2FUUOJ4Dz0nlyRtyfWCBW7M7COeGOLQcMh1jNE8f+h3eULNB4wLN+D0Z9pl8hdgOTGuivVcdg4Yyu2vgLYA9+Czn7J4qLBlOilQAYfKLHgxCw6hRZam7j/Wdw8XlgCdYCvQPy6Qb+IklGPSZRbEKav2ez831aM1ceT+DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=geuHyxJ5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="geuHyxJ5"
ARC-Seal: i=1; a=rsa-sha256; t=1777402075; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a6peDCZCr9nr2ooNsefUPxl9AVagOmaXuW5aB3yf9cLqBgJtBHOvp57FGJN5d+3idAxWKof4RkJlK0z87b3otCvvjEa2AIVC4q1OnR7/yyvbTWWkIf182ZurMYpjFcxhEE2fAa+OeUfPvA9a9u1ul0s4pMPckOB4C/0JZaiXIjY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777402075; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/7wD1ACDUlmlwoUxPlUP6qXdhL+gRIQ7RT39Md36xEc=; 
	b=RBQ16mGP94B2TDA3MzEitVfNp4wVwMfVMI7WmFL9oePA7wg/iRI1clHqYEhNgH+2vip8BKL8xdi+cfq1e39Nng1jhEnSjpV4AeVwgQ7FJ0Ch1UAPl1VXC5RQh+UNaZDDDJzauu5rbqImQVupSqXMjUxtzaj/xd9D3hE5QD3jNlc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777402075;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/7wD1ACDUlmlwoUxPlUP6qXdhL+gRIQ7RT39Md36xEc=;
	b=geuHyxJ5Mq6BbbZDABk4j9OK2AQB4OZD4NCtRQ2vnvjL+TJpWCZWRA6aWjeJddw1
	Faxq1L44LIDxi+kyheSrwGTrIOUtf4jQw3t6gSHvdyKgcfm27LwmawLVIs/kjA1GpJZ
	RZ65awHeM/8OvAzTGEamRxvUN3OLAQifhc8C+W00=
Received: by mx.zohomail.com with SMTPS id 1777402073328220.35480737728676;
	Tue, 28 Apr 2026 11:47:53 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:47:40 +0000
From: Yao Zi <me@ziyao.cc>
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>, Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	George Guo <dongtai.guo@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] LoongArch: detect and disable sc.q if erratic
Message-ID: <afEAzG-k3MwazO8W@pie>
References: <20260409121936.871418-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409121936.871418-1-xry111@xry111.site>
X-ZohoMailClient: External

On Thu, Apr 09, 2026 at 08:19:34PM +0800, Xi Ruoyao wrote:
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
>  arch/loongarch/kernel/cpu-probe.c | 39 ++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
> index 657bbae6c1c7..5fcf2672172f 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -132,6 +132,43 @@ static void set_isa(struct cpuinfo_loongarch *c, unsigned int isa)
>  	}
>  }
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

Isn't this equivalent to

	long word[2] __aligned(16);

with which we could eliminate the outer structure?

And should we introduce Kconfig options like ARM64_ERRATUM_* (arm64) or
ERRATA_MIPS_P8700_PAUSE_OPCODE (RISC-V) to conditionally compile these
work arounds? This might not be an emergency, but might be useful when
there are more quirks like this coming in the future.

Otherwise this patch looks good to me,

Reviewed-by: Yao Zi <me@ziyao.cc>

Regards,
Yao Zi
