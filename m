Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45FD1E7660
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 04:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512777; cv=none; b=gwItS+9oYhpmhOOX4RJ2mdu49QJGtmoy1EIr/GYEa/X/1GelfwIoRr6ED+cPzJc8TQ5Dm5HgoS2iHpcLFiILmznPzU6VSb2FCi9jV1ewo79fTvPGWyYiOHZ7FRVlMaF1y6Ya+tPSa0Om4qqydZCB2EcEZLNe9ifOxHfQOEi4MB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512777; c=relaxed/simple;
	bh=XBYQcN7/C0qpBWKKISxo0FEn34Gsp9RL3chPdwdD+aA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CxHP/bbk2816o/lZpU/pc0TjDRsYw+zEYLuzYUehd2JZSzYucL4FPbStbHp8w4x7CR5oy8CG33IFjjiwxHagj8nun1X9Y1ok26eamhYhLD514a4x6njkQCGEOdIs7HOeVW7cT2Ut3zy8oTgxRHZ5q+7fXuVuUcWP2BQ+HpnKGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=G2OzbtKS; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="G2OzbtKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1765512766;
	bh=fOCXV5tK1dwOHv43z7DCfxRdJC/CB67r2cWZxgUH/bM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=G2OzbtKSkJPcB+3inb+K81KfTpR/Dio1hcnMVU+bQLW+S2hKhPdNef1FitT/8uR8B
	 rO2+Q8ij9dVNl8jBLyYdXiawKwmZDbWEvO02ybX4vGDV2NnAYZreobOes4INL+slWK
	 RGNxZ5OAPKKJ7YkbP7rHYu5TZmWCtTXzEBV0L6J4=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5E5F76697B;
	Thu, 11 Dec 2025 23:12:43 -0500 (EST)
Message-ID: <d00b641b2b85d5ca8dfd5c52d2a82d456b8a03fe.camel@xry111.site>
Subject: Re: [PATCH v5 1/4] LoongArch: Add SCQ support detection
From: Xi Ruoyao <xry111@xry111.site>
To: George Guo <dongtai.guo@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
  WANG Xuerui <kernel@xen0n.name>, hengqi.chen@gmail.com
Cc: r@hev.cc, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 George Guo	 <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
Date: Fri, 12 Dec 2025 12:12:41 +0800
In-Reply-To: <20251212-2-v5-1-704b3af55f7d@linux.dev>
References: <20251212-2-v5-0-704b3af55f7d@linux.dev>
	 <20251212-2-v5-1-704b3af55f7d@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-12-12 at 11:55 +0800, George Guo wrote:

> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index a2060a24b39fd78fa255816fa5518e0ee99b8a8e..47815a55b7b48bbffd4954a9b=
8bdf7021d7e234d 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -201,6 +201,10 @@ static void cpu_probe_common(struct cpuinfo_loongarc=
h *c)
> =C2=A0		c->options |=3D LOONGARCH_CPU_PTW;
> =C2=A0		elf_hwcap |=3D HWCAP_LOONGARCH_PTW;
> =C2=A0	}
> +	if (config & CPUCFG2_SCQ)
> +		c->options |=3D LOONGARCH_CPU_SCQ;
> +	else
> +		pr_warn_once("CPU does NOT support SCQ\n");

IMO this should be a pr_info_once.  CPU lacks SCQ is not anything wrong
thus this shouldn't be a warning.

> =C2=A0	if (config & CPUCFG2_LSPW) {
> =C2=A0		c->options |=3D LOONGARCH_CPU_LSPW;
> =C2=A0		elf_hwcap |=3D HWCAP_LOONGARCH_LSPW;

--=20
Xi Ruoyao <xry111@xry111.site>
