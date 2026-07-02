Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C140331EB0;
	Thu,  2 Jul 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007828; cv=none; b=P92qZ2DvnQtAh6/Hw4NoYdIxL7itdgWGA+EVEjY9ZUzMuEzrQ9z61C6X4U8kWO4jKHftwuJRhauC5KrigPTv7E8Zq1GSEoyjdvbt5mz8AhKC6VpQUg92g8Z16TjrW93vxEQBTb7EFsXHA/S3oQfe9eMD06Rrw3AGC1pXaFUMlPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007828; c=relaxed/simple;
	bh=2iAoVKzQBY1Uh7UEn/Lf0QRZa8p/bvywbliuLtP54lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6lq+E/nDEteMztPyocYwLDGtkTaELDsS9S9XCHr6p+BvIiv/gCfRYNk53i3ladwkVKouyCQm7WCm5vTNGk8aWHEakB5dLsVZKY/WFpUtkEiwlYq/ZOyX5y4joGJfemHokit7OomsNwNb8KB3Hhtl/osbGwy1+stLOCyzyDhosQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJfJi47L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJfJi47L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743041F000E9;
	Thu,  2 Jul 2026 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007827;
	bh=/VIzTTQUgt1nPTnywwymt2yL+OH5Mmjv9XoixgXKKXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dJfJi47Ly/QO9LO1bFTU0f5Cb/W7dOUk3pM5wAua4eC7RImqZitnHULG2sMd4B3lt
	 l+4HqEBt6Tq1Pn1GyW/Ouyx9Uh6XqMw9qrhX0UbtWEFINtumU1PApOoeW1+bSBoZHh
	 AJF4CVZNxqDOb6cRpn/TJHmp4QQyS9rie6t9ngpHPhgIS586m3mrfN17bbcnLK3zGb
	 iLeT54ZYPzMrWugYEoSvN1GzsaGbLfIprrmX1/0/2iiNLTn9Due2HukxAo9pZ7js5m
	 KHPgWOL4Tv9hCPCOLYBJbg9yJSbmI2e7XyuL1CV/h3P+Ijf6jdbpcku3f7SCKAt5YG
	 aA9c71TG0r5VA==
Date: Thu, 2 Jul 2026 16:57:01 +0100
From: Lee Jones <lee@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Corey Minyard <minyard@acm.org>, Chong Qiao <qiaochong@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, jeffbai@aosc.io, kexybiscuit@aosc.io,
	zhuyunfei@loongson.cn, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mfd: ls2kbmc: mfd: ls2kbmc: Fix iomem pointer
 handling in video mode parsing
Message-ID: <20260702155701.GY2108533@google.com>
References: <20260624085550.1508771-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624085550.1508771-1-zhoubinbin@loongson.cn>

Please consider these:

/* Sashiko Automation: Issues Found (4 Findings) */

On Wed, 24 Jun 2026, Binbin Zhou wrote:

> Use pointers annotated with the __iomem marker for all iomem map calls,
> and creates a local copy of the mapped IO memory for future access in
> the code. memcpy_fromio() and memcpy_toio() are used to read/write data
> from/to mapped IO memory
> 
> Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603021730.Yy3QXYTw-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202606120639.WG6eb8VU-lkp@intel.com/
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
> V2:
>  - Add the missing memcpy_fromio();
>  - Drop the unnecessary `buf` variable.
> 
> Link to V1:
> https://lore.kernel.org/all/20260616115530.4012675-1-zhoubinbin@loongson.cn/
> 
>  drivers/mfd/ls2k-bmc-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe..1312812860c0 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,14 +427,20 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
>  {
> -	char *mode;
> +	char *mode __free(kfree) = NULL;
> +	void __iomem *base;
>  	int depth, ret;
>  
>  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> -	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
> +	base = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	mode = kmalloc(SZ_16M, GFP_KERNEL);

[Severity: High]
Will this 16MB allocation unconditionally fail on systems where
KMALLOC_MAX_SIZE is smaller, such as 4MB with 4K pages?

Even if successful, is it necessary to synchronously copy 16MB of device
I/O memory just to read a short resolution string?


>  	if (!mode)
>  		return -ENOMEM;
>  
> +	memcpy_fromio(mode, base, SZ_16M);

[Severity: High]
This is a pre-existing issue, but since the buffer is now allocated on the
heap via kmalloc() and copied directly from device memory, will string
functions like strncmp() and strsep() read out-of-bounds if the 16MB
region lacks a null terminator byte?


>  	/* The resolution field starts with the flag "video=". */
>  	if (!strncmp(mode, "video=", 6))
>  		mode = mode + 6;

[Severity: High]
Since mode was declared with __free(kfree), will advancing the pointer
here cause kfree() to be called with a mid-buffer pointer and crash the
allocator when ls2k_bmc_parse_mode() returns?


> 
> base-commit: c454531af72e0df811600601413bb8d3d039ed08
> -- 
> 2.52.0
> 

-- 
Lee Jones
