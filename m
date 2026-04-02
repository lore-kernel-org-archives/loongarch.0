Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CC4382389
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111957; cv=none; b=BgxwK6UyWl3DmBrMq/BPX9Gatpjx6mQz77X4O3L7Lk+ybGzof0CdZfcP3PC1o/IGmOPkXfCyCm2XozxwR+5Hl+vcetcshOX5iM0PzDPHyftPvR05yiU/MSdFLwcJ5GNFvizUSfWraYlzyVl8EjwLn+AN5jJiorKLqtFwhnHbgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111957; c=relaxed/simple;
	bh=/MwrUkLMKKXgLJCTQIB6SyMCdQ8+fD71dsqZvJeYyRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWAUMgREx7Xu4dhoRXkdSrg2VPJhKBsBIIVmQjr4ZTD6dCgPs8oATAiwKoVc+rEJS7TXmog19l2l8mr0LtZyqwx9XEQqxfXQ+wf78rLKZ1ghSB+aLQAWuixHB3VABKVdenXnOwDgCqNSK1obisAAKJFH34z8pUV+70C8OhWjJQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=deJfQ71q; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="deJfQ71q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775111953;
	bh=/MwrUkLMKKXgLJCTQIB6SyMCdQ8+fD71dsqZvJeYyRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deJfQ71q7iZ1w76QXykppMzkjTaUEMGv9sKpseJsJUpW7WDFrjoQHhnCAwPVRiWmM
	 oZHDneRG3cf0czSYWCaGsDUSUYwC+50PMCMJ7Li3Y87gAdCridMtQTmqtTnoMLJ8w0
	 zZ9WraZQ361HvLFbR2W3Pcy61X2NlvJiZnmPQFhw=
Date: Thu, 2 Apr 2026 08:39:13 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yangyang Lian <lianyangyang@kylinos.cn>, Yawei Li <liyawei@loongson.cn>, 
	George Guo <dongtai.guo@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: detect and disable sc.q if erratic
Message-ID: <b484cc9e-3582-41bf-bf5e-0a432e74a8f4@t-8ch.de>
References: <20260402044732.164294-2-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402044732.164294-2-xry111@xry111.site>

On 2026-04-02 12:47:30+0800, Xi Ruoyao wrote:

(...)

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

This probably needs to be gated behind CONFIG_AS_HAS_SCQ_EXTENSION to
avoid errors on older toolchains.

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
